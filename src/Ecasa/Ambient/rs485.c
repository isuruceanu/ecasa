/*
 * rs485.c
 *
 * Created: 12/24/2014 9:49:57 PM
 *  Author: Ion
 */ 
#include "rs485.h"
#include "util.h"
#include "rs485errors.h"
#include "errorBuffer.h"

#ifndef BAUD
#warning "BAUD was not defined Assuming 34,800"
#define BAUD 34800
#endif

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include <util/setbaud.h>
#include <stddef.h>

#ifndef RS485_DIR_DDR
#warning "RS485_DIR_DDR not defined. Assuming DDRA"
#define RS485_DIR_DDR DDRA
#endif

#ifndef RS485_DIR_DDPIN
#warning "RS485_DIR_DDPIN not defined. Assuming DDD1"
#define RS485_DIR_DDPIN DDD1
#endif


#ifndef RS485_DIR_PORT
#warning "RS485_DIR_PORT not defined. Assuming PORTA"
#define RS485_DIR_PORT PORTA
#endif


#ifndef RS485_DIR_PIN
#warning "RS485_DIR_PIN not defined. Assuming PA1"
#define RS485_DIR_PIN PA1
#endif


typedef enum {
	NEED_INIT = 0,					// Component not initialiZed yet.
	AWAIT_REQUEST_FETCH_ADDRESS,	// First "real" state, RS485 slave waiting for request from master.
	AWAIT_REQUEST_FETCH_COMMAND,    // After the address we expect the parameter bytes. First one is "command".
	AWAIT_REQUEST_FETCH_NBPARAMS,	// Now read the number of parameters (might be 0).
	AWAIT_REQUEST_FETCH_PARAMS,		// Finally read as many parameter bytes as signaled by the master.
	DEMAND_PROCESSING,				// Now the request has to be processed.
	EXPECT_RESPONSE,    			// Request from master received. Master expects response.
	RETURN_SUBSEQUENT_RETVALS		// Subsequent response bytes.
} State;

static State _state = NEED_INIT;

static rs485_request _receivedMessage;
static unsigned char _address = 0;
static unsigned char _currentRequestIndex = 0;
static errorBuffer _lasError;

static rs485_response _responseMessage;
static unsigned char _currentResponseIndex = 0;

rs485_Error status(const rs485_Error error)
{
	if(OK != error) push(&_lasError, error);
	return error;
}


rs485_Error rs485_initialize(const unsigned char address)
{
	if(0 == address) return status(BAD_ADDRESS);
	if(RESPONSE_IS_EXPECTED <= address) return status (BAD_ADDRESS);
	
	cli(); //disable interrupts
	
	sbi(RS485_DIR_DDR, RS485_DIR_DDPIN);
	cbi(RS485_DIR_PORT, RS485_DIR_PIN); //set rs485 transceiver to receive.
	
	UBRRH = UBRRH_VALUE;
	UBRRL = UBRRL_VALUE;
	
	#if USE_2X
		sbi(UCSRA, U2X);
	#else
		cbi(UCSRA, U2X);
	#endif
	
	UCSRA |= (1 << TXC);
	UCSRA |= (1 << MPCM);
	
	UCSRB = (1 << TXEN) | (1 << RXEN) | (1 << RXCIE) | (1 << TXCIE) | (1 << UCSZ2);
	UCSRB &= ~(1 << TXB8);
	
	UCSRC |= (1 << UCSZ0) | (1 << UCSZ1) | (1 << UCSZ2);
	
	_address = address;
	_state = AWAIT_REQUEST_FETCH_ADDRESS;
	init(&_lasError);
	
	sei();
	return OK;	
}

bool rs485_messageAvailable()
{
	return DEMAND_PROCESSING == _state;
}

rs485_Error rs485_consumeRequest(rs485_request *request)
{
	if(! rs485_messageAvailable()) return status(REQUEST_NOT_AVAILABLE);
	if (NULL == request) return status(REQUEST_NULL_BUFFER);
	
	request->address = _receivedMessage.address;
	request->command = _receivedMessage.command;
	request->numberOfParams = _receivedMessage.numberOfParams;
	
	for (unsigned char i = 0; i < _receivedMessage.numberOfParams; i++)
	{
		request->parameter[i] = _receivedMessage.parameter[i];
	}
	
	_state = isResponseExpected(&_receivedMessage) ? EXPECT_RESPONSE : AWAIT_REQUEST_FETCH_ADDRESS;
	
	return OK;
}

rs485_Error rs485_send(const rs485_response *response)
{
	if (EXPECT_RESPONSE != _state) return status(RESPONSE_NOT_EXPECTED);
	_delay_ms(RS485_SWITCHING_DELAY); //allow master to switch from sending to receiving
	sbi(RS485_DIR_PORT, RS485_DIR_PIN); //transceiver to send
	
	_responseMessage.numberOfParams = response->numberOfParams;
	for (unsigned char i = 0; i < response->numberOfParams; i++)
	{
		_responseMessage.parameter[i] = response->parameter[i];
	}
	
	_state = RETURN_SUBSEQUENT_RETVALS;
	_currentResponseIndex = 0;
	
	while(! (UCSRA & (1 << UDRE))); //wait until hardware send buffer is ready
	
	UDR = _responseMessage.numberOfParams;
	
	return OK;
}


rs485_Error rs485_lastError()
{
	return pop(&_lasError);
}

bool rs485_tooManyErrors()
{
	return overflow(&_lasError);
}

bool isResponseExpected( const rs485_request* request )
{
	return request->address > RESPONSE_IS_EXPECTED;
}

ISR(USART_RX_vect)
{
	cbi(UCSRC, RXCIE); //disable interrupt on receive
	
	if((AWAIT_REQUEST_FETCH_ADDRESS != _state ) && (UCSRB & (1 << RXB8)))
	{
		_state = AWAIT_REQUEST_FETCH_ADDRESS;
		status(STATE_MACHINE_RESET);
	}
	
	const unsigned char currentByte = UDR;
	
	switch(_state)
	{
		case AWAIT_REQUEST_FETCH_ADDRESS:
			if (0 != currentByte && _address != (currentByte & ~RESPONSE_IS_EXPECTED)) break;
			cbi(UCSRA, MPCM); //Multi-processor off
			_receivedMessage.address = currentByte;
			_state = AWAIT_REQUEST_FETCH_COMMAND;
			break;
		case AWAIT_REQUEST_FETCH_COMMAND:
			_receivedMessage.command = currentByte;
			_state = AWAIT_REQUEST_FETCH_NBPARAMS;
			break;
		case AWAIT_REQUEST_FETCH_NBPARAMS:
			_receivedMessage.numberOfParams = currentByte;
			if(0 == currentByte) {
				_state = DEMAND_PROCESSING;
				sbi(UCSRA, MPCM); //Multi-processor on
			}
			else {
				_currentRequestIndex = 0;
				_state = AWAIT_REQUEST_FETCH_PARAMS;
			}
			break;
		case AWAIT_REQUEST_FETCH_PARAMS:
			_receivedMessage.parameter[_currentRequestIndex++] = currentByte;
			if (_currentRequestIndex < _receivedMessage.numberOfParams) break;
			_state = DEMAND_PROCESSING;
			sbi(UCSRA, MPCM); //Multi-processor on
			break;
		case DEMAND_PROCESSING:
			status(REQUEST_DROPPED);
			break;
		default:
			sbi(UCSRA, MPCM); //Multi-processor on
			_state = AWAIT_REQUEST_FETCH_ADDRESS;
			status(INVALIDE_RECEIVING_STATE);
			break;
	}
	
	sbi(UCSRB, RXCIE); //enable receiving interrupts
}

ISR(USART_TX_vect)
{
	cbi(UCSRB, TXCIE); //disable interrupts;
	
	switch (_state)
	{
		case RETURN_SUBSEQUENT_RETVALS:
			if (_currentResponseIndex < _responseMessage.numberOfParams)
			{
				while(UCSRA & (1 << UDRE)); //wait until hardware buffer is ready
				UDR = _responseMessage.parameter[_currentResponseIndex++];
			} else {
				cbi(RS485_DIR_PORT, RS485_DIR_PIN); // Set RS485 transceiver to receive.
				_state = AWAIT_REQUEST_FETCH_ADDRESS;
			}
			break;
		default:
			cbi(RS485_DIR_PORT, RS485_DIR_PIN); // Set RS485 transceiver to receive.
			sbi(UCSRA, MPCM); //Multi-processor on
			_state = AWAIT_REQUEST_FETCH_ADDRESS;
			status(INVALIDE_SENDING_STATE);
			break;
	}
	
	sbi(UCSRB, TXCIE); //disable interrupts;
}
