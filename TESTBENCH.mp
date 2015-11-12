NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   0034   0001 =      1. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0034  __idata_start
       0035  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0036   00C0 =    192. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       001B  __start
       001B  __text_start
       003A  _exit
       003B  _main
       0072  _initialize_ports
       007B  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   0001 =      1. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  __data_start
       0100  _old_PORTC
       0101  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0101   0001 =      1. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0101  __bss_start
       0101  _new_PORTC
       0102  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0002 =      2. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\iccv7avr\lib\crtAVR.o	[ crtavr.s ]
testbench_atmega48_trial1.o	[ testbench_atmega48_trial1.c ]
<library>	

User Global Definitions

ram_end = 0x2ff
hwstk_size = 0x10

User Base Address Definitions

func_lit = 0x34
data = 0x100
eeprom:0.256

