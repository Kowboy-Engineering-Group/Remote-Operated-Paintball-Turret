	.module ADC_rec_2.c
	.area text(rom, con, rel)
	.dbfile C:\DOCUME~1\BBLAHA\Desktop\mega48\ADC_rec_2.c
	.area data(ram, con, rel)
	.dbfile C:\DOCUME~1\BBLAHA\Desktop\mega48\ADC_rec_2.c
_old_digital::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile C:\DOCUME~1\BBLAHA\Desktop\mega48\ADC_rec_2.c
	.dbsym e old_digital _old_digital c
	.area text(rom, con, rel)
	.dbfile C:\DOCUME~1\BBLAHA\Desktop\mega48\ADC_rec_2.c
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 70
; //*************************************************************
; //file name: testbench_atmega48_trial1.c
; //function: provides test bench for ATMEL AVR ATmega48 controller
; //target controller: ATMEL ATmega48
; //
; //ATMEL AVR ATmega48 Controller Pin Assignments
; //Chip Port Function I/O Source/Dest Asserted Notes
; //*************************************************************
; //Pin 1 Reset
; //*************************************************************
; //Pin 1
; //Pin 2 
; //Pin 3 
; //Pin 4 
; //Pin 5 
; //Pin 6 
; //Pin 7 
; //Pin 8 
; //Pin 9 
; //Pin 10 
; //Pin 11 
; //Pin 12 
; //Pin 13 
; //Pin 14 
; //Pin 15 
; //Pin 16 
; //Pin 17 
; //Pin 18 
; //Pin 19 
; //Pin 20 
; //Pin 21 
; //Pin 22
; //Pin 23
; //Pin 24 
; //Pin 25
; //Pin 26 
; //Pin 27 
; //Pin 28 
; //Pin 29 
; //Pin 30 
; //Pin 31 
; //Pin 32 
; //Pin 33 
; //Pin 34 
; //Pin 35 
; //Pin 36 
; //Pin 37 
; //Pin 38 
; //Pin 39 
; //Pin 40 
; //
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
; void USART_init(void);			//initializes USART
; unsigned char USART_Receive( void ); //USART Receiver
; //main program***************************************************
; //global variables
; unsigned char old_digital = 0x00; //present value of analog to digital conversion
; unsigned char new_digital; 		//new values of analog to digital conversion
; void main(void)
; {
	.dbline 71
; initialize_ports(); 			//initialize ports
	rcall _initialize_ports
	.dbline 72
; USART_init();					//initialize USART
	rcall _USART_init
	rjmp L3
L2:
	.dbline 74
; 
; while(1){//main loop
	.dbline 75
; 	new_digital = USART_Receive();//read analog input on PORTC pin0, left justify
	rcall _USART_Receive
	sts _new_digital,R16
	.dbline 76
; 	if(new_digital != old_digital){ //process change
	lds R2,_old_digital
	mov R3,R16
	cp R16,R2
	breq L5
X0:
	.dbline 76
	.dbline 77
; 		PORTB=new_digital;		//in PORTB input
	out 0x5,R16
	.dbline 79
; 		//PORTB=new_digital;		//in PORTB input
; 	  } 						//end if new_digital
L5:
	.dbline 80
; 		old_digital=new_digital;//update PORTC
	lds R2,_new_digital
	sts _old_digital,R2
	.dbline 81
; 	} 							//end while(1)
L3:
	.dbline 74
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
	.dbline 90
; } 								//end main
; //***************************************************************
; //function definitions
; //***************************************************************
; //***************************************************************
; //initialize_ports: provides initial configuration for I/O ports
; //***************************************************************
; void initialize_ports(void)
; {
	.dbline 92
; 
; DDRB=0xff;						//PORTB as output
	ldi R24,255
	out 0x4,R24
	.dbline 93
; PORTB=0xff;						//initialize PORTB high
	out 0x5,R24
	.dbline 96
; 	//PORTB is not being used
; 
; DDRC=0x00; 						//PORTC[7:0] as input
	clr R2
	out 0x7,R2
	.dbline 97
; PORTC=0x00; 					//disable PORTC
	out 0x8,R2
	.dbline 100
; 	//pull-up resistors
; 
; DDRD=0x00; 						//set PORTD as input
	out 0xa,R2
	.dbline 101
; PORTD=0x00; 					//disable portD
	out 0xb,R2
	.dbline -2
L7:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e USART_init _USART_init fV
	.even
_USART_init::
	.dbline -1
	.dbline 110
; 	//port D is receiving usart on channel 0, pin 2
; }
; //***************************************************************
; 
; //*************************************************************
; //USART_init: initializes the USART system
; /*********************************************/
; void USART_init(void)
; {
	.dbline 112
; /*Set baud rate */
; UBRR0H = 0x00; 	  	//instead of using ubrr use values from barretts primer example
	clr R2
	sts 197,R2
	.dbline 113
; UBRR0L = 0x40;
	ldi R24,64
	sts 196,R24
	.dbline 115
; /*Enable receiver 0x10=0b00010000*/
; UCSR0B = 0x10;
	ldi R24,16
	sts 193,R24
	.dbline 117
; /* 0b00000110=0x06 async,no parity,1 stop bit, 8 bit width. see page 194 of data sheet */
; UCSR0C = 0x06;
	ldi R24,6
	sts 194,R24
	.dbline 119
; /*                                    */
; UCSR0A = 0x00;
	sts 192,R2
	.dbline -2
L8:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e USART_Receive _USART_Receive fc
	.even
_USART_Receive::
	.dbline -1
	.dbline 126
; }
; 
; /*********************************************/
; 
; /*********************************************/
; unsigned char USART_Receive( void )
; {
L10:
	.dbline 129
; /* Wait for data to be received */
; while ( !(UCSR0A & (1<<RXC0)) )
; ;
L11:
	.dbline 128
	lds R24,192
	andi R24,128
	breq L10
X2:
	.dbline 131
; /* Get and return received data from buffer */
; return UDR0;
	lds R16,198
	.dbline -2
L9:
	.dbline 0 ; func end
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile C:\DOCUME~1\BBLAHA\Desktop\mega48\ADC_rec_2.c
_new_digital::
	.blkb 1
	.dbsym e new_digital _new_digital c
; }
; /*********************************************/
