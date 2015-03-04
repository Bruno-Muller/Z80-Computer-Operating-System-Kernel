#include "ccp.h"
#include "print.h"

void fct_clock() {
	unsigned char size;
	bios_conout(0x1B);
	bios_conout('7');
	
	print("\033[?25l");

	print("\033[7m");
	
	print("\33[1;");
	size = days_s[clock.day-1] + months_s[clock.month-1] + 20;
	print_unsigned_char(80 - size);
	putc('H');
	ccp_time();
	print("\033[27m");

	bios_conout(0x1B);
	bios_conout('8');
	
	print("\033[?25h");
	
}

void main() {
	ccp_cls();
	
	print("\033[2;30r");
	print("\r\n == Z80 DOS ==\r\n B. M. 2015");
	bios_clock_handler(&fct_clock);
	ccp();
}