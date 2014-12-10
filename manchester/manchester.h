#ifndef _manchester_h
#define _manchester_h

#include <stdint.h>
#include "manchesterGlobal.h"


struct Queue
{
	uint8_t data[BUFFER_SIZE];
	uint8_t size;
};




//RX
void initRX(void);

int8_t popQ(struct Queue* queue);
void pushQ(struct Queue* queue, const uint8_t c);
uint8_t interpretSamples(const uint32_t samps);

void startRX(void);
void stopRX(void);

uint32_t getSamples(void);


//TX
void startTX(void);

void stopTX(void);

void sendByte(uint8_t byte);

void sendData(const uint8_t* data, uint16_t bytes);

uint16_t computeChecksum(const uint8_t* data, uint16_t bytes);



#endif


