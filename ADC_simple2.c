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
void InitADC(void);				//initalizes analog to digital
unsigned int ReadADC(unsigned char channel);//reads analog to digital voltage
//main program***************************************************
//global variables
unsigned char old_digital = 0x00; //present value of analog to digital conversion
unsigned char new_digital; 		//new values of analog to digital conversion
void main(void)
{
initialize_ports(); 			//initialize ports
InitADC();
while(1){//main loop
	new_digital = ReadADC(0x20);//read analog input on PORTC pin0, left justify
	if(new_digital != old_digital){ //process change
		
		if(new_digital>175){
		  PORTB=0x00;
		  PORTB=0xff
		}
		else if(new_digital>150{
		  PORTB=0x7f
		}
		else if(new_digital>125{
		  PORTB=0x3f
		}
		else if(new_digital>100){
		  PORTB=0x1f;	
		}
		else if(new_digital>75){
		  PORTB=0x0f;
		}
		else if(new_digital>50){
		  PORTB=0x07;
		}
		else if(new_digital>25){
		  PORTB=0x03;
		}
		else(
		  PORTB=0x01;
		)						//in PORTB input
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
//InitADC: initialize analog-to-digital converter
//*************************************************************
void InitADC( void)
{
PRR=0x00;//Power Reduction Register, zeros shut off all power reduction 
ADMUX = 0; //Select channel 0
ADCSRA = 0xC3; 	/*Enable ADC & start 1st dummy conversion Set ADC module prescalar to 8 critical for accurate ADC results*/
while (!(ADCSRA & 0x10)); 	//Check if conversation is ready
ADCSRA |= 0x10; //Clear conv rdy flag - set the bit, reset interupt flag
}
//*************************************************************
//ReadADC: read analog voltage from analog-to-digital converter -
//the desired channel for conversion is passed in as an unsigned
//character variable. The result is returned as a left justified,
//10 bit binary result. The ADC prescalar must be set to 8 to
//slow down the ADC clock at higher external clock frequencies
//(10 MHz) to obtain accurate results.
//*************************************************************
unsigned int ReadADC(unsigned char channel)
{
unsigned int binary_weighted_voltage, binary_weighted_voltage_low;
unsigned int binary_weighted_voltage_high; //weighted binary voltage
unsigned int most_significantbits;
ADMUX = channel; //Select channel
ADCSRA |= 0x43; //Start conversion
//Set ADC module prescalar
//to 8 critical for
//accurate ADC results
while (!(ADCSRA & 0x10)); //Check if converstion is
//ready
ADCSRA |= 0x10; //Clear Conv rdy flag - set
//the bit
/*binary_weighted_voltage_low = ADCL; //Read 8 low bits first
//(important)
//Read 2 high bits,
//multiply by 256
binary_weighted_voltage_high = ((unsigned int)(ADCH << 8));
binary_weighted_voltage = binary_weighted_voltage_low | binary_weighted_voltage_high;*/
most_significantbits=ADCH;
return most_significantbits; //ADCH:ADCL
}
//*************************************************************

