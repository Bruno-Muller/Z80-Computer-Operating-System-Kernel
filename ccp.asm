;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Sat Feb 28 23:58:14 2015
;--------------------------------------------------------
	.module ccp
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ccp_dir
	.globl _print_hex
	.globl _print
	.globl _bios_conin
	.globl _bios_conout
	.globl _bios_get_datetime
	.globl _ccp_echo
	.globl _ccp_cls
	.globl _ccp_time
	.globl _ccp_execute_command
	.globl _strcmp
	.globl _buffer_append
	.globl _buffer_read
	.globl _ccp
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_buffer:
	.ds 256
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_buffer_index:
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;ccp.c:3: void ccp_echo(const char* string) {
;	---------------------------------
; Function ccp_echo
; ---------------------------------
_ccp_echo_start::
_ccp_echo:
;ccp.c:4: print("\r\n");
	ld	hl,#___str_0
	push	hl
	call	_print
	pop	af
;ccp.c:5: print(string);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_print
	pop	af
	ret
_ccp_echo_end::
_months:
	.dw __str_1
	.dw __str_2
	.dw __str_3
	.dw __str_4
	.dw __str_5
	.dw __str_6
	.dw __str_7
	.dw __str_8
	.dw __str_9
	.dw __str_10
	.dw __str_11
	.dw __str_12
_days:
	.dw __str_13
	.dw __str_14
	.dw __str_15
	.dw __str_16
	.dw __str_17
	.dw __str_18
	.dw __str_19
___str_0:
	.db 0x0D
	.db 0x0A
	.db 0x00
__str_1:
	.ascii "January"
	.db 0x00
__str_2:
	.ascii "February"
	.db 0x00
__str_3:
	.ascii "March"
	.db 0x00
__str_4:
	.ascii "April"
	.db 0x00
__str_5:
	.ascii "May"
	.db 0x00
__str_6:
	.ascii "June"
	.db 0x00
__str_7:
	.ascii "July"
	.db 0x00
__str_8:
	.ascii "August"
	.db 0x00
__str_9:
	.ascii "September"
	.db 0x00
__str_10:
	.ascii "October"
	.db 0x00
__str_11:
	.ascii "November"
	.db 0x00
__str_12:
	.ascii "December"
	.db 0x00
__str_13:
	.ascii "Monday"
	.db 0x00
__str_14:
	.ascii "Tuesday"
	.db 0x00
__str_15:
	.ascii "Wednesday"
	.db 0x00
__str_16:
	.ascii "Thursday"
	.db 0x00
__str_17:
	.ascii "Friday"
	.db 0x00
__str_18:
	.ascii "Saturday"
	.db 0x00
__str_19:
	.ascii "Sunday"
	.db 0x00
;ccp.c:8: void ccp_cls() {
;	---------------------------------
; Function ccp_cls
; ---------------------------------
_ccp_cls_start::
_ccp_cls:
;ccp.c:9: print("\033[H\033[2J\033[30m\033[47m\033[2KConsole\33[1;40H");
	ld	hl,#___str_20
	push	hl
	call	_print
	pop	af
;ccp.c:10: ccp_time();
	call	_ccp_time
;ccp.c:11: print("\033[39m\33[49m\33[2;1H");
	ld	hl,#___str_21
	push	hl
	call	_print
	pop	af
	ret
_ccp_cls_end::
___str_20:
	.db 0x1B
	.ascii "[H"
	.db 0x1B
	.ascii "[2J"
	.db 0x1B
	.ascii "[30m"
	.db 0x1B
	.ascii "[47m"
	.db 0x1B
	.ascii "[2KConsole"
	.db 0x1B
	.ascii "[1;40H"
	.db 0x00
___str_21:
	.db 0x1B
	.ascii "[39m"
	.db 0x1B
	.ascii "[49m"
	.db 0x1B
	.ascii "[2;1H"
	.db 0x00
;ccp.c:14: void ccp_time() {
;	---------------------------------
; Function ccp_time
; ---------------------------------
_ccp_time_start::
_ccp_time:
;ccp.c:15: bios_get_datetime();
	call	_bios_get_datetime
;ccp.c:16: print(days[clock.day-1]);
	ld	de,#_days+0
	ld	hl,#_clock+3
	ld	l,(hl)
	dec	l
	ld	h,#0x00
	add	hl, hl
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	call	_print
;ccp.c:17: print(", ");
	ld	hl, #___str_22+0
	ex	(sp),hl
	call	_print
	pop	af
;ccp.c:18: print(months[clock.month-1]);
	ld	de,#_months+0
	ld	hl,#_clock+5
	ld	l,(hl)
	dec	l
	ld	h,#0x00
	add	hl, hl
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	call	_print
;ccp.c:19: putc(' ');
	ld	h,#0x20
	ex	(sp),hl
	inc	sp
	call	_bios_conout
	inc	sp
;ccp.c:20: print_hex(clock.date);
	ld	hl,#_clock+4
	ld	h,(hl)
	push	hl
	inc	sp
	call	_print_hex
	inc	sp
;ccp.c:21: print(", 20");
	ld	hl,#___str_23+0
	push	hl
	call	_print
	pop	af
;ccp.c:22: print_hex(clock.year);
	ld	hl,#_clock+6
	ld	h,(hl)
	push	hl
	inc	sp
	call	_print_hex
	inc	sp
;ccp.c:23: putc(' ');
	ld	a,#0x20
	push	af
	inc	sp
	call	_bios_conout
	inc	sp
;ccp.c:24: print_hex(clock.hours);
	ld	hl,#_clock+2
	ld	h,(hl)
	push	hl
	inc	sp
	call	_print_hex
	inc	sp
;ccp.c:25: putc(':');
	ld	a,#0x3A
	push	af
	inc	sp
	call	_bios_conout
	inc	sp
;ccp.c:26: print_hex(clock.min);
	ld	hl,#_clock+1
	ld	h,(hl)
	push	hl
	inc	sp
	call	_print_hex
	inc	sp
;ccp.c:27: putc(':');
	ld	a,#0x3A
	push	af
	inc	sp
	call	_bios_conout
	inc	sp
;ccp.c:28: print_hex(clock.sec);
	ld	hl,#_clock+0
	ld	h,(hl)
	push	hl
	inc	sp
	call	_print_hex
	inc	sp
	ret
_ccp_time_end::
___str_22:
	.ascii ", "
	.db 0x00
___str_23:
	.ascii ", 20"
	.db 0x00
;ccp.c:31: void ccp_execute_command(const char* const command) {
;	---------------------------------
; Function ccp_execute_command
; ---------------------------------
_ccp_execute_command_start::
_ccp_execute_command:
;ccp.c:32: if (strcmp(command, "echo")) {
	ld	hl,#___str_24
	push	hl
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_strcmp
	pop	af
	pop	af
	ld	a, l
	or	a, a
	jr	Z,00111$
;ccp.c:33: ccp_echo(command);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_ccp_echo
;ccp.c:34: print("\r\n");
	ld	hl, #___str_25
	ex	(sp),hl
	call	_print
	pop	af
	ret
00111$:
;ccp.c:36: else if(strcmp(command, "dir")) {
	ld	hl,#___str_26+0
	push	hl
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_strcmp
	pop	af
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00108$
;ccp.c:37: ccp_dir();
	call	_ccp_dir
;ccp.c:38: print("\r\n");
	ld	hl,#___str_25+0
	push	hl
	call	_print
	pop	af
	ret
00108$:
;ccp.c:40: else if(strcmp(command, "cls")) {
	ld	hl,#___str_27+0
	push	hl
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_strcmp
	pop	af
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00105$
;ccp.c:41: ccp_cls();
	jp	_ccp_cls
00105$:
;ccp.c:43: else if(strcmp(command, "time")) {
	ld	hl,#___str_28+0
	push	hl
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_strcmp
	pop	af
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00102$
;ccp.c:44: print("\r\n");
	ld	hl,#___str_25
	push	hl
	call	_print
	pop	af
;ccp.c:45: ccp_time();
	call	_ccp_time
;ccp.c:46: print("\r\n");
	ld	hl,#___str_25
	push	hl
	call	_print
	pop	af
	ret
00102$:
;ccp.c:49: print("\r\nUnknown command\r\n");
	ld	hl,#___str_29+0
	push	hl
	call	_print
	pop	af
	ret
_ccp_execute_command_end::
___str_24:
	.ascii "echo"
	.db 0x00
___str_25:
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_26:
	.ascii "dir"
	.db 0x00
___str_27:
	.ascii "cls"
	.db 0x00
___str_28:
	.ascii "time"
	.db 0x00
___str_29:
	.db 0x0D
	.db 0x0A
	.ascii "Unknown command"
	.db 0x0D
	.db 0x0A
	.db 0x00
;ccp.c:54: char strcmp(const char* s1, const char* s2) {
;	---------------------------------
; Function strcmp
; ---------------------------------
_strcmp_start::
_strcmp:
	push	ix
	ld	ix,#0
	add	ix,sp
;ccp.c:55: do {
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e,6 (ix)
	ld	d,7 (ix)
	push	de
	pop	iy
00104$:
;ccp.c:56: if (*s1 != *s2) return FALSE;
	ld	a,(bc)
	ld	d,a
	ld	e, 0 (iy)
	ld	a,d
	sub	a, e
	jr	Z,00102$
	ld	l,#0x00
	jr	00107$
00102$:
;ccp.c:57: s1++;
	inc	bc
;ccp.c:58: s2++;
	inc	iy
;ccp.c:59: } while ((*s1 != 0) && (*s2 != 0));
	ld	a,(bc)
	or	a, a
	jr	Z,00106$
	ld	a, 0 (iy)
	or	a, a
	jr	NZ,00104$
00106$:
;ccp.c:60: return TRUE;
	ld	l,#0xFF
00107$:
	pop	ix
	ret
_strcmp_end::
;ccp.c:63: void buffer_append(char c) {
;	---------------------------------
; Function buffer_append
; ---------------------------------
_buffer_append_start::
_buffer_append:
;ccp.c:64: if (buffer_index == 255) return;
	ld	a,(#_buffer_index + 0)
	inc	a
	ret	Z
	jr	00102$
	ret
00102$:
;ccp.c:65: buffer[buffer_index] = c;
	ld	de,#_buffer+0
	ld	hl,(_buffer_index)
	ld	h,#0x00
	add	hl,de
	ld	iy,#2
	add	iy,sp
	ld	a,0 (iy)
	ld	(hl),a
;ccp.c:66: buffer_index++;
	ld	hl, #_buffer_index+0
	inc	(hl)
	ret
_buffer_append_end::
;ccp.c:69: char* buffer_read() {
;	---------------------------------
; Function buffer_read
; ---------------------------------
_buffer_read_start::
_buffer_read:
;ccp.c:70: buffer_index = 0;
	ld	hl,#_buffer_index + 0
	ld	(hl), #0x00
;ccp.c:71: buffer[255] = 0x00;
	ld	hl,#_buffer + 255
	ld	(hl),#0x00
;ccp.c:72: return buffer;
	ld	hl,#_buffer
	ret
_buffer_read_end::
;ccp.c:75: void ccp() {
;	---------------------------------
; Function ccp
; ---------------------------------
_ccp_start::
_ccp:
;ccp.c:77: print("\r\n>:");
	ld	hl,#___str_30+0
	push	hl
	call	_print
	pop	af
;ccp.c:79: while(1) {
00105$:
;ccp.c:81: c = bios_conin();
	call	_bios_conin
	ld	h,l
;ccp.c:82: if (c == CR) {
	ld	a,h
	sub	a, #0x0D
	jr	NZ,00102$
;ccp.c:83: buffer_append(0x00);
	xor	a, a
	push	af
	inc	sp
	call	_buffer_append
	inc	sp
;ccp.c:84: ccp_execute_command(buffer_read());
	call	_buffer_read
	push	hl
	call	_ccp_execute_command
;ccp.c:85: print(">:");
	ld	hl, #___str_31
	ex	(sp),hl
	call	_print
	pop	af
	jr	00105$
00102$:
;ccp.c:88: buffer_append(c);
	push	hl
	push	hl
	inc	sp
	call	_buffer_append
	inc	sp
	inc	sp
	call	_bios_conout
	inc	sp
	jr	00105$
_ccp_end::
___str_30:
	.db 0x0D
	.db 0x0A
	.ascii ">:"
	.db 0x00
___str_31:
	.ascii ">:"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
__xinit__buffer_index:
	.db #0x00	; 0
	.area _CABS (ABS)
