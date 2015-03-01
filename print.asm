;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Sat Feb 28 23:58:14 2015
;--------------------------------------------------------
	.module print
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _bios_conout
	.globl _print
	.globl _print_hex
	.globl _print_unsigned_int
	.globl _print_unsigned_int_hex
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
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
;print.c:3: void print(const char* string) {
;	---------------------------------
; Function print
; ---------------------------------
_print_start::
_print:
;print.c:4: do {
	pop	bc
	pop	hl
	push	hl
	push	bc
00101$:
;print.c:5: bios_conout(*string);
	ld	d,(hl)
	push	hl
	push	de
	inc	sp
	call	_bios_conout
	inc	sp
	pop	hl
;print.c:6: string++;
	inc	hl
;print.c:7: } while (*string != 0);
	ld	a,(hl)
	or	a, a
	jr	NZ,00101$
	ret
_print_end::
;print.c:10: void print_hex(unsigned char hex) {
;	---------------------------------
; Function print_hex
; ---------------------------------
_print_hex_start::
_print_hex:
;print.c:11: unsigned char tmp = (hex>>4) & 0x0F;
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	and	a, #0x0F
;print.c:12: putc(tmp<0x0A?tmp+'0':tmp-0x0A+'A');
	ld	h,a
	sub	a, #0x0A
	jr	NC,00103$
	ld	a,h
	add	a, #0x30
	jr	00104$
00103$:
	ld	a,h
	add	a, #0x37
00104$:
	push	af
	inc	sp
	call	_bios_conout
	inc	sp
;print.c:13: tmp = hex & 0x0F;
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	and	a, #0x0F
;print.c:12: putc(tmp<0x0A?tmp+'0':tmp-0x0A+'A');
;print.c:14: putc(tmp<0x0A?tmp+'0':tmp-0x0A+'A');
	ld	h,a
	sub	a, #0x0A
	jr	NC,00105$
	ld	a,h
	add	a, #0x30
	jr	00106$
00105$:
	ld	a,h
	add	a, #0x37
00106$:
	push	af
	inc	sp
	call	_bios_conout
	inc	sp
	ret
_print_hex_end::
;print.c:17: void print_unsigned_int(unsigned int data, char n) {
;	---------------------------------
; Function print_unsigned_int
; ---------------------------------
_print_unsigned_int_start::
_print_unsigned_int:
	push	ix
	ld	ix,#0
	add	ix,sp
;print.c:18: if (n>4)  putc((data/10000)+'0');
	ld	a,#0x04
	sub	a, 6 (ix)
	jp	PO, 00127$
	xor	a, #0x80
00127$:
	jp	P,00102$
	ld	hl,#0x2710
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__divuint_rrx_s
	pop	af
	pop	af
	ld	a,l
	add	a, #0x30
	push	af
	inc	sp
	call	_bios_conout
	inc	sp
00102$:
;print.c:19: if (n>3) putc((data/1000)%10+'0');
	ld	a,#0x03
	sub	a, 6 (ix)
	jp	PO, 00128$
	xor	a, #0x80
00128$:
	jp	P,00104$
	ld	hl,#0x03E8
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__divuint_rrx_s
	pop	af
	pop	af
	ld	bc,#0x000A
	push	bc
	push	hl
	call	__moduint_rrx_s
	pop	af
	pop	af
	ld	a,l
	add	a, #0x30
	push	af
	inc	sp
	call	_bios_conout
	inc	sp
00104$:
;print.c:20: if (n>2) putc((data/100)%10+'0');
	ld	a,#0x02
	sub	a, 6 (ix)
	jp	PO, 00129$
	xor	a, #0x80
00129$:
	jp	P,00106$
	ld	hl,#0x0064
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__divuint_rrx_s
	pop	af
	pop	af
	ld	bc,#0x000A
	push	bc
	push	hl
	call	__moduint_rrx_s
	pop	af
	pop	af
	ld	a,l
	add	a, #0x30
	push	af
	inc	sp
	call	_bios_conout
	inc	sp
00106$:
;print.c:21: if (n>1) putc((data/10)%10+'0');
	ld	a,#0x01
	sub	a, 6 (ix)
	jp	PO, 00130$
	xor	a, #0x80
00130$:
	jp	P,00108$
	ld	hl,#0x000A
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__divuint_rrx_s
	pop	af
	pop	af
	ld	bc,#0x000A
	push	bc
	push	hl
	call	__moduint_rrx_s
	pop	af
	pop	af
	ld	a,l
	add	a, #0x30
	push	af
	inc	sp
	call	_bios_conout
	inc	sp
00108$:
;print.c:22: putc(data%10+'0');
	ld	hl,#0x000A
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__moduint_rrx_s
	pop	af
	pop	af
	ld	a,l
	add	a, #0x30
	push	af
	inc	sp
	call	_bios_conout
	inc	sp
	pop	ix
	ret
_print_unsigned_int_end::
;print.c:25: void print_unsigned_int_hex(unsigned int data) {
;	---------------------------------
; Function print_unsigned_int_hex
; ---------------------------------
_print_unsigned_int_hex_start::
_print_unsigned_int_hex:
	push	af
;print.c:27: tmp.value=data;
	ld	hl,#0x0000
	add	hl,sp
	ld	iy,#4
	add	iy,sp
	ld	a,0 (iy)
	ld	(hl),a
	inc	hl
	ld	a,1 (iy)
	ld	(hl),a
;print.c:29: print_hex(tmp.bytes[1]);
	ld	hl,#0x0001
	add	hl,sp
	ld	h,(hl)
	push	hl
	inc	sp
	call	_print_hex
	inc	sp
;print.c:30: print_hex(tmp.bytes[0]);
	ld	hl,#0x0000
	add	hl,sp
	ld	h,(hl)
	push	hl
	inc	sp
	call	_print_hex
	inc	sp
	pop	af
	ret
_print_unsigned_int_hex_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
