/*
 * errorBuffer.c
 *
 * Created: 1/3/2015 7:41:31 PM
 *  Author: Ion
 */ 

#include "errorBuffer.h"
#include <avr/interrupt.h>

void init(errorBuffer *buffer)
{
	buffer->current = 0;
	buffer->overflow = false;
}

bool push(errorBuffer *buffer, const unsigned char error)
{
	cli();
	if (buffer->current >= MAX_ERRORS) {
		buffer->overflow = true;
		sei();
		return false;
	}
	
	buffer->data[buffer->current++] = error;
	sei();
	return true;
}

unsigned char pop(errorBuffer *buffer)
{
	if (0 == buffer->current) return 0;
	cli();
	buffer->overflow = false;
	
	unsigned char last = buffer->data[--buffer->current];
	sei();
	return last;
}

unsigned char peek(const errorBuffer *buffer)
{
	if (0 == buffer->current) return 0;
	return buffer->data[buffer->current -1];
}

bool overflow(const errorBuffer *buffer)
{
	return buffer->overflow;
}