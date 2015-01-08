#include "dht.h"
#include <avr/interrupt.h>
#include <util/delay.h>
#include "util.h"

DHT_ERROR_t readDHT(unsigned char dht_pin, unsigned char *dht_data)
{
	unsigned char i, j;
	dht_data[0] = dht_data[1] = dht_data[2] = dht_data[3] = dht_data[4] = 0;	
	sbi(DHT_DDR, dht_pin);
	cbi(DHT_PORT, dht_pin);
		
	_delay_ms(18);

	sbi(DHT_PORT, dht_pin);
	cbi(DHT_DDR, dht_pin);
	
	_delay_us(50); 
	
	if (DHT_PIN&(1<<dht_pin)) return DHT_ERROR_NOT_PRESENT;
	
	_delay_us(80);
	
	if (!(DHT_PIN&(1<<dht_pin))) return DHT_ERROR_ACK_TOO_LONG;
	cli(); //disable interrupts here
	while (DHT_PIN&(1<<dht_pin));
	
	for (j=0; j<5; j++)
    {
		for(i=0; i<8; i++)
        {
			while (!(DHT_PIN&(1<<dht_pin)));
			_delay_us (30);
		
			if (DHT_PIN&(1<<dht_pin)) 
				dht_data[j]|=1<<(7-i);
			
			while (DHT_PIN&(1<<dht_pin));
        }
    }
    	
	sei();	
	if (dht_data[4] == ((dht_data[0] + dht_data[1] + dht_data[2] + dht_data[3]) & 0xFF))
	{
        return DHT_ERROR_NONE;
	}
	
	return DHT_ERROR_CHECKSUM;
}
