#define FOSC 1843200 // Clock Speed
#define BAUD 9600
#define MYUBRR FOSC/16/BAUD-1
#include<iom48v.h> 				//ImageCraft ICC AVR

void initialize_ports(void); 	//initializes ports
void USART_Transmit( unsigned char ); //transmits data
void USART_Init(void); //initializes USART

void main( void )
{
initialize_ports(); 			//initialize ports
USART_Init();				//initialize transmitter

while(1){
	USART_Transmit(0x44);			//transmit 
	}
	
}

/*********************************************/
void USART_Init(void)
{
/*Set baud rate */
UBRR0H = 0x00; 	  	//instead of using ubrr use values from barretts primer example
UBRR0L = 0x40;
/*Enable transmitter 0x08=0b00001000*/
UCSR0B = 0x08;
/* 0b00000110=0x06 async,no parity,1 stop bit, 8 bit width. see page 194 of data sheet */
UCSR0C = 0x06;
/*                                    */
UCSR0A = 0x00;
}

/*********************************************/


void USART_Transmit( unsigned char data )
{
/* Wait for empty transmit buffer */
while ( !( UCSR0A & (1<<UDRE0)) )
;
/* Put data into buffer, sends the data */
UDR0 = data;
}

//***************************************************************
void initialize_ports(void)
{

DDRB=0xff;						//PORTB as output
PORTB=0xff;						//initialize PORTB high
	//PORTB is not being used

DDRC=0x00; 						//PORTC[7:0] as input
PORTC=0x00; 					//disable PORTC
	//pull-up resistors

DDRD=0xff; 						//set PORTD as output
PORTD=0xff; 					//initialize high
	//port D is transmitting usart on channel 1 pin 3
}
//***************************************************************