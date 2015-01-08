/*
* Ambient.c
*
* Created: 12/23/2014 9:37:44 PM
*  Author: Ion
*/


#include <avr/io.h>
#include <util/delay.h>

#include "rs485.h"
#include "dht.h"
#include "util.h"
#include "rs485Message.h"

rs485_request _request;
rs485_response _response;

void rs485(void);
void rs485DirectAddressed(void);
void rs485Broadcast(void);

int main(void)
{
	sbi(DDRB, PB5);
	rs485_initialize(1);
	
	while(1)
	{
		rs485();
		
	}
}

void rs485(void)
{
	if (rs485_messageAvailable())
	{
		rs485_consumeRequest(&_request);
		
		if (0 == _request.address)
		{
			//--Broadcast
			rs485Broadcast();
		}
		else
		{
			//-Directly addressed
			rs485DirectAddressed();
			
			if (isResponseExpected(&_request)) rs485_send(&_response);
		}
	}
	
	//manage errorBuffers here
}

void rs485Broadcast(void)
{
	switch(_request.command){
	case RS485_BDC_STATUS_LED_OFF:
		cbi(PORTB, PB5);
		break;
	case RS485_BDC_STATUS_LED_ON:
		sbi(PORTB, PB5);
		break;
	}
}

void rs485DirectAddressed(void)
{
	
}