CC = iccavr
CFLAGS =  -IC:\iccv7avr\include -e -D__ICC_VERSION="7.06A"  -l -g -Wa-W 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -g -Wl-W -bfunc_lit:0x4.0x1000 -dram_end:0x25f -bdata:0x60.0x25f -dhwstk_size:16 -fihx_coff -S2
FILES = ADC_trans_2.o 

TESTBENCH_SS:	$(FILES)
	$(CC) -o TESTBENCH_SS $(LFLAGS) @TESTBENCH_SS.lk  
ADC_trans_2.o: C:\iccv7avr\include\iom48v.h
ADC_trans_2.o:	C:\DOCUME~1\BBLAHA\Desktop\mega48\ADC_trans_2.c
	$(CC) -c $(CFLAGS) C:\DOCUME~1\BBLAHA\Desktop\mega48\ADC_trans_2.c
