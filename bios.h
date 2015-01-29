#ifndef BIOS_H
#define BIOS_H

#define CONST_READY		0xFF
#define CONST_NOT_READY 0x00

extern void bios_conout(char);
extern char bios_conin();
extern char bios_const();
void bios_setsec(unsigned int val);
void bios_setdma(void* val);
void bios_read();

#endif /* BIOS_H */