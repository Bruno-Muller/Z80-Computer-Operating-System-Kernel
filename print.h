#ifndef PRINT_H
#define PRINT_H

#include "bios.h"

#define putc bios_conout

typedef union {
	unsigned int value;
    unsigned char bytes[2];
} Int; 

void print(const char*);
void print_hex(unsigned char hex);
void print_unsigned_int_hex(unsigned int data);
void print_unsigned_int(unsigned int data, char n);

#endif /* PRINT_H */