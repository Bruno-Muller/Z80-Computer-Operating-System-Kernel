cd %1
D:
sdasz80 -o crt0.s
sdasz80 -o bios.s
sdcc -mz80 -c main.c
sdcc -mz80 -c dir.c
sdcc -mz80 -c print.c
sdcc -mz80 -c ccp.c
sdcc -mz80 --code-loc 0x250C --data-loc 0x3000 --no-std-crt0 -o kernel.ihx main.rel crt0.rel bios.rel dir.rel ccp.rel print.rel
makebin -p kernel.ihx kernel.bin
pause