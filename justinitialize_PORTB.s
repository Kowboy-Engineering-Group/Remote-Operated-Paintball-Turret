	.module justinitialize_PORTB.c
	.area text(rom, con, rel)
	.dbfile G:\mega48\justinitialize_PORTB.c
	.area data(ram, con, rel)
	.dbfile G:\mega48\justinitialize_PORTB.c
_old_PORTC::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile G:\mega48\justinitialize_PORTB.c
	.dbsym e old_PORTC _old_PORTC c
	.area text(rom, con, rel)
	.dbfile G:\mega48\justinitialize_PORTB.c
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 25
; //*************************************************************
; //file name: testbench_atmega48_trial1.c
; //function: provides test bench for ATMEL AVR ATmega48 controller
; //target controller: ATMEL ATmega48
; //
; //ATMEL AVR ATmega48 Controller Pin Assignments
; //Chip Port Function I/O Source/Dest Asserted Notes
; 
; //orginal authors: Steven Barrett and Daniel Pack
; //modifying author: Barry Blaha
; //created: July 12, 2007
; //last revised: February 25, 2008
; //***************************************************************
; //include files**************************************************
; #include<iom48v.h> 				//ImageCraft ICC AVR
; 								//include file
; //for ATmega48
; //function prototypes********************************************
; void initialize_ports(void); 	//initializes ports
; //main program***************************************************
; //global variables
; unsigned char old_PORTC = 0x00; //present value of PORTC
; unsigned char new_PORTC; 		//new values of PORTC
; void main(void)
; {
	.dbline 26
; initialize_ports(); 			//initialize ports
	rcall _initialize_ports
	rjmp L3
L2:
	.dbline 27
; while(1){//main loop
	.dbline 28
; 	new_PORTC = PINC; 			//read PORTC
	in R2,0x6
	sts _new_PORTC,R2
	.dbline 29
; 	if(new_PORTC != old_PORTC){ //process change
	lds R2,_old_PORTC
	lds R3,_new_PORTC
	cp R3,R2
	breq L5
X0:
	.dbline 29
	.dbline 30
; 			PORTB=PINC;
	in R2,0x6
	out 0x5,R2
	.dbline 31
; 	  } 						//end if new_PORTC
L5:
	.dbline 32
; 		old_PORTC=new_PORTC; 	//update PORTC
	lds R2,_new_PORTC
	sts _old_PORTC,R2
	.dbline 33
; 	} 							//end while(1)
L3:
	.dbline 27
	rjmp L2
X1:
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e initialize_ports _initialize_ports fV
	.even
_initialize_ports::
	.dbline -1
	.dbline 42
; } 								//end main
; //***************************************************************
; //function definitions
; //***************************************************************
; //***************************************************************
; //initialize_ports: provides initial configuration for I/O ports
; //***************************************************************
; void initialize_ports(void)
; {
	.dbline 44
; 
; DDRB=0xff;						//PORTB as output
	ldi R24,255
	out 0x4,R24
	.dbline 45
; PORTB=0x00;						//initialize PORTB low
	clr R2
	out 0x5,R2
	.dbline 48
; 	//PORTB is not being used
; 
; DDRC=0x00; 						//PORTC[7:0] as input
	out 0x7,R2
	.dbline 49
; PORTC=0x00; 					//disable PORTC
	out 0x8,R2
	.dbline 52
; 	//pull-up resistors
; 
; DDRD=0xff; 						//set PORTD as output
	out 0xa,R24
	.dbline 53
; PORTD=0x00; 					//initialize low
	out 0xb,R2
	.dbline -2
L7:
	.dbline 0 ; func end
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile G:\mega48\justinitialize_PORTB.c
_new_PORTC::
	.blkb 1
	.dbsym e new_PORTC _new_PORTC c
; 	//port D is the output port with LEDS
; }
; //***************************************************************
; 
