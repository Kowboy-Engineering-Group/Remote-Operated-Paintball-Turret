//*************************************************************
//file name: testbench_atmega48_trial1.c
//function: provides test bench for ATMEL AVR ATmega48 controller
//target controller: ATMEL ATmega48
//
//ATMEL AVR ATmega48 Controller Pin Assignments
//Chip Port Function I/O Source/Dest Asserted Notes

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
//main program***************************************************
//global variables
unsigned char old_PORTC = 0x00; //present value of PORTC
unsigned char new_PORTC; 		//new values of PORTC
void main(void)
{
initialize_ports(); 			//initialize ports
while(1){//main loop
	new_PORTC = PINC; 			//read PORTC
	if(new_PORTC != old_PORTC){ //process change
			PORTB=PINC;
	  } 						//end if new_PORTC
		old_PORTC=new_PORTC; 	//update PORTC
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
	//PORTB is not being used

DDRC=0x00; 						//PORTC[7:0] as input
PORTC=0x00; 					//disable PORTC
	//pull-up resistors

DDRD=0xff; 						//set PORTD as output
PORTD=0x00; 					//initialize low
	//port D is the output port with LEDS
}
//***************************************************************

