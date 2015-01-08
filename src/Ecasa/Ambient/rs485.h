/*
 * rs485.h
 *
 * Created: 12/24/2014 9:50:31 PM
 *  Author: Ion
 */ 


#ifndef RS485_H_
#define RS485_H_

#include "rs485errors.h"
#include <stdbool.h>

#define RTS_PIN PA1
#define RTS_DDR DDRA
#define RTS_PORT PORTA

#define RS485_SWITCHING_DELAY 5

#define MAX_PARAMETER_BYTES 8

static const unsigned char RESPONSE_IS_EXPECTED =128;

typedef struct  
{
	unsigned char address;
	unsigned char command;
	unsigned char numberOfParams;
	unsigned char parameter[MAX_PARAMETER_BYTES];
} rs485_request;

typedef struct  
{
	unsigned char numberOfParams;
	unsigned char parameter[MAX_PARAMETER_BYTES];
} rs485_response;

rs485_Error rs485_initialize(const unsigned char address);

bool rs485_messageAvailable();

rs485_Error rs485_consumeRequest(rs485_request *request);

rs485_Error rs485_send(const rs485_response *response);

rs485_Error rs485_lastError();

bool rs485_tooManyErrors();

bool isResponseExpected( const rs485_request* request );


#endif /* RS485_H_ */