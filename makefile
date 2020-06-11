all:img
boot:
	nasm -o ipl.bin ipl.nas
haribote:
	nasm -o haribote.bin haribote.nas
img:boot haribote
	dd if=ipl.bin of=myos.img seek=0 count=1 bs=512
	dd if=/dev/zero of=myos.img seek=1 count=2879  bs=512
clean:
	rm ipl.bin haribote.bin myos.img
run:
	./qemu/qemu.exe -L ./qemu -m 32 -localtime -std-vga -fda myos.img