#ifndef CCP_H
#define CCP_H

#include "bool.h"
#include "bios.h"
#include "ccp.h"
#include "dir.h"
#include "print.h"

#define CR 0x0D


static char buffer[256];
static unsigned char buffer_index = 0;

static const char * const months[] = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
static const char * const days[] = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};

char strcmp(const char* s1, const char* s2);
void buffer_append(char c);
char* buffer_read();

void ccp_echo(const char* string);
void ccp_cls();
void ccp_time();
void ccp_execute_command(const char* const command);
void ccp();


#endif	/* CCP_H */