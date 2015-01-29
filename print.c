#include "print.h"

void print(const char* string) {
	do {
		bios_conout(*string);
		string++;
	} while (*string != 0);
}

void print_hex(unsigned char hex) {
	unsigned char tmp = (hex>>4) & 0x0F;
    putc(tmp<0x0A?tmp+'0':tmp-0x0A+'A');
    tmp = hex & 0x0F;
    putc(tmp<0x0A?tmp+'0':tmp-0x0A+'A');
}

void print_unsigned_int(unsigned int data, char n) {
	if (n>4)  putc((data/10000)+'0');
	if (n>3) putc((data/1000)%10+'0');
	if (n>2) putc((data/100)%10+'0');
	if (n>1) putc((data/10)%10+'0');
	putc(data%10+'0');
}

void print_unsigned_int_hex(unsigned int data) {
	Int tmp;
	tmp.value=data;

	print_hex(tmp.bytes[1]);
	print_hex(tmp.bytes[0]);
}