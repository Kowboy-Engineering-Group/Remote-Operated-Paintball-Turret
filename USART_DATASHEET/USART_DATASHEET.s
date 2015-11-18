	.module USART_DATASHEET.c
	.area text(rom, con, rel)
	.dbfile C:\DOCUME~1\BBLAHA\Desktop\mega48\USART_DATASHEET.c
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 11
; #define FOSC 1843200 // Clock Speed
; #define BAUD 9600
; #define MYUBRR FOSC/16/BAUD-1
; #include<iom48v.h> 				//ImageCraft ICC AVR
; 
; void initialize_ports(void); 	//initializes ports
; void USART_Transmit( unsigned char ); //transmits data
; void USART_Init(void); //initializes USART
; 
; void main( void )
; {
	.dbline 12
; initialize_ports(); 			//initialize ports
	rcall _initialize_ports
	.dbline 13
; USART_Init();				//initialize transmitter
	rcall _USART_Init
	rjmp L3
L2:
	.dbline 15
; 
; while(1){
	.dbline 16
; 	USART_Transmit(0x44);			//transmit 
	ldi R16,68
	rcall _USART_Transmit
	.dbline 17
; 	}
L3:
	.dbline 15
	rjmp L2
X0:
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e USART_Init _USART_Init fV
	.even
_USART_Init::
	.dbline -1
	.dbline 23
; 	
; }
; 
; /*********************************************/
; void USART_Init(void)
; {
	.dbline 25
; /*Set baud rate */
; UBRR0H = 0x00; 	  	//instead of using ubrr use values from barretts primer example
	clr R2
	sts 197,R2
	.dbline 26
; UBRR0L = 0x40;
	ldi R24,64
	sts 196,R24
	.dbline 28
; /*Enable transmitter 0x08=0b00001000*/
; UCSR0B = 0x08;
	ldi R24,8
	sts 193,R24
	.dbline 30
; /* 0b00000110=0x06 async,no parity,1 stop bit, 8 bit width. see page 194 of data sheet */
; UCSR0C = 0x06;
	ldi R24,6
	sts 194,R24
	.dbline 32
; /*                                    */
; UCSR0A = 0x00;
	sts 192,R2
	.dbline -2
L5:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e USART_Transmit _USART_Transmit fV
;           data -> R16
	.even
_USART_Transmit::
	.dbline -1
	.dbline 39
; }
; 
; /*********************************************/
; 
; 
; void USART_Transmit( unsigned char data )
; {
L7:
	.dbline 42
; /* Wait for empty transmit buffer */
; while ( !( UCSR0A & (1<<UDRE0)) )
; ;
L8:
	.dbline 41
	lds R24,192
	andi R24,32
	breq L7
X1:
	.dbline 44
; /* Put data into buffer, sends the data */
; UDR0 = data;
	sts 198,R16
	.dbline -2
L6:
	.dbline 0 ; func end
	ret
	.dbsym r data 16 c
	.dbend
	.dbfunc e initialize_ports _initialize_ports fV
	.even
_initialize_ports::
	.dbline -1
	.dbline 49
; }
; 
; //***************************************************************
; void initialize_ports(void)
; {
	.dbline 51
; 
; DDRB=0xff;						//PORTB as output
	ldi R24,255
	out 0x4,R24
	.dbline 52
; PORTB=0xff;						//initialize PORTB high
	out 0x5,R24
	.dbline 55
; 	//PORTB is not being used
; 
; DDRC=0x00; 						//PORTC[7:0] as input
	clr R2
	out 0x7,R2
	.dbline 56
; PORTC=0x00; 					//disable PORTC
	out 0x8,R2
	.dbline 59
; 	//pull-up resistors
; 
; DDRD=0xff; 						//set PORTD as output
	out 0xa,R24
	.dbline 60
; PORTD=0xff; 					//initialize high
	out 0xb,R24
	.dbline -2
L10:
	.dbline 0 ; func end
	ret
	.dbend
; 	//port D is transmitting usart on channel 1 pin 3
; }
; //***************************************************************
