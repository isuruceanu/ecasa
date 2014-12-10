#include<avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

#include "util.h"
#include "manchester.h"


int main(void)
{

	//set PB1 as output for LED
	sbi(DDRB, PB1);
	cbi(PORTB, PB1);
	
	//set PB0 as input for button as a trigger
	cbi(DDRB, PB0);
	sbi(PORTB, PB0);
	
	//set PB2 as TX
	sbi(DDRB, PB2);
	cbi(PORTB, PB2);
	
	
	startTX();
	while(1)
	{
		if (bit_is_clear(PINB, 0))
		{
			sbi(PORTB, PB1);
			sendByte(1);
			_delay_ms(500);
			cbi(PORTB, PB1);
			
		}
			
	}
	
	return 0;

}