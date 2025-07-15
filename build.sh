clear
nasm -f bin src/boot/boot.asm -o bin/aopos.img
nasm -f bin src/boot/boot.asm -o bin/aopos.bin
qemu-system-x86_64 bin/aopos.img
