;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Wed Jan 07 18:46:49 2015
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _ccp
	.globl _ccp_execute_command
	.globl _ccp_cls
	.globl _ccp_echo
	.globl _buffer_read
	.globl _buffer_append
	.globl _strcmp
	.globl _ccp_dir
	.globl _print
	.globl _bios_conin
	.globl _bios_conout
	.globl _buffer_index
	.globl _buffer
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_buffer::
	.ds 256
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_buffer_index::
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
;main.c:13: char strcmp(const char* s1, const char* s2) {
;	---------------------------------
; Function strcmp
; ---------------------------------
_strcmp_start::
_strcmp:
	push	ix
	ld	ix,#0
	add	ix,sp
;main.c:14: do {
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e,6 (ix)
	ld	d,7 (ix)
	push	de
	pop	iy
00104$:
;main.c:15: if (*s1 != *s2) return FALSE;
	ld	a,(bc)
	ld	d,a
	ld	e, 0 (iy)
	ld	a,d
	sub	a, e
	jr	Z,00102$
	ld	l,#0x00
	jr	00107$
00102$:
;main.c:16: s1++;
	inc	bc
;main.c:17: s2++;
	inc	iy
;main.c:18: } while ((*s1 != 0) && (*s2 != 0));
	ld	a,(bc)
	or	a, a
	jr	Z,00106$
	ld	a, 0 (iy)
	or	a, a
	jr	NZ,00104$
00106$:
;main.c:19: return TRUE;
	ld	l,#0xFF
00107$:
	pop	ix
	ret
_strcmp_end::
;main.c:22: void buffer_append(char c) {
;	---------------------------------
; Function buffer_append
; ---------------------------------
_buffer_append_start::
_buffer_append:
;main.c:23: if (buffer_index == 255) return;
	ld	a,(#_buffer_index + 0)
	inc	a
	ret	Z
	jr	00102$
	ret
00102$:
;main.c:24: buffer[buffer_index] = c;
	ld	de,#_buffer+0
	ld	hl,(_buffer_index)
	ld	h,#0x00
	add	hl,de
	ld	iy,#2
	add	iy,sp
	ld	a,0 (iy)
	ld	(hl),a
;main.c:25: buffer_index++;
	ld	hl, #_buffer_index+0
	inc	(hl)
	ret
_buffer_append_end::
;main.c:28: char* buffer_read() {
;	---------------------------------
; Function buffer_read
; ---------------------------------
_buffer_read_start::
_buffer_read:
;main.c:29: buffer_index = 0;
	ld	hl,#_buffer_index + 0
	ld	(hl), #0x00
;main.c:30: buffer[255] = 0x00;
	ld	hl,#_buffer + 255
	ld	(hl),#0x00
;main.c:31: return buffer;
	ld	hl,#_buffer
	ret
_buffer_read_end::
;main.c:34: void ccp_echo(const char* string) {
;	---------------------------------
; Function ccp_echo
; ---------------------------------
_ccp_echo_start::
_ccp_echo:
;main.c:35: print("\r\n");
	ld	hl,#___str_0
	push	hl
	call	_print
	pop	af
;main.c:36: print(string);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_print
	pop	af
	ret
_ccp_echo_end::
___str_0:
	.db 0x0D
	.db 0x0A
	.db 0x00
;main.c:39: void ccp_cls() {
;	---------------------------------
; Function ccp_cls
; ---------------------------------
_ccp_cls_start::
_ccp_cls:
;main.c:40: print("\33[H\33[2J");
	ld	hl,#___str_1
	push	hl
	call	_print
	pop	af
	ret
_ccp_cls_end::
___str_1:
	.db 0x1B
	.ascii "[H"
	.db 0x1B
	.ascii "[2J"
	.db 0x00
;main.c:43: void ccp_execute_command(const char* const command) {
;	---------------------------------
; Function ccp_execute_command
; ---------------------------------
_ccp_execute_command_start::
_ccp_execute_command:
;main.c:44: if (strcmp(command, "echo")) {
	ld	hl,#___str_2
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
;main.c:45: ccp_echo(command);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_ccp_echo
;main.c:46: print("\r\n");
	ld	hl, #___str_3
	ex	(sp),hl
	call	_print
	pop	af
	ret
00108$:
;main.c:48: else if(strcmp(command, "dir")) {
	ld	hl,#___str_4+0
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
;main.c:49: ccp_dir();
	call	_ccp_dir
;main.c:50: print("\r\n");
	ld	hl,#___str_3+0
	push	hl
	call	_print
	pop	af
	ret
00105$:
;main.c:52: else if(strcmp(command, "cls")) {
	ld	hl,#___str_5+0
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
;main.c:53: ccp_cls();
	jp	_ccp_cls
00102$:
;main.c:56: print("\r\nUnknown command\r\n");
	ld	hl,#___str_6+0
	push	hl
	call	_print
	pop	af
	ret
_ccp_execute_command_end::
___str_2:
	.ascii "echo"
	.db 0x00
___str_3:
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_4:
	.ascii "dir"
	.db 0x00
___str_5:
	.ascii "cls"
	.db 0x00
___str_6:
	.db 0x0D
	.db 0x0A
	.ascii "Unknown command"
	.db 0x0D
	.db 0x0A
	.db 0x00
;main.c:61: void ccp() {
;	---------------------------------
; Function ccp
; ---------------------------------
_ccp_start::
_ccp:
;main.c:63: print("\r\n>:");
	ld	hl,#___str_7+0
	push	hl
	call	_print
	pop	af
;main.c:65: while(1) {
00105$:
;main.c:67: c = bios_conin();
	call	_bios_conin
	ld	h,l
;main.c:68: if (c == CR) {
	ld	a,h
	sub	a, #0x0D
	jr	NZ,00102$
;main.c:69: buffer_append(0x00);
	xor	a, a
	push	af
	inc	sp
	call	_buffer_append
	inc	sp
;main.c:70: ccp_execute_command(buffer_read());
	call	_buffer_read
	push	hl
	call	_ccp_execute_command
;main.c:71: print(">:");
	ld	hl, #___str_8
	ex	(sp),hl
	call	_print
	pop	af
	jr	00105$
00102$:
;main.c:74: buffer_append(c);
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
___str_7:
	.db 0x0D
	.db 0x0A
	.ascii ">:"
	.db 0x00
___str_8:
	.ascii ">:"
	.db 0x00
;main.c:82: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
;main.c:83: print("\r\n == Z80 DOS ==\r\n B. M. 2015");
	ld	hl,#___str_9
	push	hl
	call	_print
	pop	af
;main.c:84: ccp();
	jp	_ccp
_main_end::
___str_9:
	.db 0x0D
	.db 0x0A
	.ascii " == Z80 DOS =="
	.db 0x0D
	.db 0x0A
	.ascii " B. M. 2015"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
__xinit__buffer_index:
	.db #0x00	; 0
	.area _CABS (ABS)
