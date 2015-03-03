#include "ccp.h"

void ccp_echo(const char* string) {
	print("\r\n");
	print(string);
}

void ccp_cls() {
	print("\033[1;1H\033[2J\033[30m\033[47m\033[2K Console\33[1;40H");
	ccp_time();
	print("\033[39m\33[49m\33[2;1H");
}

void ccp_time() {
	bios_get_datetime();
	print(days[clock.day-1]);
	print(", ");
	print(months[clock.month-1]);
	putc(' ');
	print_hex(clock.date);
	print(", 20");
	print_hex(clock.year);
	putc(' ');
	print_hex(clock.hours);
	putc(':');
	print_hex(clock.min);
	putc(':');
	print_hex(clock.sec);
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
	else if(strcmp(command, "time")) {
		print("\r\n");
		ccp_time();
		print("\r\n");
	}
	else {
		print("\r\nUnknown command\r\n");
	}
	
}

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