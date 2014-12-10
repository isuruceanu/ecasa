#include <avr/io.h>
#include <avr/interrupt.h>

#include "manchester.h"
#include "manchesterGlobal.h"
#include "util.h"

volatile uint32_t samples = 0;
volatile uint8_t samplesReady = 0;
volatile int8_t sampleCount = DATA_SAMPLES - 1;
uint8_t receiving = 0, data = 0, connectionCount = 0;

void startTX(void)
{
	//set TX
	sbi(TX_DDR, TX_PIN);
	//setup Timer0 with CTC 1KHz/5 = 500Hz
	sbi(TIMSK, OCIE0A);
	OCR0A = 0x3D; //8Mhz / 64 Prescale /
	
	//set 64 bit prescale, CS02=0, CS01=1, CS00=1
	sbi(TCCR0B, CS01);
	sbi(TCCR0B, CS00);
	
	//SET CTC mode WGM2=0, WGM1=1, WGM0=0
	sbi(TCCR0A, WGM01);
}

void stopTX(void)
{
	cbi(TCCR0B, CS02);
	cbi(TCCR0B, CS01);
	cbi(TCCR0B, CS00);
}

void sendData(const uint8_t* data, uint16_t bytes)
{
	uint8_t i;
	uint16_t chsum;
	
	chsum = computeChecksum(data, bytes);
	
	//Send lots of 10s to let the receiver adjust to the signal
	//for(i = 0; i < 75; i++)
	//	{ sendByte(0);}
	
	//send last 10s and the two 01 start pulse
	//sendByte(1);
	
	for (i = 0; i < bytes; ++i)
		{ sendByte(data[i]); }
		
	sendByte((chsum >> 8));
	sendByte((chsum & 0xFF));
	
	while(TCNT0 < HALF_TIME);
	
	cbi(TX_PORT, TX_PIN);
	
}

void sendByte(uint8_t byte)
{
	unsigned char i = 0;
	
	do
	{
		if(isset(byte, 7-i))
		{
			while(!isset(TIFR, OCF0A)); //wait OCR0A to match 
			cbi(TX_PORT, TX_PIN);       //set TX pin to low
			sbi(TIFR, OCF0A);			// reset Timer0
			
			while(!isset(TIFR, OCF0A)); //wait OCR0A to match
			sbi(TX_PORT, TX_PIN);       //set TX pin to high 
			sbi(TIFR, OCF0A);
		}
		else
		{
			while(!isset(TIFR, OCF0A)); //wait OCR0A to match 
			sbi(TX_PORT, TX_PIN);       //set TX pin to high
			sbi(TIFR, OCF0A);			// reset Timer0
			
			while(!isset(TIFR, OCF0A)); //wait OCR0A to match
			cbi(TX_PORT, TX_PIN);       //set TX pin to low 
			sbi(TIFR, OCF0A);
		}
	i++;	
	} while(i < 8);
}

uint16_t computeChecksum(const uint8_t* data, uint16_t bytes)
{
	uint16_t sum1 = 0xFF;
	uint16_t sum2 = 0xFF;
	
	uint16_t wordLen;
	
	while(bytes)
	{
		wordLen = (bytes > 20) ? 20 : bytes;
		
		bytes -= wordLen;
		
		do
		{
			sum1 += *(data++);
			sum2 += sum1;
		} while(--wordLen);
		
		sum1 = (sum1 & 0xFF) + (sum1 >> 8);
		sum2 = (sum2 & 0xFF) + (sum2 >> 8);
	}
	
	sum1 = (sum1 & 0xFF) + (sum1 >> 8);
	sum2 = (sum2 & 0xFF) + (sum2 >> 8);
	
	return sum2 << 8 | sum1;
}

void initRX(void)
{
	//set RX pin as input
	cbi(RX_DDR, RX_PIN);
	
	//set LED as output
	sbi(RX_DDR, LED);
	
	//Enable pin change interrupt
	sbi(GIMSK, PCIE);
	
	//Watch pin change on pin
	sbi(PCMSK, PCINT4); // this is hard coded to pin 4
	
	//enable Timer1 with clk/4096 prescaling. Timer1 is used for timing out the connection piple
	//TCCR1 |= 0x0D; //todo: check the value;
	TCCR1B |= (1 << CS12) | (1 << CS10);
	
	//enable the overflow interrupt for Timer1
	sbi(TIMSK, TOIE1);
	
	//sample every 100 µs
	OCR1A = SAMPLE_TIME;
	
	/* Enable the output compare interrupt for Timer0 */
	sbi(TIMSK, OCIE0A);
	
	//enable Timer0 with clk/8 prescaling gives 1µs per cycle @8Mhz. Timer0 is used for sampling
	//todo: as I will use usb which running at 12Mhz need to recheck 
	
	sbi(TCCR0B, CS01);

}

void startRX(void)
{
	uint8_t preambleBit, lows = 0, highs = 0;
	
	sei();
	
	TCNT0 = TCNT1 = 0;
	
	receiving = 1;
	sampleCount = 3;
	
	samples = 0;
	
	while(receiving)
	{
		if(samplesReady)
		{
			preambleBit = getSamples();
			sampleCount= 3;
			
			if (preambleBit == LOW)
			{
				if(!highs) ++lows;
				else
					lows = highs = 0;
			}
			else if(preambleBit == HIGH)
			{
				if (lows >= 6)
				{
					if (++highs >= 2) break;
				}
				else
					lows = highs = 0;
			}
			else
			{
				lows = highs = 0;
				
				/*
				 * If there's a one-sample error, make the next samples finish earlier so the
				 * next sampling starts one sample earlier. This means that it takes at most
				 * 3 samplings to get valid bits. The timing is not a problem since the Pin
				 * change interrupt makes sure that any pin changes occur exactly between two
				 * samples, therefore there can only be sample errors and not timing errors
				 * (I think).
				*/
				sampleCount = 2;
			}
		}
	}
	
	/* Normal sampling now */
	sampleCount = DATA_SAMPLES - 1;
}

void stopRX(void)
{
	/* Stop the wait for the preamble if it's still running,
		else stop waiting for samples in main */
	receiving = 0;
	/* Disable sampling Timer/Counter */
	cbi(TIMSK,OCIE0A);
}

int8_t popQ(struct Queue* queue)
{
	unsigned char i = 0, j = 0;
	char item = queue->data[0];
	
	//push all items one further in the queue
	for(; j < queue->size; ++j, ++i)
	{ queue->data[i] = queue->data[j];}
	
	//delete last item
	queue->data[--queue->size] = 0;
	
	return item;
}

void pushQ(struct Queue* queue, const uint8_t c)
{
	if(queue->size < BUFFER_SIZE)
	queue->data[queue->size++] = c;
}

uint32_t getSamples(void)
{
	samplesReady = 0;
	return samples;
}

uint8_t interpretSamples(const uint32_t samps)
{
	int8_t i = 7;
	uint8_t bit;
	for(; i>=0; --i)
	{
		//grab current bit
		bit = (samps >> (i*4)) & 0x0F;
		if (bit == HIGH) sbi(data, i);
		else if (bit == LOW) cbi(data, i);
		else return 0;
	}
	return 1;
}

ISR(TIMER1_OVF_vect)
{
	if(++connectionCount >= CONNECTION_TIME)
	{
		connectionCount = 0;
		stopRX();
	}
}

ISR(PCINT_vect)
{
	 /* Set the timer to what it should be at the pin change. 52 instead
		of 50 because of ISR-call overhead. */
	
	TCNT0 = 52;
}

ISR(TIMER0_COMPA_vect)
{
	//if the current sample reads high set current bit in the samples
	if(isset(RX_PORT, RX_PIN))
	{
		//reset timer now after sampling
		TCNT0 = 1;
		sbi(samples, sampleCount);
	}
	//else clear the current bit
	else
	{
		TCNT0 = 1;
		cbi(samples, sampleCount);
	}
	
	if (!sampleCount--)
	{
		samplesReady = 1;
		sampleCount = DATA_SAMPLES - 1;
	}
}