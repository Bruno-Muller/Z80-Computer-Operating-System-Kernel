;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Sat Feb 28 23:58:13 2015
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _fct_clock
	.globl _ccp
	.globl _ccp_time
	.globl _ccp_cls
	.globl _print
	.globl _bios_conout
	.globl _bios_clock_handler
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
;main.c:4: void fct_clock() {
;	---------------------------------
; Function fct_clock
; ---------------------------------
_fct_clock_start::
_fct_clock:
;main.c:5: bios_conout(0x1B);
	ld	a,#0x1B
	push	af
	inc	sp
	call	_bios_conout
	inc	sp
;main.c:6: bios_conout('7');
	ld	a,#0x37
	push	af
	inc	sp
	call	_bios_conout
	inc	sp
;main.c:8: print("\033[?25l");
	ld	hl,#___str_0
	push	hl
	call	_print
;main.c:10: print("\033[7m");
	ld	hl, #___str_1
	ex	(sp),hl
	call	_print
;main.c:12: print("\33[1;40H");
	ld	hl, #___str_2
	ex	(sp),hl
	call	_print
	pop	af
;main.c:13: ccp_time();
	call	_ccp_time
;main.c:15: print("\033[27m");
	ld	hl,#___str_3
	push	hl
	call	_print
;main.c:17: bios_conout(0x1B);
	ld	h,#0x1B
	ex	(sp),hl
	inc	sp
	call	_bios_conout
	inc	sp
;main.c:18: bios_conout('8');
	ld	a,#0x38
	push	af
	inc	sp
	call	_bios_conout
	inc	sp
;main.c:20: print("\033[?25h");
	ld	hl,#___str_4
	push	hl
	call	_print
	pop	af
	ret
_fct_clock_end::
_months:
	.dw __str_5
	.dw __str_6
	.dw __str_7
	.dw __str_8
	.dw __str_9
	.dw __str_10
	.dw __str_11
	.dw __str_12
	.dw __str_13
	.dw __str_14
	.dw __str_15
	.dw __str_16
_days:
	.dw __str_17
	.dw __str_18
	.dw __str_19
	.dw __str_20
	.dw __str_21
	.dw __str_22
	.dw __str_23
___str_0:
	.db 0x1B
	.ascii "[?25l"
	.db 0x00
___str_1:
	.db 0x1B
	.ascii "[7m"
	.db 0x00
___str_2:
	.db 0x1B
	.ascii "[1;40H"
	.db 0x00
___str_3:
	.db 0x1B
	.ascii "[27m"
	.db 0x00
___str_4:
	.db 0x1B
	.ascii "[?25h"
	.db 0x00
__str_5:
	.ascii "January"
	.db 0x00
__str_6:
	.ascii "February"
	.db 0x00
__str_7:
	.ascii "March"
	.db 0x00
__str_8:
	.ascii "April"
	.db 0x00
__str_9:
	.ascii "May"
	.db 0x00
__str_10:
	.ascii "June"
	.db 0x00
__str_11:
	.ascii "July"
	.db 0x00
__str_12:
	.ascii "August"
	.db 0x00
__str_13:
	.ascii "September"
	.db 0x00
__str_14:
	.ascii "October"
	.db 0x00
__str_15:
	.ascii "November"
	.db 0x00
__str_16:
	.ascii "December"
	.db 0x00
__str_17:
	.ascii "Monday"
	.db 0x00
__str_18:
	.ascii "Tuesday"
	.db 0x00
__str_19:
	.ascii "Wednesday"
	.db 0x00
__str_20:
	.ascii "Thursday"
	.db 0x00
__str_21:
	.ascii "Friday"
	.db 0x00
__str_22:
	.ascii "Saturday"
	.db 0x00
__str_23:
	.ascii "Sunday"
	.db 0x00
;main.c:24: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
;main.c:25: ccp_cls();
	call	_ccp_cls
;main.c:27: print("\033[2;30r");
	ld	hl,#___str_24
	push	hl
	call	_print
;main.c:28: print("\r\n == Z80 DOS ==\r\n B. M. 2015");
	ld	hl, #___str_25
	ex	(sp),hl
	call	_print
;main.c:29: bios_clock_handler(&fct_clock);
	ld	hl, #_fct_clock
	ex	(sp),hl
	call	_bios_clock_handler
	pop	af
;main.c:30: ccp();
	jp	_ccp
_main_end::
___str_24:
	.db 0x1B
	.ascii "[2;30r"
	.db 0x00
___str_25:
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
