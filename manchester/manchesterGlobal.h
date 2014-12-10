// manchesterGlobal.h
#ifndef _manchesterGlobal_h
#define _manchesterGlobal_h

//#define F_CPU 8000000L

//2500 bits per second
#define BAUND_RATE 2500


/* The time for one bit in µs/cycles */
#define BIT_TIME 400

#define HALF_TIME 200


/* The time between samples in µs/cycles */
#define SAMPLE_TIME 100

#define DATA_SAMPLES 32

#define TX_DDR  DDRB
#define TX_PORT PORTB
#define TX_PIN  PB2

#define RX_DDR  DDRB
#define RX_PORT PORTB
#define RX_PIN  PB4

#define LED PB5

#define HIGH 0b0011
#define LOW  0b1100

#define CONNECTION_TIME 177
#define BUFFER_SIZE 128


#endif
