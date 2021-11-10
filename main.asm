
NC100=0

macro	PRINT_STR .str
	ld	HL,{.str}
	call	write_str
mend

	org	$6000
main:	jp	main2
; !!!!!!! TESTING !!!!!!!!
	ld	a,($42)
	ld	($763),a
	ld	DE,$1234
; !!!!!!! TESTING !!!!!!!!
main2:
IF NC100==0
	ld	A,$02
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


	cp	'Q'
	jr	z,.end
	jr	input_loop
.end:
	call	outcrlf
	ret

; *****************************************************************************
; *****************************************************************************
do_debug_dump:
	call	char_out
	ld	HL,0
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
	jp	figure_op		; Functions will return top ops_ret
.ops_ret:				; Because of the pushed BC above
 	inc	HL			; Be ready for next opcode
	call	outcrlf			; Newline
	call	wait_keyb		; Wait for the user to press a key
	ld	A,C
	call	to_upper		; Convert to upper case
	cp	' '			; If space or enter, dump next opcode
	jr	Z,.dump_op
	cp	$0D
	jr	Z,.dump_op
	cp	'Q'			; If Q, go back to main loop
	jr	NZ,.ops_ret		; Otherwise ignore the keypress
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

test_word:	defw	0
test_byte:	defb	0

prog_end:
IF NC100==0
SAVE 'nccmon.bin',main,prog_end-main,TAPE,'nccmon.cdt'
ELSE
SAVE 'nccmon.bin',main,prog_end-main
ENDIF
