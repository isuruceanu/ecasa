/*
 * errorBuffer.h
 *
 * Created: 1/3/2015 7:33:24 PM
 *  Author: Ion
 */ 


#ifndef ERRORBUFFER_H_
#define ERRORBUFFER_H_

#include <stdbool.h>

#define MAX_ERRORS 8

typedef struct 
{
	unsigned char data[MAX_ERRORS];
	unsigned char current;
	bool overflow;
}errorBuffer;

void init(errorBuffer *buffer);
bool push(errorBuffer *buffer, const unsigned char error);
unsigned char pop(errorBuffer *buffer);
unsigned char peek(const errorBuffer *buffer);
bool overflow(const errorBuffer *buffer);

#endif /* ERRORBUFFER_H_ */