	.module mega48_test_wJim.c
	.area text(rom, con, rel)
	.dbfile G:\mega48\mega48_test_wJim.c
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 10
; #include<iom48v.h> 				//ImageCraft ICC AVR
; 								//include file
; //for ATmega48
; //function prototypes********************************************
; void initialize_ports(void); 	//initializes ports
; //main program***************************************************
; //global variables
; 
; void main(void)
; {
	.dbline 11
; initialize_ports(); 			//initialize ports
	rcall _initialize_ports
	rjmp L3
L2:
	.dbline 12
; while(1){//main loop{
	.dbline 13
; 	if(PINC0==1){
	rjmp L5
L5:
	.dbline 16
; 			PORTD=0x01;
; 	}
; 	if(PINC0==0){
	.dbline 16
	.dbline 17
; 			PORTD=0x00;
	clr R2
	out 0xb,R2
	.dbline 18
; 	}
L7:
	.dbline 19
; 	}
L3:
	.dbline 12
	rjmp L2
X0:
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e initialize_ports _initialize_ports fV
	.even
_initialize_ports::
	.dbline -1
	.dbline 28
; } 								//end main
; //***************************************************************
; //function definitions
; //***************************************************************
; //***************************************************************
; //initialize_ports: provides initial configuration for I/O ports
; //***************************************************************
; void initialize_ports(void)
; {
	.dbline 30
; 
; DDRB=0xff;						//PORTB as output
	ldi R24,255
	out 0x4,R24
	.dbline 31
; PORTB=0x00;						//initialize PORTB low
	clr R2
	out 0x5,R2
	.dbline 34
; 	//PORTB is not being used
; 
; DDRC=0xFE; 						//PORTC[7:0] as input
	ldi R24,254
	out 0x7,R24
	.dbline 35
; PORTC=0x00; 					//disable PORTC
	out 0x8,R2
	.dbline 38
; 	//pull-up resistors
; 
; DDRD=0xff; 						//set PORTD as output
	ldi R24,255
	out 0xa,R24
	.dbline 39
; PORTD=0x00; 					//initialize low
	out 0xb,R2
	.dbline -2
L9:
	.dbline 0 ; func end
	ret
	.dbend
; 	//port D is the output port with LEDS
; }
; //***************************************************************
