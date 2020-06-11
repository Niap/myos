addr=0x7c00
CFLAGS := $(CFLAGS) -O1 -fno-builtin -I$(OBJDIR) -MD                                                                                        
CFLAGS += -fno-omit-frame-pointer
CFLAGS += -Wall -Wno-format -Wno-unused -Werror -gstabs -m32
LDFLAGS=-m i386pe

all:img
ipl10.bin:ipl10.nas
	nasm -o $@ $<
img:ipl10.bin
	dd if=$< of=myos.img seek=0 count=1 bs=512
	dd if=/dev/zero of=myos.img seek=1 count=2879  bs=512
	rm $<

asmhead.bin:asmhead.nas
	nasm -o $@ $<
main:main.c
	gcc -nostdinc $(CFLAGS) -Os -c -o $@.o $<
	ld $(LDFLAGS) -N -e start -Ttext $(addr) -o $@.out $@.o
	rm $@.o
	#objdump -S -j .text $@.out >$@.asm
	objcopy -S -O binary -j .text $@.out $@
	rm $@.out
kernel:asmhead.bin main
	cat  asmhead.bin main > $@
	rm asmhead.bin main

clean:
	rm ipl.bin haribote.bin myos.img main.o main.asm main.out main
run:
	./qemu/qemu.exe -L ./qemu -m 32 -localtime -std-vga -fda myos.img