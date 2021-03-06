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
static unsigned char months_s[] = {7, 8, 5, 5, 3, 4, 4, 6, 9, 7, 8, 8};
static unsigned char days_s[] = {6, 7, 9, 8, 6, 8, 6};

char strcmp(const char* s1, const char* s2);
void buffer_append(char c);
char* buffer_read();

void ccp_echo(const char* string);
void ccp_cls();
void ccp_time();
void ccp_execute_command(const char* const command);
void ccp();


#endif	/* CCP_H */