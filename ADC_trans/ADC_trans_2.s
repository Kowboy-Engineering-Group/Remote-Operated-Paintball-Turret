	.module ADC_trans_2.c
	.area text(rom, con, rel)
	.dbfile C:\DOCUME~1\BBLAHA\Desktop\mega48\ADC_trans_2.c
	.area data(ram, con, rel)
	.dbfile C:\DOCUME~1\BBLAHA\Desktop\mega48\ADC_trans_2.c
_old_digital::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile C:\DOCUME~1\BBLAHA\Desktop\mega48\ADC_trans_2.c
	.dbsym e old_digital _old_digital c
	.area text(rom, con, rel)
	.dbfile C:\DOCUME~1\BBLAHA\Desktop\mega48\ADC_trans_2.c
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 72
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
; void main(void)
; {
	.dbline 73
; initialize_ports(); 			//initialize ports
	rcall _initialize_ports
	.dbline 74
; InitADC();						//initialize ADC
	rcall _InitADC
	.dbline 75
; USART_init();					//initialize USART
	rcall _USART_init
	rjmp L3
L2:
	.dbline 77
; 
; while(1){//main loop
	.dbline 78
; 	new_digital = ReadADC(0x20);//read analog input on PORTC pin0, left justify
	ldi R16,32
	rcall _ReadADC
	sts _new_digital,R16
	.dbline 79
; 	if(new_digital != old_digital){ //process change
	lds R2,_old_digital
	mov R3,R16
	cp R16,R2
	breq L5
X0:
	.dbline 79
	.dbline 80
; 		PORTB=new_digital;		//in PORTB input
	out 0x5,R16
	.dbline 81
; 		USART_transmit(new_digital);
	rcall _USART_transmit
	.dbline 83
; 		//PORTB=new_digital;		//in PORTB input
; 	  } 						//end if new_digital
L5:
	.dbline 84
; 		old_digital=new_digital;//update PORTC
	lds R2,_new_digital
	sts _old_digital,R2
	.dbline 85
; 	} 							//end while(1)
L3:
	.dbline 77
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
	.dbline 94
; } 								//end main
; //***************************************************************
; //function definitions
; //***************************************************************
; //***************************************************************
; //initialize_ports: provides initial configuration for I/O ports
; //***************************************************************
; void initialize_ports(void)
; {
	.dbline 96
; 
; DDRB=0xff;						//PORTB as output
	ldi R24,255
	out 0x4,R24
	.dbline 97
; PORTB=0xff;						//initialize PORTB high
	out 0x5,R24
	.dbline 100
; 	//PORTB is not being used
; 
; DDRC=0x00; 						//PORTC[7:0] as input
	clr R2
	out 0x7,R2
	.dbline 101
; PORTC=0x00; 					//disable PORTC
	out 0x8,R2
	.dbline 104
; 	//pull-up resistors
; 
; DDRD=0xff; 						//set PORTD as output
	out 0xa,R24
	.dbline 105
; PORTD=0xff; 					//initialize high
	out 0xb,R24
	.dbline -2
L7:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e InitADC _InitADC fV
	.even
_InitADC::
	.dbline -1
	.dbline 116
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
	.dbline 117
; PRR=0x00;//Power Reduction Register, zeros shut off all power reduction 
	clr R2
	sts 100,R2
	.dbline 118
; ADMUX = 0; //Select channel 0
	sts 124,R2
	.dbline 119
; ADCSRA = 0xC3; 	/*Enable ADC & start 1st dummy conversion Set ADC module prescalar to 8 critical for accurate ADC results*/
	ldi R24,195
	sts 122,R24
L9:
	.dbline 120
; while (!(ADCSRA & 0x10)); 	//Check if conversation is ready
L10:
	.dbline 120
	lds R24,122
	andi R24,16
	breq L9
X2:
	.dbline 121
; ADCSRA |= 0x10; //Clear conv rdy flag - set the bit, reset interupt flag
	lds R24,122
	ori R24,16
	sts 122,R24
	.dbline -2
L8:
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
	.dbline 132
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
	.dbline 136
; unsigned int binary_weighted_voltage, binary_weighted_voltage_low;
; unsigned int binary_weighted_voltage_high; //weighted binary voltage
; unsigned int most_significantbits;
; ADMUX = channel; //Select channel
	sts 124,R16
	.dbline 137
; ADCSRA |= 0x43; //Start conversion
	lds R24,122
	ori R24,67
	sts 122,R24
L13:
	.dbline 141
; //Set ADC module prescalar
; //to 8 critical for
; //accurate ADC results
; while (!(ADCSRA & 0x10)); //Check if converstion is
L14:
	.dbline 141
	lds R24,122
	andi R24,16
	breq L13
X3:
	.dbline 143
; //ready
; ADCSRA |= 0x10; //Clear Conv rdy flag - set
	lds R24,122
	ori R24,16
	sts 122,R24
	.dbline 151
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
	.dbline 152
; return most_significantbits; //ADCH:ADCL
	mov R16,R10
	mov R17,R11
	.dbline -2
L12:
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
	.dbline 161
; }
; //*************************************************************
; 
; 
; //*************************************************************
; //USART_init: initializes the USART system
; /*********************************************/
; void USART_init(void)
; {
	.dbline 163
; /*Set baud rate */
; UBRR0H = 0x00; 	  	//instead of using ubrr use values from barretts primer example
	clr R2
	sts 197,R2
	.dbline 164
; UBRR0L = 0x40;
	ldi R24,64
	sts 196,R24
	.dbline 166
; /*Enable transmitter 0x08=0b00001000*/
; UCSR0B = 0x08;
	ldi R24,8
	sts 193,R24
	.dbline 168
; /* 0b00000110=0x06 async,no parity,1 stop bit, 8 bit width. see page 194 of data sheet */
; UCSR0C = 0x06;
	ldi R24,6
	sts 194,R24
	.dbline 170
; /*                                    */
; UCSR0A = 0x00;
	sts 192,R2
	.dbline -2
L16:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e USART_transmit _USART_transmit fV
;           data -> R16
	.even
_USART_transmit::
	.dbline -1
	.dbline 181
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
L18:
	.dbline 184
; /* Wait for empty transmit buffer */
; while ( !( UCSR0A & (1<<UDRE0)) )
; ;
L19:
	.dbline 183
	lds R24,192
	andi R24,32
	breq L18
X4:
	.dbline 186
; /* Put data into buffer, sends the data */
; UDR0 = data;
	sts 198,R16
	.dbline -2
L17:
	.dbline 0 ; func end
	ret
	.dbsym r data 16 c
	.dbend
	.area bss(ram, con, rel)
	.dbfile C:\DOCUME~1\BBLAHA\Desktop\mega48\ADC_trans_2.c
_new_digital::
	.blkb 1
	.dbsym e new_digital _new_digital c
; }
; 
; //***************************************************************
; 
