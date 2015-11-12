//*************************************************************
//file name: testbench_atmega48_trial1.c
//function: provides test bench for ATMEL AVR ATmega48 controller
//target controller: ATMEL ATmega48
//
//ATMEL AVR ATmega48 Controller Pin Assignments
//Chip Port Function I/O Source/Dest Asserted Notes
//*************************************************************
//Pin 1 Reset
//*************************************************************
//Pin 1
//Pin 2 
//Pin 3 
//Pin 4 
//Pin 5 
//Pin 6 
//Pin 7 
//Pin 8 
//Pin 9 
//Pin 10 
//Pin 11 
//Pin 12 
//Pin 13 
//Pin 14 
//Pin 15 
//Pin 16 
//Pin 17 
//Pin 18 
//Pin 19 
//Pin 20 
//Pin 21 
//Pin 22
//Pin 23
//Pin 24 
//Pin 25
//Pin 26 
//Pin 27 
//Pin 28 
//Pin 29 
//Pin 30 
//Pin 31 
//Pin 32 
//Pin 33 
//Pin 34 
//Pin 35 
//Pin 36 
//Pin 37 
//Pin 38 
//Pin 39 
//Pin 40 
//
//orginal authors: Steven Barrett and Daniel Pack
//modifying author: Barry Blaha
//created: July 12, 2007
//last revised: February 25, 2008
//***************************************************************
//include files**************************************************
#include<iom48v.h> 				//ImageCraft ICC AVR
								//include file
//for ATmega48
//function prototypes********************************************
void initialize_ports(void); 	//initializes ports
void USART_init(void)			//initializes USART
unsigned char USART_receive(void) //initalizes USART receive

//main program***************************************************
//global variables
unsigned char old_digital = 0x00; //present value of analog to digital conversion
unsigned char new_digital; 		//new values of analog to digital conversion
void main(void)
{
initialize_ports(); 			//initialize ports
InitADC();
while(1){//main loop
	new_digital = USART_receive();//read USART incoming transmision
	if(new_digital != old_digital){ //process change
		PORTB=new_digital;			//in PORTB input
	  } 						//end if new_PORTC
		old_digital=new_digital;//update PORTC
	} 							//end while(1)
} 								//end main
//***************************************************************
//function definitions
//***************************************************************
//***************************************************************
//initialize_ports: provides initial configuration for I/O ports
//***************************************************************
void initialize_ports(void)
{

DDRB=0xff;						//PORTB as output
PORTB=0x00;						//initialize PORTB low
	//PORTB is the output port

DDRC=0x00; 						//PORTC[7:0] as input
PORTC=0x00; 					//disable PORTC
	//pull-up resistors

DDRD=0xff; 						//set PORTD as output
PORTD=0x00; 					//initialize low
	//port D is not being used
}
//***************************************************************



//*************************************************************
//USART_init: initializes the USART system
//*************************************************************
void USART_init(void)
{
UCSRA = 0x00; //control register initialization
UCSRB = 0x08; //enable transmitter
UCSRC = 0x06; //async, no parity, 1 stop bit,
//8 data bits
//Baud Rate initialization
UBRRH = 0x00;
UBRRL = 0x40;
}
//*************************************************************

//*************************************************************
//USART_receive: receives single byte of data
//*************************************************************
unsigned char USART_receive(void)
{
while((UCSRA & 0x80)==0x00) //wait for RXC flag
{
;
}
data = UDR; //retrieve data from UDR
return data;
}
//*************************************************************