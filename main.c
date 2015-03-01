#include "ccp.h"
#include "print.h"

void fct_clock() {
	bios_conout(0x1B);
	bios_conout('7');
	
	print("\033[?25l");

	print("\033[7m");
	
	print("\33[1;40H");
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