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
//Pin 1 PB0
//Pin 2 PB1
//Pin 3 PB2
//Pin 4 PB3
//Pin 5 PB4 
//Pin 6 PB5 
//Pin 7 PB6 
//Pin 8 PB7 
//Pin 9 Reset
//Pin 10 VDD
//Pin 11 Gnd
//Pin 12 Resonator
//Pin 13 Resonator
//Pin 14 PD0 to tristate LED indicator
//Pin 15 PD1 to tristate LED indicator
//Pin 16 PD2 to tristate LED indicator
//Pin 17 PD3 to tristate LED indicator
//Pin 18 PD4 
//Pin 19 PD5 
//Pin 20 PD6 
//Pin 21 PD7 
//Pin 22 PC0 to active high RC debounced switch
//Pin 23 PC1 to active high RC debounced switch
//Pin 24 PC2 to active high RC debounced switch
//Pin 25 PC3 to active high RC debounced switch
//Pin 26 PC4
//Pin 27 PC5
//Pin 28 PC6
//Pin 29 PC7
//Pin 30 AVcc to VDD
//Pin 31 AGnd to Ground
//Pin 32 ARef to Vcc
//Pin 33 PA7
//Pin 34 PA6
//Pin 35 PA5
//Pin 36 PA4
//Pin 37 PA3
//Pin 38 PA2
//Pin 39 PA1
//Pin 40 PA0
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
void delay_5ms(void);
//main program***************************************************
//global variables
unsigned char old_PORTC = 0x00; //present value of PORTC
unsigned char new_PORTC; 		//new values of PORTC
unsigned char countser = 0;		//counter
void main(void)
{
initialize_ports(); 			//initialize ports
TURN_LEDS_ON();
/*
while(1){
		 new_PORTC = PINC; 			//read PORTC
		 if(new_PORTC != old_PORTC){ //process change
		 		PORTD=0x00;
				countser=0;
				while(countser<100){
					countser=countser+1;
				}	  
				PORTD=0xff;
				countser=0;
				while(countser<100){
					countser=countser+1;
				}	 
				PORTD=0x00;
		 }
		}
} */								//end main
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
	//PORTB is not being used

DDRC=0x00; 						//PORTC[7:0] as input
PORTC=0x00; 					//disable PORTC
	//pull-up resistors

DDRD=0xff; 						//set PORTD as output
PORTD=0xff; 					//initialize high
	//port D is the output port with LEDS
}
//***************************************************************
DDRD=0xff;

void delay_5ms()
{
	for(i=0; i<400; i++)
	{
		asm(nop);
	}
}

void TURN_LEDS_ON()
{
		PORTD = 0x01; //turn on the least significant LED
		delay_5ms();
		PORTD = 0x03;  //turn on the 2 LEDs
		delay_5ms();
		PORTD = 0x07;  //turns on 3 LEDS
		delay_5ms();
		PORTD = 0x0f;  //turns on 4 LEDs
		delay_5ms();
		PORTD = 0x1f;  //turns on 5 LEDS
		delay_5ms();
		PORTD = 0x3f;  //turns on 6 LEDS
		delay_5ms();
		PORTD = 0x7f;  //turns on 7 LEDS
		delay_5ms();
		PORTD = 0xff; //turns on all 8 LEDs
		delay_5ms();
}

