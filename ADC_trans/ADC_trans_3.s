	.module ADC_trans_3.c
	.area text(rom, con, rel)
	.dbfile C:\DOCUME~1\BBLAHA\Desktop\mega48\ADC_trans_3.c
	.area data(ram, con, rel)
	.dbfile C:\DOCUME~1\BBLAHA\Desktop\mega48\ADC_trans_3.c
_old_digital::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile C:\DOCUME~1\BBLAHA\Desktop\mega48\ADC_trans_3.c
	.dbsym e old_digital _old_digital c
	.area text(rom, con, rel)
	.dbfile C:\DOCUME~1\BBLAHA\Desktop\mega48\ADC_trans_3.c
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 73
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
; void InitADC(void);				//initalizes analog to digital
; void USART_init(void);			//initializes USART
; void USART_transmit(unsigned char data); //initalizes USART transmitter
; unsigned int ReadADC(unsigned char channel);//reads analog to digital voltage
; //main program***************************************************
; //global variables
; unsigned char old_digital = 0x00; //present value of analog to digital conversion
; unsigned char new_digital; 		//new values of analog to digital conversion
; unsigned char transmit_var;
; void main(void)
; {
	.dbline 74
; initialize_ports(); 			//initialize ports
	rcall _initialize_ports
	.dbline 75
; InitADC();						//initialize ADC
	rcall _InitADC
	.dbline 76
; USART_init();					//initialize USART
	rcall _USART_init
	rjmp L3
L2:
	.dbline 78
; 
; while(1){//main loop
	.dbline 79
; 	new_digital = ReadADC(0x20);//read analog input on PORTC pin0, left justify
	ldi R16,32
	rcall _ReadADC
	sts _new_digital,R16
	.dbline 80
; 	if(new_digital != old_digital){ //process change
	lds R2,_old_digital
	mov R3,R16
	cp R16,R2
	breq L5
X0:
	.dbline 80
	.dbline 81
; 		if(new_digital<16){
	cpi R16,16
	brsh L7
X1:
	.dbline 81
	.dbline 82
; 		  transmit_var=1;
	ldi R24,1
	sts _transmit_var,R24
	.dbline 84
; 		  //USART_transmit(1);
; 		}
L7:
	.dbline 85
; 		if(new_digital<32){
	lds R24,_new_digital
	cpi R24,32
	brsh L9
X2:
	.dbline 85
	.dbline 86
; 		  transmit_var=2;
	ldi R24,2
	sts _transmit_var,R24
	.dbline 88
; 		  //USART_transmit(2);
; 		}
L9:
	.dbline 89
; 		if(new_digital<48){
	lds R24,_new_digital
	cpi R24,48
	brsh L11
X3:
	.dbline 89
	.dbline 90
; 		  transmit_var=4;
	ldi R24,4
	sts _transmit_var,R24
	.dbline 92
; 		  //USART_transmit(4);
; 		}
L11:
	.dbline 93
; 		if(new_digital<64){
	lds R24,_new_digital
	cpi R24,64
	brsh L13
X4:
	.dbline 93
	.dbline 94
; 		  transmit_var=8;
	ldi R24,8
	sts _transmit_var,R24
	.dbline 96
; 		  //USART_transmit(8);	
; 		}
L13:
	.dbline 97
; 		if(new_digital<80){
	lds R24,_new_digital
	cpi R24,80
	brsh L15
X5:
	.dbline 97
	.dbline 98
; 		  transmit_var=16;
	ldi R24,16
	sts _transmit_var,R24
	.dbline 100
; 		  //USART_transmit(16);
; 		}
L15:
	.dbline 101
; 		if(new_digital<96){
	lds R24,_new_digital
	cpi R24,96
	brsh L17
X6:
	.dbline 101
	.dbline 102
; 		  transmit_var=32;
	ldi R24,32
	sts _transmit_var,R24
	.dbline 104
; 		  //USART_transmit(32);
; 		}
L17:
	.dbline 105
; 		if(new_digital<112){
	lds R24,_new_digital
	cpi R24,112
	brsh L19
X7:
	.dbline 105
	.dbline 106
; 		  transmit_var=64;
	ldi R24,64
	sts _transmit_var,R24
	.dbline 108
; 		  //USART_transmit(64);
; 		}
L19:
	.dbline 109
; 		if(new_digital<128){
	lds R24,_new_digital
	cpi R24,128
	brsh L21
X8:
	.dbline 109
	.dbline 110
; 		  transmit_var=128;
	ldi R24,128
	sts _transmit_var,R24
	.dbline 112
; 		  //USART_transmit(128);
; 		}						//in PORTB input
L21:
	.dbline 113
; 		USART_transmit(transmit_var);
	lds R16,_transmit_var
	rcall _USART_transmit
	.dbline 116
; 		//PORTB=new_digital;		//in PORTB input
; 		//PORTB=new_digital;		//in PORTB input
; 	  } 						//end if new_digital
L5:
	.dbline 117
; 		old_digital=new_digital;//update PORTC
	lds R2,_new_digital
	sts _old_digital,R2
	.dbline 118
; 	} 							//end while(1)
L3:
	.dbline 78
	rjmp L2
X9:
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e initialize_ports _initialize_ports fV
	.even
_initialize_ports::
	.dbline -1
	.dbline 127
; } 								//end main
; //***************************************************************
; //function definitions
; //***************************************************************
; //***************************************************************
; //initialize_ports: provides initial configuration for I/O ports
; //***************************************************************
; void initialize_ports(void)
; {
	.dbline 129
; 
; DDRB=0xff;						//PORTB as output
	ldi R24,255
	out 0x4,R24
	.dbline 130
; PORTB=0xff;						//initialize PORTB high
	out 0x5,R24
	.dbline 133
; 	//PORTB is not being used
; 
; DDRC=0x00; 						//PORTC[7:0] as input
	clr R2
	out 0x7,R2
	.dbline 134
; PORTC=0x00; 					//disable PORTC
	out 0x8,R2
	.dbline 137
; 	//pull-up resistors
; 
; DDRD=0xff; 						//set PORTD as output
	out 0xa,R24
	.dbline 138
; PORTD=0xff; 					//initialize high
	out 0xb,R24
	.dbline -2
L23:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e InitADC _InitADC fV
	.even
_InitADC::
	.dbline -1
	.dbline 149
; 	//port D is transmitting usart on channel 1 pin 3
; }
; //***************************************************************
; 
; 
; 
; //*************************************************************
; //InitADC: initialize analog-to-digital converter
; //*************************************************************
; void InitADC( void)
; {
	.dbline 150
; PRR=0x00;//Power Reduction Register, zeros shut off all power reduction 
	clr R2
	sts 100,R2
	.dbline 151
; ADMUX = 0; //Select channel 0
	sts 124,R2
	.dbline 152
; ADCSRA = 0xC3; 	/*Enable ADC & start 1st dummy conversion Set ADC module prescalar to 8 critical for accurate ADC results*/
	ldi R24,195
	sts 122,R24
L25:
	.dbline 153
; while (!(ADCSRA & 0x10)); 	//Check if conversation is ready
L26:
	.dbline 153
	lds R24,122
	andi R24,16
	breq L25
X10:
	.dbline 154
; ADCSRA |= 0x10; //Clear conv rdy flag - set the bit, reset interupt flag
	lds R24,122
	ori R24,16
	sts 122,R24
	.dbline -2
L24:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e ReadADC _ReadADC fi
; binary_weighted_voltage_high -> <dead>
; binary_weighted_voltage_low -> <dead>
; binary_weighted_voltage -> <dead>
; most_significantbits -> R10,R11
;        channel -> R16
	.even
_ReadADC::
	st -y,R10
	st -y,R11
	.dbline -1
	.dbline 165
; }
; //*************************************************************
; //ReadADC: read analog voltage from analog-to-digital converter -
; //the desired channel for conversion is passed in as an unsigned
; //character variable. The result is returned as a left justified,
; //10 bit binary result. The ADC prescalar must be set to 8 to
; //slow down the ADC clock at higher external clock frequencies
; //(10 MHz) to obtain accurate results.
; //*************************************************************
; unsigned int ReadADC(unsigned char channel)
; {
	.dbline 169
; unsigned int binary_weighted_voltage, binary_weighted_voltage_low;
; unsigned int binary_weighted_voltage_high; //weighted binary voltage
; unsigned int most_significantbits;
; ADMUX = channel; //Select channel
	sts 124,R16
	.dbline 170
; ADCSRA |= 0x43; //Start conversion
	lds R24,122
	ori R24,67
	sts 122,R24
L29:
	.dbline 174
; //Set ADC module prescalar
; //to 8 critical for
; //accurate ADC results
; while (!(ADCSRA & 0x10)); //Check if converstion is
L30:
	.dbline 174
	lds R24,122
	andi R24,16
	breq L29
X11:
	.dbline 176
; //ready
; ADCSRA |= 0x10; //Clear Conv rdy flag - set
	lds R24,122
	ori R24,16
	sts 122,R24
	.dbline 184
; //the bit
; /*binary_weighted_voltage_low = ADCL; //Read 8 low bits first
; //(important)
; //Read 2 high bits,
; //multiply by 256
; binary_weighted_voltage_high = ((unsigned int)(ADCH << 8));
; binary_weighted_voltage = binary_weighted_voltage_low | binary_weighted_voltage_high;*/
; most_significantbits=ADCH;
	lds R10,121
	clr R11
	.dbline 185
; return most_significantbits; //ADCH:ADCL
	mov R16,R10
	mov R17,R11
	.dbline -2
L28:
	.dbline 0 ; func end
	ld R11,y+
	ld R10,y+
	ret
	.dbsym l binary_weighted_voltage_high 1 i
	.dbsym l binary_weighted_voltage_low 1 i
	.dbsym l binary_weighted_voltage 1 i
	.dbsym r most_significantbits 10 i
	.dbsym r channel 16 c
	.dbend
	.dbfunc e USART_init _USART_init fV
	.even
_USART_init::
	.dbline -1
	.dbline 194
; }
; //*************************************************************
; 
; 
; //*************************************************************
; //USART_init: initializes the USART system
; /*********************************************/
; void USART_init(void)
; {
	.dbline 196
; /*Set baud rate */
; UBRR0H = 0x00; 	  	//instead of using ubrr use values from barretts primer example
	clr R2
	sts 197,R2
	.dbline 197
; UBRR0L = 0x40;
	ldi R24,64
	sts 196,R24
	.dbline 199
; /*Enable transmitter 0x08=0b00001000*/
; UCSR0B = 0x08;
	ldi R24,8
	sts 193,R24
	.dbline 201
; /* 0b00000110=0x06 async,no parity,1 stop bit, 8 bit width. see page 194 of data sheet */
; UCSR0C = 0x06;
	ldi R24,6
	sts 194,R24
	.dbline 203
; /*                                    */
; UCSR0A = 0x00;
	sts 192,R2
	.dbline -2
L32:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e USART_transmit _USART_transmit fV
;           data -> R16
	.even
_USART_transmit::
	.dbline -1
	.dbline 214
; }
; 
; /*********************************************/
; 
; //*************************************************************
; //USART_transmit: transmits single byte of data
; /*********************************************/
; 
; 
; void USART_transmit( unsigned char data )
; {
L34:
	.dbline 217
; /* Wait for empty transmit buffer */
; while ( !( UCSR0A & (1<<UDRE0)) )
; ;
L35:
	.dbline 216
	lds R24,192
	andi R24,32
	breq L34
X12:
	.dbline 219
; /* Put data into buffer, sends the data */
; UDR0 = data;
	sts 198,R16
	.dbline -2
L33:
	.dbline 0 ; func end
	ret
	.dbsym r data 16 c
	.dbend
	.area bss(ram, con, rel)
	.dbfile C:\DOCUME~1\BBLAHA\Desktop\mega48\ADC_trans_3.c
_transmit_var::
	.blkb 1
	.dbsym e transmit_var _transmit_var c
_new_digital::
	.blkb 1
	.dbsym e new_digital _new_digital c
; }
; 
; //***************************************************************
; 
