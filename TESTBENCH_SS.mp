NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   0004   0001 =      1. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0004  __idata_start
       0005  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0006   0100 =    256. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0003  __start
       0003  __text_start
       0022  _exit
       0023  _main
       0038  _initialize_ports
       0041  _InitADC
       0053  _ReadADC
       006D  _USART_init
       007C  _USART_transmit
       0083  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0060   0001 =      1. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0060  _old_digital
       0060  __data_start
       0061  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0061   0001 =      1. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0061  __bss_start
       0061  _new_digital
       0062  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0002 =      2. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\iccv7avr\lib\crtAVR.o	[ crtavr.s ]
ADC_trans_2.o	[ ADC_trans_2.c ]
<library>	

User Global Definitions

ram_end = 0x25f
hwstk_size = 0x10

User Base Address Definitions

func_lit = 0x4
data = 0x60

