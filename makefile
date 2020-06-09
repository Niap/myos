all:img
boot:
	nasm -o ipl.bin ipl.nas
img:boot
	dd if=ipl.bin of=myos.img count=1 bs=512
	dd if=/dev/zero of=myos.img bs=512 seek=1 skip=1 count=2879
clean:
	rm ipl.bin myos.img