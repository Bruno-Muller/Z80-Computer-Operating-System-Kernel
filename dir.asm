;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Wed Jan 07 18:46:50 2015
;--------------------------------------------------------
	.module dir
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _print_dirattr
	.globl _print_dirname
	.globl _print_dirtime
	.globl _print_dirdate
	.globl _print_unsigned_int
	.globl _print
	.globl _bios_read
	.globl _bios_setdma
	.globl _bios_setsec
	.globl _bios_conout
	.globl _ccp_dir
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
;dir.c:14: void print_dirdate(unsigned int date) {
;	---------------------------------
; Function print_dirdate
; ---------------------------------
_print_dirdate_start::
_print_dirdate:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;dir.c:15: unsigned int year = (date>>9) + 1980;
	ld	a,5 (ix)
	srl	a
	ld	e,a
	ld	d,#0x00
	ld	hl,#0x07BC
	add	hl,de
	ld	c,l
	ld	b,h
;dir.c:16: unsigned int month = (date>>5) & 0x000F;
	ld	h,4 (ix)
	ld	l,5 (ix)
	srl	l
	rr	h
	srl	l
	rr	h
	srl	l
	rr	h
	srl	l
	rr	h
	srl	l
	rr	h
	ld	a,h
	and	a, #0x0F
	ld	e,a
	ld	d,#0x00
;dir.c:17: unsigned int day = date & 0x001F;
	ld	a,4 (ix)
	and	a, #0x1F
	ld	-2 (ix),a
	ld	-1 (ix),#0x00
;dir.c:19: print_unsigned_int(year,4);
	push	de
	ld	a,#0x04
	push	af
	inc	sp
	push	bc
	call	_print_unsigned_int
	pop	af
	inc	sp
	ld	a,#0x2D
	push	af
	inc	sp
	call	_bios_conout
	inc	sp
	pop	de
;dir.c:21: print_unsigned_int(month,2);
	ld	a,#0x02
	push	af
	inc	sp
	push	de
	call	_print_unsigned_int
	pop	af
	inc	sp
;dir.c:22: putc('-');
	ld	a,#0x2D
	push	af
	inc	sp
	call	_bios_conout
	inc	sp
;dir.c:23: print_unsigned_int(day,2);
	ld	a,#0x02
	push	af
	inc	sp
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_print_unsigned_int
	ld	sp,ix
	pop	ix
	ret
_print_dirdate_end::
;dir.c:26: void print_dirtime(unsigned int time) {
;	---------------------------------
; Function print_dirtime
; ---------------------------------
_print_dirtime_start::
_print_dirtime:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;dir.c:27: unsigned int hours = time>>11;
	ld	a,5 (ix)
	rrca
	rrca
	rrca
	and	a,#0x1F
	ld	c,a
	ld	b,#0x00
;dir.c:28: unsigned int min = (time>>5) & 0x003F;
	ld	l,4 (ix)
	ld	h,5 (ix)
	srl	h
	rr	l
	srl	h
	rr	l
	srl	h
	rr	l
	srl	h
	rr	l
	srl	h
	rr	l
	ld	a,l
	and	a, #0x3F
	ld	e,a
	ld	d,#0x00
;dir.c:29: unsigned int sec = (time & 0x000F)<<1;
	ld	a,4 (ix)
	and	a, #0x0F
	ld	l,a
	ld	h,#0x00
	add	hl, hl
	ex	(sp), hl
;dir.c:31: print_unsigned_int(hours,2);
	push	de
	ld	a,#0x02
	push	af
	inc	sp
	push	bc
	call	_print_unsigned_int
	pop	af
	inc	sp
	ld	a,#0x3A
	push	af
	inc	sp
	call	_bios_conout
	inc	sp
	pop	de
;dir.c:33: print_unsigned_int(min,2);
	ld	a,#0x02
	push	af
	inc	sp
	push	de
	call	_print_unsigned_int
	pop	af
	inc	sp
;dir.c:34: putc(':');
	ld	a,#0x3A
	push	af
	inc	sp
	call	_bios_conout
	inc	sp
;dir.c:35: print_unsigned_int(sec,2);
	ld	a,#0x02
	push	af
	inc	sp
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_print_unsigned_int
	ld	sp,ix
	pop	ix
	ret
_print_dirtime_end::
;dir.c:39: void print_dirname(const char* string) {
;	---------------------------------
; Function print_dirname
; ---------------------------------
_print_dirname_start::
_print_dirname:
;dir.c:41: for (i=0;i<11;i++) {
	ld	e,#0x00
00102$:
;dir.c:42: bios_conout(string[i]);
	ld	hl, #2
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	d,#0x00
	add	hl, de
	ld	h,(hl)
	push	de
	push	hl
	inc	sp
	call	_bios_conout
	inc	sp
	pop	de
;dir.c:41: for (i=0;i<11;i++) {
	inc	e
	ld	a,e
	sub	a, #0x0B
	jr	C,00102$
	ret
_print_dirname_end::
;dir.c:46: void print_dirattr(unsigned char attr) {
;	---------------------------------
; Function print_dirattr
; ---------------------------------
_print_dirattr_start::
_print_dirattr:
	push	ix
	ld	ix,#0
	add	ix,sp
;dir.c:47: if (attr == ATTR_LONG_NAME) {
	ld	a,4 (ix)
	sub	a, #0x0F
	jr	NZ,00102$
;dir.c:48: print("        LONG NAME       ");
	ld	hl,#___str_0
	push	hl
	call	_print
	pop	af
;dir.c:49: return;
	jp	00103$
00102$:
;dir.c:51: print((attr & ATTR_DIRECTORY)?"DIR":"---");
	bit	4, 4 (ix)
	jr	Z,00105$
	ld	hl,#___str_1+0
	jr	00106$
00105$:
	ld	hl,#___str_2+0
00106$:
	push	hl
	call	_print
	pop	af
;dir.c:52: print((attr & ATTR_VOLUME_ID)?" VID":" ---");
	bit	3, 4 (ix)
	jr	Z,00107$
	ld	hl,#___str_3+0
	jr	00108$
00107$:
	ld	hl,#___str_4+0
00108$:
	push	hl
	call	_print
	pop	af
;dir.c:53: print((attr & ATTR_SYSTEM)?" SYS":" ---");
	bit	2, 4 (ix)
	jr	Z,00109$
	ld	hl,#___str_5+0
	jr	00110$
00109$:
	ld	hl,#___str_4+0
00110$:
	push	hl
	call	_print
	pop	af
;dir.c:54: print((attr & ATTR_HIDDEN)?" HID":" ---");
	bit	1, 4 (ix)
	jr	Z,00111$
	ld	hl,#___str_6+0
	jr	00112$
00111$:
	ld	hl,#___str_4+0
00112$:
	push	hl
	call	_print
	pop	af
;dir.c:55: print((attr & ATTR_READ_ONLY)?" RO":" --");
	bit	0, 4 (ix)
	jr	Z,00113$
	ld	hl,#___str_7+0
	jr	00114$
00113$:
	ld	hl,#___str_8+0
00114$:
	push	hl
	call	_print
	pop	af
;dir.c:56: print((attr & ATTR_ARCHIVE)?" ARCH":" ----");
	bit	5, 4 (ix)
	jr	Z,00115$
	ld	hl,#___str_9+0
	jr	00116$
00115$:
	ld	hl,#___str_10+0
00116$:
	push	hl
	call	_print
	pop	af
00103$:
	pop	ix
	ret
_print_dirattr_end::
___str_0:
	.ascii "        LONG NAME       "
	.db 0x00
___str_1:
	.ascii "DIR"
	.db 0x00
___str_2:
	.ascii "---"
	.db 0x00
___str_3:
	.ascii " VID"
	.db 0x00
___str_4:
	.ascii " ---"
	.db 0x00
___str_5:
	.ascii " SYS"
	.db 0x00
___str_6:
	.ascii " HID"
	.db 0x00
___str_7:
	.ascii " RO"
	.db 0x00
___str_8:
	.ascii " --"
	.db 0x00
___str_9:
	.ascii " ARCH"
	.db 0x00
___str_10:
	.ascii " ----"
	.db 0x00
;dir.c:59: void ccp_dir() {
;	---------------------------------
; Function ccp_dir
; ---------------------------------
_ccp_dir_start::
_ccp_dir:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-10
	add	hl,sp
	ld	sp,hl
;dir.c:68: const unsigned int AbsoluteFirstRootDirSecNum = bpb->BPB_RsvSecCnt + bpb->BPB_NumFATs * bpb->BPB_FATs16 + partition->firstPartitionSector;
	ld	hl,#0x130E
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(#0x1310)
	ld	hl,#0x1316
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,a
	ld	h,#0x00
	push	de
	push	bc
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	pop	de
	add	hl,de
	push	hl
	ld	de,#0x12C6
	ld	hl, #0x0008
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	de
	ld	hl,#0x0000
	ld	a,e
	add	a, -4 (ix)
	ld	-4 (ix),a
	ld	a,d
	adc	a, -3 (ix)
	ld	-3 (ix),a
	ld	a,l
	adc	a, -2 (ix)
	ld	-2 (ix),a
	ld	a,h
	adc	a, -1 (ix)
	ld	-1 (ix),a
	ld	a,-4 (ix)
	ld	-7 (ix),a
	ld	a,-3 (ix)
	ld	-6 (ix),a
;dir.c:75: print("\r\n    NAME           ATTRIBUTES       SIZE     DATE      TIME");
	ld	hl,#___str_11
	push	hl
	call	_print
;dir.c:76: print("\r\n----------- ----------------------- ----- ---------- --------");
	ld	hl, #___str_12
	ex	(sp),hl
	call	_print
	pop	af
;dir.c:79: for (sector = 0; sector < RootDirSectors; sector++) {
	ld	-8 (ix),#0x00
00112$:
	ld	a,-8 (ix)
	sub	a, #0x20
	jp	NC,00114$
;dir.c:81: bios_setsec(AbsoluteFirstRootDirSecNum + sector);
	ld	a,-8 (ix)
	ld	-4 (ix),a
	ld	-3 (ix),#0x00
	ld	a,-4 (ix)
	ld	-4 (ix),a
	ld	a,-3 (ix)
	ld	-3 (ix),a
	ld	a,-4 (ix)
	add	a, -7 (ix)
	ld	-4 (ix),a
	ld	a,-3 (ix)
	adc	a, -6 (ix)
	ld	-3 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	_bios_setsec
;dir.c:82: bios_setdma(rootDirectory);
	ld	hl, #0x2100
	ex	(sp),hl
	call	_bios_setdma
	pop	af
;dir.c:83: bios_read();
	call	_bios_read
;dir.c:87: for (i=0; i<16; i++, entry++) {
	ld	-5 (ix),#0x00
	ld	hl,#0x2100
	ex	(sp), hl
00110$:
;dir.c:88: if (entry->DIR_Name[0] == 0x00) {sector = RootDirSectors; break;} // end of directory
	pop	hl
	push	hl
	ld	a,(hl)
	or	a, a
	jr	NZ,00102$
	ld	-8 (ix),#0x20
	jp	00113$
00102$:
;dir.c:89: if (entry->DIR_Name[0] == 0xE5) continue; // deleted file
	sub	a, #0xE5
	jp	Z,00107$
;dir.c:90: if (entry->DIR_Attr == ATTR_LONG_NAME) continue;
	ld	a,-10 (ix)
	add	a, #0x0B
	ld	l,a
	ld	a,-9 (ix)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	sub	a, #0x0F
	jr	Z,00107$
;dir.c:92: print("\r\n");
	ld	de,#___str_13
	push	hl
	push	de
	call	_print
	pop	af
	pop	hl
;dir.c:93: print_dirname(entry->DIR_Name);
	pop	de
	push	de
	push	hl
	push	de
	call	_print_dirname
	ld	h,#0x20
	ex	(sp),hl
	inc	sp
	call	_bios_conout
	inc	sp
	pop	hl
;dir.c:95: print_dirattr(entry->DIR_Attr);
	ld	h,(hl)
	push	hl
	inc	sp
	call	_print_dirattr
	inc	sp
;dir.c:96: putc(' ');
	ld	a,#0x20
	push	af
	inc	sp
	call	_bios_conout
	inc	sp
;dir.c:97: print_unsigned_int((unsigned int) entry->DIR_FileSize, 5);
	pop	hl
	push	hl
	ld	de, #0x001C
	add	hl, de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,#0x05
	push	af
	inc	sp
	push	de
	call	_print_unsigned_int
	pop	af
	inc	sp
;dir.c:98: putc(' ');
	ld	a,#0x20
	push	af
	inc	sp
	call	_bios_conout
	inc	sp
;dir.c:99: print_dirdate(entry->DIR_WrtDate);
	pop	hl
	push	hl
	ld	de, #0x0018
	add	hl, de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	call	_print_dirdate
;dir.c:100: putc(' ');
	ld	h,#0x20
	ex	(sp),hl
	inc	sp
	call	_bios_conout
	inc	sp
;dir.c:101: print_dirtime(entry->DIR_WrtTime);
	pop	hl
	push	hl
	ld	de, #0x0016
	add	hl, de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	call	_print_dirtime
	pop	af
00107$:
;dir.c:87: for (i=0; i<16; i++, entry++) {
	inc	-5 (ix)
	ld	a,-10 (ix)
	add	a, #0x20
	ld	-10 (ix),a
	ld	a,-9 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
	ld	a,-5 (ix)
	sub	a, #0x10
	jp	C,00110$
00113$:
;dir.c:79: for (sector = 0; sector < RootDirSectors; sector++) {
	inc	-8 (ix)
	jp	00112$
00114$:
	ld	sp, ix
	pop	ix
	ret
_ccp_dir_end::
___str_11:
	.db 0x0D
	.db 0x0A
	.ascii "    NAME           ATTRIBUTES       SIZE     DATE      TIM"
	.ascii "E"
	.db 0x00
___str_12:
	.db 0x0D
	.db 0x0A
	.ascii "----------- ----------------------- ----- ---------- -----"
	.ascii "---"
	.db 0x00
___str_13:
	.db 0x0D
	.db 0x0A
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
