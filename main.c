#include "ccp.h"
#include "print.h"

void fct_clock() {
	print("\033[?25l");
	
	bios_conout(0x1B);
	bios_conout('7');
	
	print("\033[;r");
	
	print("\33[1;1H");
	ccp_time();
	
	print("\033[5;29r");
	
	bios_conout(0x1B);
	bios_conout('8');
	
	print("\033[?25h");
	
}

void main() {
	bios_clock_handler(&fct_clock);
	print("\r\n == Z80 DOS ==\r\n B. M. 2015");
	print("\033[5;29r");
	ccp();
}