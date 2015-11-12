CC = iccavr
CFLAGS =  -IC:\iccv7avr\include -e -D__ICC_VERSION="7.06A" -D_EE_EXTIO -DATMega48  -l -g -Mavr_enhanced_small 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -g -bfunc_lit:0x34.0x1000 -dram_end:0x2ff -bdata:0x100.0x2ff -dhwstk_size:16 -beeprom:0.256 -fihx_coff -S2
FILES = testbench_atmega48_trial1.o 

TESTBENCH:	$(FILES)
	$(CC) -o TESTBENCH $(LFLAGS) @TESTBENCH.lk  
testbench_atmega48_trial1.o: C:\iccv7avr\include\iom48v.h
testbench_atmega48_trial1.o:	G:\mega48\testbench_atmega48_trial1.c
	$(CC) -c $(CFLAGS) G:\mega48\testbench_atmega48_trial1.c
