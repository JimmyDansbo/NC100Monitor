
NC100=0

macro	PRINT_STR .str
	ld	HL,{.str}
	call	write_str
mend

	org	$6000
main: jp main2
.buf	defs	16,$FE
	ld	HL,hex_char_list
	ld	DE,.buf
	ld	BC,16
	ldir
main2:
	ld	HL,0		; Save current SP in rr_sp variable
	add	HL,SP
	ld	(rr_sp),HL
	ld	HL,(vr_sp)	; Set SP to point into 256 byte area
	ld	SP,HL		; This used as NCCmon's stack
	call	save_vregs
	ex	AF,AF'
	exx

IF NC100==0
	ld	A,$02		; Set 80 column mode
	call	$BC0E
ENDIF
	call	clear_scr
	PRINT_STR prog_name
	call	outcrlf
	ld	A,'.'
	call	char_out
	call	cursor_on
input_loop:
	call	wait_keyb
	ld	A,C
	call	to_upper

	cp	'M'
	call	Z,do_mem_dump
	cp	'D'
	call	Z,do_debug_dump
	cp	'S'
	call	Z,single_step
	cp	'R'
	jr	NZ,.skip
	ld	A,' '
	call	char_out
	call	out_vregs.nomov
	call	outcrlf
	ld	A,'.'
	call	char_out
	jr	input_loop
.skip:
	cp	'Q'
	jr	z,.end
	jr	input_loop
.end:
	call	outcrlf
	ld	HL,(rr_sp)
	ld	SP,HL
	ret

; *****************************************************************************
; *****************************************************************************
single_step:
	call	char_out
	sbc	hl,hl
	call	get_addr
.next_op:
	call	disp_addr
	ld	A,' '
	call	char_out
	call	char_out
	; Calculate return address
	ld	BC,.ops_ret
	push	BC

	call	clear_vcmd
	ld	A,(HL)			; Write byte of opcode to vcmd_space
	ld	(vcmd_space),A
	push	HL
	call	hexout
	pop	HL
	ld	A,(HL)
	push	HL
	jp	figure_op
.ops_ret:
	inc	HL
	push	HL
	call	out_vregs
.wait:	call	wait_keyb
	ld	A,C
	call	to_upper
	cp	' '
	jr	Z,.exec_op
	cp	$0D
	jr	Z,.exec_op
	cp	'Q'
	jr	NZ,.wait
	call	outcrlf
	ld	A,'.'
	call	char_out
	pop	HL
	ret
.exec_op:
	call	outcrlf
	pop	HL
	call	save_rregs
	call	restore_vregs
	call	vcmd_start
	call	save_vregs
	call	restore_rregs
	jr	.next_op

out_vregs:
	call get_xy
	ld	H,39
	call goto_xy
.nomov:	ld	A,'A'
	call	char_out
	ld	A,':'
	call	char_out
	ld	A,(vr_a)
	call	hexout
	ld	A,(vr_f)
	call	hexout
	ld	A,' '
	call	char_out
	ld	A,'B'
	call	char_out
	ld	A,':'
	call	char_out
	ld	A,(vr_b)
	call	hexout
	ld	A,(vr_c)
	call	hexout
	ld	A,' '
	call	char_out
	ld	A,'D'
	call	char_out
	ld	A,':'
	call	char_out
	ld	A,(vr_d)
	call	hexout
	ld	A,(vr_e)
	call	hexout
	ld	A,' '
	call	char_out
	ld	A,'H'
	call	char_out
	ld	A,':'
	call	char_out
	ld	A,(vr_h)
	call	hexout
	ld	A,(vr_l)
	call	hexout
	ld	A,' '
	call	char_out
	ld	A,'X'
	call	char_out
	ld	A,':'
	call	char_out
	ld	A,(vr_ixh)
	call	hexout
	ld	A,(vr_ixl)
	call	hexout
	ld	A,' '
	call	char_out
	ld	A,'Y'
	call	char_out
	ld	A,':'
	call	char_out
	ld	A,(vr_iyh)
	call	hexout
	ld	A,(vr_iyl)
	call	hexout
	ret


clear_vcmd:
	ld	A,$00
	ld	(vcmd_space+1),A
	ld	(vcmd_space+2),A
	ld	(vcmd_space+3),A
	ret

save_rregs:
	ld	(rr_bc),BC
	ld	(rr_de),DE
	ld	(rr_hl),HL
	push	AF
	pop	HL
	ld	(rr_af),HL
	ld	(rr_iy),IY
	ld	(rr_ix),IX

	ex	AF,AF'
	exx
	ld	(rr_bco),BC
	ld	(rr_deo),DE
	ld	(rr_hlo),HL
	push	AF
	pop	HL
	ld	(rr_afo),HL
	ret

restore_rregs:
	ld	HL,(rr_afo)
	push	HL
	pop	AF
	ld	HL,(rr_hlo)
	ld	BC,(rr_bco)
	ld	DE,(rr_deo)
	ex	AF,AF'
	exx
	ld	HL,(rr_af)
	push	HL
	pop	AF
	ld	HL,(rr_hl)
	ld	BC,(rr_bc)
	ld	DE,(rr_de)
	ld	IX,(rr_ix)
	ld	IY,(rr_iy)
	ret

save_vregs:
	ld	(vr_bc),BC
	ld	(vr_de),DE
	ld	(vr_hl),HL
	push	AF
	pop	HL
	ld	(vr_af),HL
	ld	(vr_iy),IY
	ld	(vr_ix),IX

	ex	AF,AF'
	exx
	ld	(vr_bco),BC
	ld	(vr_deo),DE
	ld	(vr_hlo),HL
	push	AF
	pop	HL
	ld	(vr_afo),HL
	ret

restore_vregs:
	ld	HL,(vr_afo)
	push	HL
	pop	AF
	ld	HL,(vr_hlo)
	ld	BC,(vr_bco)
	ld	DE,(vr_deo)
	ex	AF,AF'
	exx
	ld	HL,(vr_af)
	push	HL
	pop	AF
	ld	HL,(vr_hl)
	ld	BC,(vr_bc)
	ld	DE,(vr_de)
	ld	IX,(vr_ix)
	ld	IY,(vr_iy)
	ret

; *****************************************************************************
; *****************************************************************************
do_debug_dump:
	call	char_out
	sbc	hl,hl
	call	get_addr
.dump_op:
	call	disp_addr		; Show current address
	ld	A,' '
	call	char_out
	call	char_out

	; Calculate return address
	ld	BC,.ops_ret
	push	BC

	ld	A,(HL)			; Show first code of command
	push	HL
	call	hexout
	pop	HL
	ld	A,(HL)
	push	HL
	jp	figure_op		; Functions will return to ops_ret
.ops_ret:				; Because of the pushed BC above
 	inc	HL			; Be ready for next opcode
	call	outcrlf			; Newline
.wait:	call	wait_keyb		; Wait for the user to press a key
	ld	A,C
	call	to_upper		; Convert to upper case
	cp	' '			; If space or enter, dump next opcode
	jr	Z,.dump_op
	cp	$0D
	jr	Z,.dump_op
	cp	'Q'			; If Q, go back to main loop
	jr	NZ,.wait		; Otherwise ignore the keypress
	ld	A,'.'
	call	char_out
	ret

; *****************************************************************************
; Get 16 bit value from keyboard and place it in HL registers
; *****************************************************************************
; *****************************************************************************
get_addr:
	call	wait_keyb
	ld	A,C
	cp	' '			; If it is a space, ignore it
	jr	Z,get_addr
	cp	13			; If it is enter, return
	jr	Z,.end
	cp	$7F			; If it is backspace, handle it
	jr	NZ,.fwd
	srl	HL
	srl	HL
	srl	HL
	srl	HL
	push	HL
	push	AF
	call	do_backspace
	pop	AF
	pop	HL
	jr	get_addr
.fwd:	call	to_upper
	ld	B,A			; Save Character code
	call	atohex
	cp	$10
	jr	NC, get_addr		; If it is other than hex char, ignore
	ld	C,A			; Save Hex value
	ld	A,B			; Restore char code for printing
	call	char_out
	ld	A,C			; Restore hex value to accumulator
	sla	HL
	sla	HL
	sla	HL
	sla	HL
	or	L
	ld	L,A
	jr	get_addr
.end:
	call	outcrlf
	ret

; *****************************************************************************
; Get starting address from user and start dumping memory.
; *****************************************************************************
;[xxxx]  xx xx xx xx  xx xx xx xx   xx xx xx xx  xx xx xx xx   ................
; *****************************************************************************
do_mem_dump:
	call	char_out
	ld	HL,0
	call	get_addr
.dump_line:
	call	disp_addr
	ld	A,' '
	call	char_out
	call	char_out

	ld	E,4
.out_loop:
	ld	D,4
.in_loop:
	ld	A,(HL)
	push	HL
	push	DE
	call	hexout
	pop	DE
	pop	HL
	ld	A,' '
	call	char_out
	inc	HL
	dec	D
	jr	NZ,.in_loop
	call	char_out
	dec	E
	jr	NZ,.out_loop

	ld	DE,$10
	sbc	HL,DE

	ld	E,4
.oloop:
	ld	D,4
.iloop:
	ld	A,(HL)
	cp	' '
	jr	C,.dot
	cp	$7F
	jr	NC,.dot
	jr	.wr
.dot:	ld	A,'.'
.wr:	call	char_out
	inc	HL
	dec	D
	jr	NZ,.iloop
	dec	E
	jr	NZ,.oloop

	call	outcrlf

.keyb_loop:
	call	wait_keyb
	ld	A,C
	call	to_upper
	cp	' '
	jr	Z,.dump_line
	cp	$0D
	jr	Z,.dump_line
	cp	'Q'
	jr	NZ,.keyb_loop

	ld	A,'.'
	call	char_out

	ret

; *****************************************************************************
; Convert character in A to uppercase if it is lower case
; *****************************************************************************
to_upper:
	cp	'a'
	ret	C
	and	$DF
	ret

; *****************************************************************************
; Move cursor 1 char to the left, overwrite char with space and move left again
; *****************************************************************************
; Uses:	AF & HL
; *****************************************************************************
do_backspace:
	call	get_xy
	dec	H
	call	goto_xy
	ld	A,' '
	call	char_out
	call	goto_xy
	ret

; *****************************************************************************
; Display the 16 bit value stored in HL
; *****************************************************************************
disp_addr:
	ld	A,'['
	call	char_out
	ld	A,H
	push	HL
	call	hexout
	pop	HL
	ld	A,L
	push	HL
	call	hexout
	pop	HL
	ld	A,']'
	call	char_out
	ret

; *****************************************************************************
; Output value in A as Hex, one nibble at a time
; *****************************************************************************
; Uses:	A & B
; *****************************************************************************
hexout:
	ld	B,A		; Save a copy of A
	srl	A		; Move high nibble to low nibble
	srl	A
	srl	A
	srl	A
	call	tohex		; Convert value to ASCII
	call	char_out	; Output to display
	ld	A,B		; Restore A
	and	$0F		; zero out upper nibble
	call	tohex		; Convert value to ASCII
	call	char_out	; Output to display
	ret

; *****************************************************************************
; Translate value in low nibble of A to Hex Char code for display
; *****************************************************************************
; Uses:	A, DE, HL
; *****************************************************************************
tohex:
	ld	D, 0		; Copy A to DE
	ld	E, A
	ld	HL, hex_char_list
	add	HL, DE		; Caclucalte correct byte in list
	ld	A,(HL)		; Load the byte into A
	ret

; *****************************************************************************
; Convert char code for 0-9,A-F in A to single hex digit
; *****************************************************************************
atohex:
	sub	$30
	cp	10
	ret	M	; If result negative it was 0-9 we're done
	sub	$7	; otherwise, subtract $7 more to get to $0A-$0F
	ret

; *****************************************************************************
; Output CR, LF to display
; *****************************************************************************
; Uses:	A
; *****************************************************************************
outcrlf:
	ld	A, 13
	call	char_out
	ld	A, 10
	call	char_out
	ret

vcmd_start:
	ld	HL,0			; Move SP to HL
	add	HL,SP
	ld	(vr_sp),HL		; Save SP to "virtual" stack
	ld	HL,(rr_sp)		; Set the "real" stackpointer
	ld	SP,HL
	ld	HL,(vr_hl)		; Restore HL
vcmd_space:
	defs	4,$00			; Actual op being executed
vmd_end:
	ld	(vr_hl),HL		; Save HL
	ld	HL,0			; Move SP to HL
	add	HL,SP
	ld	(rr_sp),HL		; Save SP to "real" stack
	ld	HL,(vr_sp)		; Set the "virtual" stackpointer
	ld	SP,HL
	ld	HL,(vr_hl)		; Restore HL
	ret

rr_af:
rr_f	defb	0
rr_a	defb	0
rr_bc:
rr_c	defb	0
rr_b	defb	0
rr_de:
rr_e	defb	0
rr_d	defb	0
rr_hl:
rr_l	defb	0
rr_h	defb	0
rr_ix:
rr_ixl	defb	0
rr_ixh	defb	0
rr_iy:
rr_iyl	defb	0
rr_iyh	defb	0

rr_afo:
rr_fo	defb	0
rr_ao	defb	0
rr_bco:
rr_co	defb	0
rr_bo	defb	0
rr_deo:
rr_eo	defb	0
rr_do	defb	0
rr_hlo:
rr_lo	defb	0
rr_ho	defb	0

vr_af:
vr_f	defb	0
vr_a	defb	0
vr_bc:
vr_c	defb	0
vr_b	defb	0
vr_de:
vr_e	defb	0
vr_d	defb	0
vr_hl:
vr_l	defb	0
vr_h	defb	0
vr_ix:
vr_ixl	defb	0
vr_ixh	defb	0
vr_iy:
vr_iyl	defb	0
vr_iyh	defb	0

vr_afo:
vr_fo	defb	0
vr_ao	defb	0
vr_bco:
vr_co	defb	0
vr_bo	defb	0
vr_deo:
vr_eo	defb	0
vr_do	defb	0
vr_hlo:
vr_lo	defb	0
vr_ho	defb	0

vr_sp	defw	vstack_end
rr_sp	defw	0

tmp_hl	defw	0

vstack:
	defs	256,$5A
vstack_end:

; Flag places:	7  6  5  4  3  2  1  0
;		S  Z  x  H  x P/V N  C
; S:	Sign
; Z:	Zero
; H:	Half Carry
; P/V:	Parity/Overflow
; N: 	Add/Subtract
; C:	Carry
; x:	not used


hex_char_list:;  0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
	defb	$30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$41,$42,$43,$44,$45,$46
prog_name:
	defb	"NC100 Monitor by Jimmy Dansbo",0

	include 'nc100_funcs.asm'
	include 'nc100_vars.asm'
	include 'nc100_ports.asm'
	include	'kernwrap.asm'
	include 'opcode.asm'
	include '1word_op.asm'
	include 'op_list.asm'
	include	'dd_list.asm'
	include 'fd_list.asm'
	include 'ed_list.asm'
	include 'cb_list.asm'

prog_end:
IF NC100==0
SAVE 'nccmon.bin',main,prog_end-main,TAPE,'nccmon.cdt'
ELSE
SAVE 'nccmon.bin',main,prog_end-main
ENDIF
