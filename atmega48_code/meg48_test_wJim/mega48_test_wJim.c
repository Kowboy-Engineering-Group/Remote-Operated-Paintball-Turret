#include<iom48v.h> 				//ImageCraft ICC AVR
								//include file
//for ATmega48
//function prototypes********************************************
void initialize_ports(void); 	//initializes ports
//main program***************************************************
//global variables

void main(void)
{
initialize_ports(); 			//initialize ports
while(1){//main loop{
	if(PINC==1){
			PORTD=0x01;
	}
	if(PINC==0){
			PORTD=0x00;
	}
	}
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

DDRC=0xFE; 						//PORTC[7:0] as input
PORTC=0x00; 					//disable PORTC
	//pull-up resistors

DDRD=0xff; 						//set PORTD as output
PORTD=0x00; 					//initialize low
	//port D is the output port with LEDS
}
//***************************************************************
