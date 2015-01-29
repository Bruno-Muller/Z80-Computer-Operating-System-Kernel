#include "bios.h"
#include "dir.h"
#include "print.h"

#define CR 0x0D

#define FALSE 0x00
#define TRUE  0xFF

char buffer[256];
unsigned char buffer_index = 0;

char strcmp(const char* s1, const char* s2) {
	do {
		if (*s1 != *s2) return FALSE;
		s1++;
		s2++;
	} while ((*s1 != 0) && (*s2 != 0));
	return TRUE;
}

void buffer_append(char c) {
	if (buffer_index == 255) return;
	buffer[buffer_index] = c;
	buffer_index++;
}

char* buffer_read() {
	buffer_index = 0;
	buffer[255] = 0x00;
	return buffer;
}

void ccp_echo(const char* string) {
	print("\r\n");
	print(string);
}

void ccp_cls() {
	print("\33[H\33[2J");
}

void ccp_execute_command(const char* const command) {
	if (strcmp(command, "echo")) {
		ccp_echo(command);
		print("\r\n");
	}
	else if(strcmp(command, "dir")) {
		ccp_dir();
		print("\r\n");
	}
	else if(strcmp(command, "cls")) {
		ccp_cls();
	}
	else {
		print("\r\nUnknown command\r\n");
	}
	
}

void ccp() {
	char c;
	print("\r\n>:");
	
	while(1) {
	
		c = bios_conin();
		if (c == CR) {
			buffer_append(0x00);
			ccp_execute_command(buffer_read());
			print(">:");
		}
		else {
			buffer_append(c);
			bios_conout(c);
		}
	}

}


void main() {
	print("\r\n == Z80 DOS ==\r\n B. M. 2015");
	ccp();
}