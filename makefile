addr=0x7c00
CFLAGS := $(CFLAGS) -O1 -fno-builtin -I$(OBJDIR) -MD                                                                                        
CFLAGS += -fno-omit-frame-pointer
CFLAGS += -Wall -Wno-format -Wno-unused -Werror -gstabs -m32
LDFLAGS=-m i386pe

all:img
boot:
	nasm -o ipl.bin ipl.nas
haribote:
	nasm -o haribote.bin haribote.nas
img:boot haribote
	dd if=ipl.bin of=myos.img seek=0 count=1 bs=512
	dd if=/dev/zero of=myos.img seek=1 count=2879  bs=512

main.o:main.c
	gcc -nostdinc $(CFLAGS) -Os -c -o $@ $<
main:main.o
	ld $(LDFLAGS) -N -e start -Ttext $(addr) -o $@.out $^
	objdump -S $@.out >$@.asm
	objcopy -S -O binary -j .text $@.out $@

clean:
	rm ipl.bin haribote.bin myos.img main.o main.asm main.out main
run:
	./qemu/qemu.exe -L ./qemu -m 32 -localtime -std-vga -fda myos.img