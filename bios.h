#ifndef BIOS_H
#define BIOS_H

#define CONST_READY		0xFF
#define CONST_NOT_READY 0x00

typedef struct {
	unsigned char sec;
	unsigned char min;
	unsigned char hours;
	unsigned char day;
	unsigned char date;
	unsigned char month;
	unsigned char year;
} Clock;

extern void bios_get_datetime();
extern void bios_set_datetime();

extern void bios_conout(char);
extern char bios_conin();
extern char bios_const();
extern void bios_setsec(unsigned int val);
extern void bios_setdma(void* val);
extern void bios_read();

#endif /* BIOS_H */