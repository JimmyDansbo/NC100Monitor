
handle_dd:
	pop	HL		; Remove Address of $DD from stack
	ld	A,' '
	call	char_out	; Print a space
	inc	HL		; Go to next address and save it on stack
	push	HL
	ld	A,(HL)		; Print hex value
	call	hexout
	pop	HL
	ld	A,(HL)
	push	HL		; Save HL on stack

	ld	BC,dd_list
	ld	H,0
	ld	L,A
	add	HL,HL
	add	HL,BC
	ld	C,(HL)
	inc	HL
	ld	B,(HL)
	push	BC
	pop	IX
	pop	HL
	push	HL
	jp	(ix)


	ret

handle_fd:
	pop	HL		; Remove Address of $FD from stack
	ld	A,' '
	call	char_out	; Print a space
	inc	HL		; Go to next address and save it on stack
	push	HL
	ld	A,(HL)		; Print hex value
	call	hexout
	pop	HL		; Restore A and HL registers
	ld	A,(HL)
	push	HL		; Save HL on stack
	ld	B,A		; Save A

	cp	$21
	jp	Z,ld_iy_nn
	cp	$22
	jp	Z,ld_nnp_iy
	cp	$2A
	jp	Z,ld_iy_nnp
	cp	$36
	jp	Z,ld_iydp_n
	cp	$86
	jp	Z,add_a_iydp
	cp	$8E
	jp	Z,adc_a_iydp
	cp	$96
	jp	Z,sub_iydp
	cp	$9E
	jp	Z,sbc_a_iydp
	cp	$A6
	jp	Z,and_iydp
	cp	$AE
	jp	Z,xor_iydp
	cp	$B6
	jp	Z,or_iydp
	cp	$BE
	jp	Z,cp_iydp
	cp	$E1
	jp	Z,pop_iy
	cp	$E3
	jp	Z,ex_spp_iy
	cp	$E5
	jp	Z,push_iy
	cp	$F9
	jp	Z,ld_sp_iy

;	ld	A,B
	and	%11111000
	cp	%01110000
	jp	Z,ld_iydp_r

	ld	A,B
	and	%11000111
	cp	%01000110
	jp	Z,ld_r_iydp

	pop	HL
	ret

handle_ed:
	pop	HL		; Remove Address of $FD from stack
	ld	A,' '
	call	char_out	; Print a space
	inc	HL		; Go to next address and save it on stack
	push	HL
	ld	A,(HL)		; Print hex value
	call	hexout
	pop	HL		; Restore A and HL registers
	ld	A,(HL)
	push	HL		; Save HL on stack
	ld	B,A		; Save A

	cp	$47
	jp	Z,ld_i_a
	cp	$4F
	jp	Z,ld_r_a
	cp	$57
	jp	Z,ld_a_i
	cp	$5F
	jp	Z,ld_a_r
	cp	$A0
	jp	Z,op_ldi
	cp	$A1
	jp	Z,op_cpi
	cp	$A8
	jp	Z,op_ldd
	cp	$A9
	jp	Z,op_cpd
	cp	$B0
	jp	Z,op_ldir
	cp	$B1
	jp	Z,op_cpir
	cp	$B8
	jp	Z,op_lddr
	cp	$B9
	jp	Z,op_cpdr

;	LD	A,B
	and	%11001111
	cp	%01001011
	jp	Z,ld_dd_nnp
	cp	%01000011
	jp	Z,ld_nnp_dd

	pop	HL
	ret

figure_op:
	ld	BC,op_list
	ld	H,0
	ld	L,A
	add	HL,HL
	add	HL,BC
	ld	C,(HL)
	inc	HL
	ld	B,(HL)
	push	BC
	pop	IX
	pop	HL
	push	HL
	jp	(ix)
	ret
; *****************************************************************************

op_list:
	defw	op_nop		; $00
	defw	op_nop		; $01
	defw	op_nop		; $02
	defw	op_nop		; $03
	defw	op_nop		; $04
	defw	op_nop		; $05
	defw	ld_r_n		; $06
	defw	op_nop		; $07
	defw	op_nop		; $08
	defw	op_nop		; $09
	defw	op_nop		; $0A
	defw	op_nop		; $0B
	defw	op_nop		; $0C
	defw	op_nop		; $0D
	defw	ld_r_n		; $0E
	defw	op_nop		; $0F
	defw	op_nop		; $10
	defw	op_nop		; $11
	defw	op_nop		; $12
	defw	op_nop		; $13
	defw	op_nop		; $14
	defw	op_nop		; $15
	defw	ld_r_n		; $16
	defw	op_nop		; $17
	defw	op_nop		; $18
	defw	op_nop		; $19
	defw	op_nop		; $1A
	defw	op_nop		; $1B
	defw	op_nop		; $1C
	defw	op_nop		; $1D
	defw	ld_r_n		; $1E
	defw	op_nop		; $1F
	defw	op_nop		; $20
	defw	op_nop		; $21
	defw	op_nop		; $22
	defw	op_nop		; $23
	defw	op_nop		; $24
	defw	op_nop		; $25
	defw	ld_r_n		; $26
	defw	op_nop		; $27
	defw	op_nop		; $28
	defw	op_nop		; $29
	defw	op_nop		; $2A
	defw	op_nop		; $2B
	defw	op_nop		; $2C
	defw	op_nop		; $2D
	defw	ld_r_n		; $2E
	defw	op_nop		; $2F
	defw	op_nop		; $30
	defw	op_nop		; $31
	defw	op_nop		; $32
	defw	op_nop		; $33
	defw	op_nop		; $34
	defw	op_nop		; $35
	defw	op_nop		; $36
	defw	op_nop		; $37
	defw	op_nop		; $38
	defw	op_nop		; $39
	defw	op_nop		; $3A
	defw	op_nop		; $3B
	defw	op_nop		; $3C
	defw	op_nop		; $3D
	defw	ld_r_n		; $3E
	defw	op_nop		; $3F
	defw	ld_r_r		; $40
	defw	ld_r_r		; $41
	defw	ld_r_r		; $42
	defw	ld_r_r		; $43
	defw	ld_r_r		; $44
	defw	ld_r_r		; $45
	defw	ld_r_hlp	; $46
	defw	ld_r_r		; $47
	defw	ld_r_r		; $48
	defw	ld_r_r		; $49
	defw	ld_r_r		; $4A
	defw	ld_r_r		; $4B
	defw	ld_r_r		; $4C
	defw	ld_r_r		; $4D
	defw	ld_r_hlp	; $4E
	defw	ld_r_r		; $4F
	defw	ld_r_r		; $50
	defw	ld_r_r		; $51
	defw	ld_r_r		; $52
	defw	ld_r_r		; $53
	defw	ld_r_r		; $54
	defw	ld_r_r		; $55
	defw	ld_r_hlp	; $56
	defw	ld_r_r		; $57
	defw	ld_r_r		; $58
	defw	ld_r_r		; $59
	defw	ld_r_r		; $5A
	defw	ld_r_r		; $5B
	defw	ld_r_r		; $5C
	defw	ld_r_r		; $5D
	defw	ld_r_hlp	; $5E
	defw	ld_r_r		; $5F
	defw	ld_r_r		; $60
	defw	ld_r_r		; $61
	defw	ld_r_r		; $62
	defw	ld_r_r		; $63
	defw	ld_r_r		; $64
	defw	ld_r_r		; $65
	defw	ld_r_hlp	; $66
	defw	ld_r_r		; $67
	defw	ld_r_r		; $68
	defw	ld_r_r		; $69
	defw	ld_r_r		; $6A
	defw	ld_r_r		; $6B
	defw	ld_r_r		; $6C
	defw	ld_r_r		; $6D
	defw	ld_r_hlp	; $6E
	defw	ld_r_r		; $6F
	defw	ld_r_r		; $70
	defw	ld_r_r		; $71
	defw	ld_r_r		; $72
	defw	ld_r_r		; $73
	defw	ld_r_r		; $74
	defw	ld_r_r		; $75
	defw	ld_r_r		; $76
	defw	ld_r_r		; $77
	defw	ld_r_r		; $78
	defw	ld_r_r		; $79
	defw	ld_r_r		; $7A
	defw	ld_r_r		; $7B
	defw	ld_r_r		; $7C
	defw	ld_r_r		; $7D
	defw	ld_r_hlp	; $7E
	defw	ld_r_r		; $7F
	defw	op_nop		; $80
	defw	op_nop		; $81
	defw	op_nop		; $82
	defw	op_nop		; $83
	defw	op_nop		; $84
	defw	op_nop		; $85
	defw	op_nop		; $86
	defw	op_nop		; $87
	defw	op_nop		; $88
	defw	op_nop		; $89
	defw	op_nop		; $8A
	defw	op_nop		; $8B
	defw	op_nop		; $8C
	defw	op_nop		; $8D
	defw	op_nop		; $8E
	defw	op_nop		; $8F
	defw	op_nop		; $90
	defw	op_nop		; $91
	defw	op_nop		; $92
	defw	op_nop		; $93
	defw	op_nop		; $94
	defw	op_nop		; $95
	defw	op_nop		; $96
	defw	op_nop		; $97
	defw	op_nop		; $98
	defw	op_nop		; $99
	defw	op_nop		; $9A
	defw	op_nop		; $9B
	defw	op_nop		; $9C
	defw	op_nop		; $9D
	defw	op_nop		; $9E
	defw	op_nop		; $9F
	defw	op_nop		; $A0
	defw	op_nop		; $A1
	defw	op_nop		; $A2
	defw	op_nop		; $A3
	defw	op_nop		; $A4
	defw	op_nop		; $A5
	defw	op_nop		; $A6
	defw	op_nop		; $A7
	defw	op_nop		; $A8
	defw	op_nop		; $A9
	defw	op_nop		; $AA
	defw	op_nop		; $AB
	defw	op_nop		; $AC
	defw	op_nop		; $AD
	defw	op_nop		; $AE
	defw	op_nop		; $AF
	defw	op_nop		; $B0
	defw	op_nop		; $B1
	defw	op_nop		; $B2
	defw	op_nop		; $B3
	defw	op_nop		; $B4
	defw	op_nop		; $B5
	defw	op_nop		; $B6
	defw	op_nop		; $B7
	defw	op_nop		; $B8
	defw	op_nop		; $B9
	defw	op_nop		; $BA
	defw	op_nop		; $BB
	defw	op_nop		; $BC
	defw	op_nop		; $BD
	defw	op_nop		; $BE
	defw	op_nop		; $BF
	defw	op_nop		; $C0
	defw	op_nop		; $C1
	defw	op_nop		; $C2
	defw	op_nop		; $C3
	defw	op_nop		; $C4
	defw	op_nop		; $C5
	defw	op_nop		; $C6
	defw	op_nop		; $C7
	defw	op_nop		; $C8
	defw	op_nop		; $C9
	defw	op_nop		; $CA
	defw	op_nop		; $CB
	defw	op_nop		; $CC
	defw	op_nop		; $CD
	defw	op_nop		; $CE
	defw	op_nop		; $CF
	defw	op_nop		; $D0
	defw	op_nop		; $D1
	defw	op_nop		; $D2
	defw	op_nop		; $D3
	defw	op_nop		; $D4
	defw	op_nop		; $D5
	defw	op_nop		; $D6
	defw	op_nop		; $D7
	defw	op_nop		; $D8
	defw	op_nop		; $D9
	defw	op_nop		; $DA
	defw	op_nop		; $DB
	defw	op_nop		; $DC
	defw	handle_dd	; $DD
	defw	op_nop		; $DE
	defw	op_nop		; $DF
	defw	op_nop		; $E0
	defw	op_nop		; $E1
	defw	op_nop		; $E2
	defw	op_nop		; $E3
	defw	op_nop		; $E4
	defw	op_nop		; $E5
	defw	op_nop		; $E6
	defw	op_nop		; $E7
	defw	op_nop		; $E8
	defw	op_nop		; $E9
	defw	op_nop		; $EA
	defw	op_nop		; $EB
	defw	op_nop		; $EC
	defw	handle_ed	; $ED
	defw	op_nop		; $EE
	defw	op_nop		; $EF
	defw	op_nop		; $F0
	defw	op_nop		; $F1
	defw	op_nop		; $F2
	defw	op_nop		; $F3
	defw	op_nop		; $F4
	defw	op_nop		; $F5
	defw	op_nop		; $F6
	defw	op_nop		; $F7
	defw	op_nop		; $F8
	defw	op_nop		; $F9
	defw	op_nop		; $FA
	defw	op_nop		; $FB
	defw	op_nop		; $FC
	defw	handle_fd	; $FD
	defw	op_nop		; $FE
	defw	op_nop		; $FF

op_nop:
	PRINT_STR op3
	PRINT_STR wrd_nop
	pop	HL
	ret

inc_r:
	PRINT_STR op3
	PRINT_STR wrd_inc
	pop	HL
	ld	A,(HL)
	srl	A
	srl	A
	srl	A
	call	reg8_to_char
	call	char_out
	ret

cp_iydp:
	ld	BC,wrd_cp
	jp	arl_iydp
cp_ixdp:
	ld	BC,wrd_cp
	jp	arl_ixdp
cp_hlp:
	ld	BC,wrd_cp
	jp	arl_hlp
cp_n:
	ld	BC,wrd_cp
	jp	arl_n
cp_r:
	ld	BC,wrd_cp
	jp	arl_r
xor_iydp:
	ld	BC,wrd_xor
	jp	arl_iydp
xor_ixdp:
	ld	BC,wrd_xor
	jp	arl_ixdp
xor_hlp:
	ld	BC,wrd_xor
	jp	arl_hlp
xor_n:
	ld	BC,wrd_xor
	jp	arl_n
xor_r:
	ld	BC,wrd_xor
	jp	arl_r
or_iydp:
	ld	BC,wrd_or
	jp	arl_iydp
or_ixdp:
	ld	BC,wrd_or
	jp	arl_ixdp
or_hlp:
	ld	BC,wrd_or
	jp	arl_hlp
or_n:
	ld	BC,wrd_or
	jp	arl_n
or_r:
	ld	BC,wrd_or
	jp	arl_r
and_iydp:
	ld	BC,wrd_and
	jp	arl_iydp
and_ixdp:
	ld	BC,wrd_and
	jp	arl_ixdp
and_hlp:
	ld	BC,wrd_and
	jp	arl_hlp
and_n:
	ld	BC,wrd_and
	jp	arl_n
and_r:
	ld	BC,wrd_and
	jp	arl_r
sbc_a_iydp:
	ld	BC,wrd_sbc
	jp	ad_a_iydp
sbc_a_ixdp:
	ld	BC,wrd_sbc
	jp	ad_a_ixdp
sbc_a_hlp:
	ld	BC,wrd_sbc
	jp	ad_a_hlp
sbc_a_n:
	ld	BC,wrd_sbc
	jp	ad_a_n
sbc_a_r:
	ld	BC,wrd_sbc
	jp	ad_a_r
sub_iydp:
	ld	BC,wrd_sub
	jp	arl_iydp
sub_ixdp:
	ld	BC,wrd_sub
	jp	arl_ixdp
sub_hlp:
	ld	BC,wrd_sub
	jp	arl_hlp
sub_n:
	ld	BC,wrd_sub
	jp	arl_n
sub_r:
	ld	BC,wrd_sub
	jp	arl_r

arl_iydp:
	ld	A,' '
	call	char_out
	pop	HL
	inc	HL
	push	HL
	push	BC
	ld	A,(HL)
	call	hexout
	PRINT_STR op1
	pop	HL
	call	write_str
	PRINT_STR reg_iyp
	pop	HL
	push	HL
	ld	A,(HL)
	call	hexout
	ld	A,')'
	call	char_out
	pop	HL
	ret

arl_ixdp:
	ld	A,' '
	call	char_out
	pop	HL
	inc	HL
	push	HL
	push	BC
	ld	A,(HL)
	call	hexout
	PRINT_STR op1
	pop	HL
	call	write_str
	PRINT_STR reg_ixp
	pop	HL
	push	HL
	ld	A,(HL)
	call	hexout
	ld	A,')'
	call	char_out
	pop	HL
	ret

arl_hlp:
	PRINT_STR op3
	ld	HL,BC
	call	write_str
	PRINT_STR reg_hlp
	pop	HL
	ret

arl_n:
	ld	A,' '
	call	char_out
	pop	HL
	inc	HL
	push	HL
	push	BC
	ld	A,(HL)
	call	hexout
	PRINT_STR op2
	pop	HL
	call	write_str
	pop	HL
	push	HL
	ld	A,(HL)
	call	hexout
	pop	HL
	ret

arl_r:
	PRINT_STR op3
	ld	HL,BC
	call	write_str
	pop	HL
	push	HL
	ld	A,(HL)
	and	%00000111
	call	reg8_to_char
	call	char_out
	pop	HL
	ret

adc_a_iydp:
	ld	BC,wrd_adc
	jp	ad_a_iydp
adc_a_ixdp:
	ld	BC,wrd_adc
	jp	ad_a_ixdp
adc_a_hlp:
	ld	BC,wrd_adc
	jp	ad_a_hlp
adc_a_n:
	ld	BC,wrd_adc
	jp	ad_a_n
adc_a_r:
	ld	BC,wrd_adc
	jp	ad_a_r
add_a_iydp:
	ld	BC,wrd_add
	jp	ad_a_iydp
add_a_ixdp:
	ld	BC,wrd_add
	jp	ad_a_ixdp
add_a_hlp:
	ld	BC,wrd_add
	jp	ad_a_hlp
add_a_n:
	ld	BC,wrd_add
	jp	ad_a_n
add_a_r:
	ld	BC,wrd_add
	jp	ad_a_r

ad_a_iydp:
	ld	A,' '
	call	char_out
	pop	HL
	inc	HL
	push	HL
	push	BC
	ld	A,(HL)
	call	hexout
	PRINT_STR op1
	pop	HL
	call	write_str
	ld	A,'A'
	call	char_out
	call	commaspc
	PRINT_STR reg_iyp
	pop	HL
	push	HL
	ld	A,(HL)
	call	hexout
	ld	A,')'
	call	char_out
	pop	HL
	ret

ad_a_ixdp:
	ld	A,' '
	call	char_out
	pop	HL
	inc	HL
	push	HL
	push	BC
	ld	A,(HL)
	call	hexout
	PRINT_STR op1
	pop	HL
	call	write_str
	ld	A,'A'
	call	char_out
	call	commaspc
	PRINT_STR reg_ixp
	pop	HL
	push	HL
	ld	A,(HL)
	call	hexout
	ld	A,')'
	call	char_out
	pop	HL
	ret

ad_a_hlp:
	PRINT_STR op3
	ld	HL,BC
	call	write_str
	ld	A,'A'
	call	char_out
	call	commaspc
	PRINT_STR reg_hlp
	pop	HL
	ret

ad_a_n:
	ld	A,' '
	call	char_out
	pop	HL
	inc	HL
	push	HL
	push	BC
	ld	A,(HL)
	call	hexout
	PRINT_STR op2
	pop	HL
	call	write_str
	ld	A,'A'
	call	char_out
	call	commaspc
	pop	HL
	push	HL
	ld	A,(HL)
	call	hexout
	pop	HL
	ret

ad_a_r:
	PRINT_STR op3
	ld	HL,BC
	call	write_str
	ld	A,'A'
	call	char_out
	call	commaspc
	pop	HL
	push	HL
	ld	A,(HL)
	and	%00000111
	call	reg8_to_char
	call	char_out
	pop	HL
	ret

op_cpdr:
	PRINT_STR op2
	PRINT_STR wrd_cpdr
	pop	HL
	ret

op_cpd:
	PRINT_STR op2
	PRINT_STR wrd_cpd
	pop	HL
	ret

op_cpir:
	PRINT_STR op2
	PRINT_STR wrd_cpir
	pop	HL
	ret

op_cpi:
	PRINT_STR op2
	PRINT_STR wrd_cpi
	pop	HL
	ret

op_lddr:
	PRINT_STR op2
	PRINT_STR wrd_lddr
	pop	HL
	ret

op_ldd:
	PRINT_STR op2
	PRINT_STR wrd_ldd
	pop	HL
	ret

op_ldir:
	PRINT_STR op2
	PRINT_STR wrd_ldir
	pop	HL
	ret

op_ldi:
	PRINT_STR op2
	PRINT_STR wrd_ldi
	pop	HL
	ret

ex_spp_iy:
	PRINT_STR op2
	PRINT_STR wrd_ex
	ld	A,'('
	call	char_out
	PRINT_STR reg_sp
	ld	A,')'
	call	char_out
	call	commaspc
	PRINT_STR reg_iy
	pop	HL
	ret

ex_spp_ix:
	PRINT_STR op2
	PRINT_STR wrd_ex
	ld	A,'('
	call	char_out
	PRINT_STR reg_sp
	ld	A,')'
	call	char_out
	call	commaspc
	PRINT_STR reg_ix
	pop	HL
	ret

ex_spp_hl:
	PRINT_STR op3
	PRINT_STR wrd_ex
	ld	A,'('
	call	char_out
	PRINT_STR reg_sp
	ld	A,')'
	call	char_out
	call	commaspc
	PRINT_STR reg_hl
	pop	HL
	ret

op_exx:
	PRINT_STR op3
	PRINT_STR wrd_exx
	pop	HL
	ret

ex_af_af:
	PRINT_STR op3
	PRINT_STR wrd_ex
	PRINT_STR reg_af
	call	commaspc
	PRINT_STR reg_afo
	pop	HL
	ret

ex_de_hl:
	PRINT_STR op3
	PRINT_STR wrd_ex
	PRINT_STR reg_de
	call	commaspc
	PRINT_STR reg_hl
	pop	HL
	ret

pop_iy:
	PRINT_STR op2
	PRINT_STR wrd_pop
	PRINT_STR reg_iy
	pop	HL
	ret

pop_ix:
	PRINT_STR op2
	PRINT_STR wrd_pop
	PRINT_STR reg_ix
	pop	HL
	ret

pop_qq:
	PRINT_STR op3
	PRINT_STR wrd_pop
	pop	HL
	push	HL
	ld	A,(HL)
	and	%00110000
	cp	%00000000
	jr	Z,.do_bc
	cp	%00010000
	jr	Z,.do_de
	cp	%00100000
	jr	Z,.do_hl
	PRINT_STR reg_af
	jr	.end
.do_bc:
	PRINT_STR reg_bc
	jr	.end
.do_de:
	PRINT_STR reg_de
	jr	.end
.do_hl:
	PRINT_STR reg_hl
.end:	pop	HL
	ret

push_iy:
	PRINT_STR op2
	PRINT_STR wrd_push
	PRINT_STR reg_iy
	pop	HL
	ret

push_ix:
	PRINT_STR op2
	PRINT_STR wrd_push
	PRINT_STR reg_ix
	pop	HL
	ret

push_qq:
	PRINT_STR op3
	PRINT_STR wrd_push
	pop	HL
	push	HL
	ld	A,(HL)
	and	%00110000
	cp	%00000000
	jr	Z,.do_bc
	cp	%00010000
	jr	Z,.do_de
	cp	%00100000
	jr	Z,.do_hl
	PRINT_STR reg_af
	jr	.end
.do_bc:
	PRINT_STR reg_bc
	jr	.end
.do_de:
	PRINT_STR reg_de
	jr	.end
.do_hl:
	PRINT_STR reg_hl
.end:	pop	HL
	ret

ld_sp_iy:
	PRINT_STR op2
	PRINT_STR wrd_ld
	PRINT_STR reg_sp
	call	commaspc
	PRINT_STR reg_iy
	pop	HL
	ret

ld_sp_ix:
	PRINT_STR op2
	PRINT_STR wrd_ld
	PRINT_STR reg_sp
	call	commaspc
	PRINT_STR reg_ix
	pop	HL
	ret

ld_sp_hl:
	PRINT_STR op3
	PRINT_STR wrd_ld
	PRINT_STR reg_sp
	call	commaspc
	PRINT_STR reg_hl
	pop	HL
	ret

ld_nnp_iy:
	ld	A,' '
	call	char_out
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	pop	HL
	push	HL
	inc	HL
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	call	char_out
	PRINT_STR wrd_ld
	ld	A,'('
	call	char_out
	pop	HL
	push	HL
	inc	HL
	inc	HL
	ld	A,(HL)
	call	hexout
	pop	HL
	push	HL
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,')'
	call	char_out
	call	commaspc
	PRINT_STR reg_iy
	pop	HL
	inc	HL
	inc	HL
	ret

ld_nnp_ix:
	ld	A,' '
	call	char_out
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	pop	HL
	push	HL
	inc	HL
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	call	char_out
	PRINT_STR wrd_ld
	ld	A,'('
	call	char_out
	pop	HL
	push	HL
	inc	HL
	inc	HL
	ld	A,(HL)
	call	hexout
	pop	HL
	push	HL
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,')'
	call	char_out
	call	commaspc
	PRINT_STR reg_ix
	pop	HL
	inc	HL
	inc	HL
	ret

ld_nnp_dd:
	ld	A,' '
	call	char_out
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	pop	HL
	push	HL
	inc	HL
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	call	char_out
	PRINT_STR wrd_ld
	ld	A,'('
	call	char_out
	pop	HL
	push	HL
	inc	HL
	inc	HL
	ld	A,(HL)
	call	hexout
	pop	HL
	push	HL
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,')'
	call	char_out
	call	commaspc
	pop	HL
	push	HL
	ld	A,(HL)
	and	%00110000
	srl	A
	srl	A
	srl	A
	srl	A
	ld	B,A
	sla	A
	add	A,B
	ld	BC,reg_16_list
	ld	H,0
	ld	L,A
	add	HL,BC
	call	write_str
	pop	HL
	inc	HL
	inc	HL
	ret

ld_nnp_hl:
	ld	A,' '
	call	char_out
	pop	HL
	inc	HL
	push	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	pop	HL
	inc	HL
	push	HL
	ld	A,(HL)
	call	hexout
	PRINT_STR op1
	PRINT_STR wrd_ld
	ld	A,'('
	call	char_out
	pop	HL
	push	HL
	ld	A,(HL)
	call	hexout
	pop	HL
	push	HL
	dec	HL
	ld	A,(HL)
	call	hexout
	ld	A,')'
	call	char_out
	call	commaspc
	PRINT_STR reg_hl
	pop	HL
	ret

ld_iy_nnp:
	ld	A,' '
	call	char_out
	pop	HL
	inc	HL
	push	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	pop	HL
	push	HL
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	call	char_out
	PRINT_STR wrd_ld
	PRINT_STR reg_iy
	call	commapar
	pop	HL
	inc	HL
	push	HL
	ld	A,(HL)
	call	hexout
	pop	HL
	push	HL
	dec	HL
	ld	A,(HL)
	call	hexout
	ld	A,')'
	call	char_out
	pop	HL
	ret

ld_ix_nnp:
	ld	A,' '
	call	char_out
	pop	HL
	inc	HL
	push	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	pop	HL
	push	HL
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	call	char_out
	PRINT_STR wrd_ld
	PRINT_STR reg_ix
	call	commapar
	pop	HL
	inc	HL
	push	HL
	ld	A,(HL)
	call	hexout
	pop	HL
	push	HL
	dec	HL
	ld	A,(HL)
	call	hexout
	ld	A,')'
	call	char_out
	pop	HL
	ret

ld_dd_nnp:
	ld	A,' '
	call	char_out
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	pop	HL
	push	HL
	inc	HL
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	call	char_out
	PRINT_STR wrd_ld
	pop	HL
	ld	A,(HL)
	and	%00110000
	inc	HL
	push	HL
	srl	A
	srl	A
	srl	A
	srl	A
	ld	B,A
	sla	A
	add	A,B
	ld	BC,reg_16_list
	ld	H,0
	ld	L,A
	add	HL,BC
	call	write_str
	call	commapar
	pop	HL
	push	HL
	inc	HL
	ld	A,(HL)
	call	hexout
	pop	HL
	push	HL
	ld	A,(HL)
	call	hexout
	ld	A,')'
	call	char_out
	pop	HL
	inc	HL
	ret


ld_hl_nnp:
	ld	A,' '
	call	char_out
	pop	HL
	inc	HL
	push	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	pop	HL
	push	HL
	inc	HL
	ld	A,(HL)
	call	hexout
	PRINT_STR op1
	PRINT_STR wrd_ld
	PRINT_STR reg_hl
	call	commapar
	pop	HL
	inc	HL
	push	HL
	ld	A,(HL)
	call	hexout
	pop	HL
	push	HL
	dec	HL
	ld	A,(HL)
	call	hexout
	ld	A,')'
	call	char_out
	pop	HL
	ret

ld_iy_nn:
	ld	A,' '
	call	char_out
	pop	HL
	inc	HL
	push	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	pop	HL
	push	HL
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	call	char_out
	PRINT_STR wrd_ld
	PRINT_STR reg_iy
	call	commaspc
	pop	HL
	inc	HL
	push	HL
	ld	A,(HL)
	call	hexout
	pop	HL
	push	HL
	dec	HL
	ld	A,(HL)
	call	hexout
	pop	HL
	ret

ld_ix_nn:
	ld	A,' '
	call	char_out
	pop	HL
	inc	HL
	push	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	pop	HL
	push	HL
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	call	char_out
	PRINT_STR wrd_ld
	PRINT_STR reg_ix
	call	commaspc
	pop	HL
	inc	HL
	push	HL
	ld	A,(HL)
	call	hexout
	pop	HL
	push	HL
	dec	HL
	ld	A,(HL)
	call	hexout
	pop	HL
	ret

ld_dd_nn:
	ld	A,' '
	call	char_out
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	pop	HL
	push	HL
	inc	HL
	inc	HL
	ld	A,(HL)
	call	hexout
	PRINT_STR op1
	PRINT_STR wrd_ld
	pop	HL
	ld	A,(HL)
	inc	HL
	push	HL
	srl	A
	srl	A
	srl	A
	srl	A
	ld	B,A
	sla	A
	add	A,B
	ld	BC,reg_16_list
	ld	H,0
	ld	L,A
	add	HL,BC
	call	write_str
	call	commaspc
	pop	HL
	push	HL
	inc	HL
	ld	A,(HL)
	call	hexout
	pop	HL
	push	HL
	ld	A,(HL)
	call	hexout
	pop	HL
	inc	HL
	ret

ld_r_a:
	PRINT_STR op2
	PRINT_STR wrd_ld
	ld	A,'R'
	call	char_out
	call	commaspc
	ld	A,'A'
	call	char_out
	pop	HL
	ret

ld_i_a:
	PRINT_STR op2
	PRINT_STR wrd_ld
	ld	A,'I'
	call	char_out
	call	commaspc
	ld	A,'A'
	call	char_out
	pop	HL
	ret

ld_a_r:
	PRINT_STR op2
	PRINT_STR wrd_ld
	ld	A,'A'
	call	char_out
	call	commaspc
	ld	A,'R'
	call	char_out
	pop	HL
	ret

ld_a_i:
	PRINT_STR op2
	PRINT_STR wrd_ld
	ld	A,'A'
	call	char_out
	call	commaspc
	ld	A,'I'
	call	char_out
	pop	HL
	ret


ld_nnp_a:
	ld	A,' '
	call	char_out
	pop	HL
	inc	HL
	push	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	pop	HL
	inc	HL
	push	HL
	ld	A,(HL)
	call	hexout
	PRINT_STR op1
	PRINT_STR wrd_ld
	ld	A,'('
	call	char_out
	pop	HL
	push	HL
	ld	A,(HL)
	call	hexout
	pop	HL
	push	HL
	dec	HL
	ld	A,(HL)
	call	hexout
	ld	A,')'
	call	char_out
	call	commaspc
	ld	A,'A'
	call	char_out
	pop	HL
	ret

ld_dep_a:
	PRINT_STR op3
	PRINT_STR wrd_ld
	PRINT_STR reg_dep
	call	commaspc
	ld	A,'A'
	call	char_out
	pop	HL
	ret

ld_bcp_a:
	PRINT_STR op3
	PRINT_STR wrd_ld
	PRINT_STR reg_bcp
	call	commaspc
	ld	A,'A'
	call	char_out
	pop	HL
	ret

ld_a_nnp:
	ld	A,' '
	call	char_out
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	pop	HL
	inc	HL
	inc	HL
	push	HL
	ld	A,(HL)
	call	hexout
	PRINT_STR op1
	PRINT_STR wrd_ld
	ld	A,'A'
	call	char_out
	call	commapar
	pop	HL
	push	HL
	dec	HL
	ld	A,(HL)
	call	hexout
	pop	HL
	push	HL
	ld	A,(HL)
	call	hexout
	ld	A,')'
	call	char_out
	pop	HL
	ret

ld_a_dep:
	PRINT_STR op3
	PRINT_STR wrd_ld
	ld	A,'A'
	call	char_out
	call	commaspc
	PRINT_STR reg_dep
	pop	HL
	ret

ld_a_bcp:
	PRINT_STR op3
	PRINT_STR wrd_ld
	ld	A,'A'
	call	char_out
	call	commaspc
	PRINT_STR reg_bcp
	pop	HL
	ret

ld_iydp_n:
	ld	A,' '
	call	char_out
	pop	HL
	inc	HL
	push	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	pop	HL
	push	HL
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	call	char_out
	PRINT_STR wrd_ld
	PRINT_STR reg_iyp
	pop	HL
	push	HL
	ld	A,(HL)
	call	hexout
	ld	A,')'
	call	char_out
	call	commaspc
	pop	HL
	inc	HL
	ld	A,(HL)
	push	HL
	call	hexout
	pop	HL
	ret

ld_ixdp_n:
	ld	A,' '
	call	char_out
	pop	HL
	inc	HL
	push	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	pop	HL
	push	HL
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	call	char_out
	PRINT_STR wrd_ld
	PRINT_STR reg_ixp
	pop	HL
	push	HL
	ld	A,(HL)
	call	hexout
	ld	A,')'
	call	char_out
	call	commaspc
	pop	HL
	inc	HL
	ld	A,(HL)
	push	HL
	call	hexout
	pop	HL
	ret

ld_hlp_n:
	ld	A,' '
	call	char_out
	inc	HL
	ld	A,(HL)
	call	hexout
	PRINT_STR op2
	PRINT_STR wrd_ld
	PRINT_STR reg_hlp
	call	commaspc
	pop	HL
	inc	HL
	push	HL
	ld	A,(HL)
	call	hexout
	pop	HL
	ret

ld_iydp_r:
	ld	A,' '
	call	char_out
	inc	HL
	ld	A,(HL)
	call	hexout
	PRINT_STR op1
	PRINT_STR wrd_ld
	PRINT_STR reg_iyp
	pop	HL
	push	HL
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,')'
	call	char_out
	call	commaspc
	pop	HL
	ld	A,(HL)
	inc	HL
	and	%00000111
	call	reg8_to_char
	call	char_out
	ret

ld_ixdp_r:
	ld	A,' '
	call	char_out
	inc	HL
	ld	A,(HL)
	call	hexout
	PRINT_STR op1
	PRINT_STR wrd_ld
	PRINT_STR reg_ixp
	pop	HL
	push	HL
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,')'
	call	char_out
	call	commaspc
	pop	HL
	ld	A,(HL)
	inc	HL
	and	%00000111
	call	reg8_to_char
	call	char_out
	ret

ld_hlp_r:
	PRINT_STR op3
	PRINT_STR wrd_ld
	PRINT_STR reg_hlp
	call	commaspc
	pop	HL
	ld	A,(HL)
	and	%00000111
	call	reg8_to_char
	call	char_out
	ret

ld_r_iydp:
	ld	A,' '
	call	char_out
	inc	HL
	ld	A,(HL)
	call	hexout
	PRINT_STR op1
	PRINT_STR wrd_ld
	pop	HL
	ld	A,(HL)
	and	%00111111
	srl	A
	srl	A
	srl	A
	call	reg8_to_char
	call	char_out
	call	commaspc
	push	HL
	PRINT_STR reg_iyp
	pop	HL
	inc	HL
	push	HL
	ld	A,(HL)
	call	hexout
	ld	A,')'
	call	char_out
	pop	HL
	ret

ld_r_ixdp:
	ld	A,' '
	call	char_out
	inc	HL
	ld	A,(HL)
	call	hexout
	PRINT_STR op1
	PRINT_STR wrd_ld
	pop	HL
	ld	A,(HL)
	and	%00111111
	srl	A
	srl	A
	srl	A
	call	reg8_to_char
	call	char_out
	call	commaspc
	push	HL
	PRINT_STR reg_ixp
	pop	HL
	inc	HL
	push	HL
	ld	A,(HL)
	call	hexout
	ld	A,')'
	call	char_out
	pop	HL
	ret

ld_r_hlp:
	PRINT_STR op3
	PRINT_STR wrd_ld
	pop	HL
	ld	A,(HL)
	and	%00111111
	srl	A
	srl	A
	srl	A
	call	reg8_to_char
	call	char_out
	call	commaspc
	push	HL
	PRINT_STR reg_hlp
	pop	HL
	ret

ld_r_n:
	ld	A,' '
	call	char_out
	inc	HL
	ld	A,(HL)
	call	hexout			; Print immediate value
	PRINT_STR op2
	PRINT_STR wrd_ld
	pop	HL
	ld	A,(HL)
	and	%00111111
	srl	A
	srl	A
	srl	A
	call	reg8_to_char
	call	char_out
	call	commaspc
	inc	HL
	push	HL
	ld	A,(HL)
	call	hexout
	pop	HL
	ret

ld_r_r:
	PRINT_STR op3
	PRINT_STR wrd_ld
	pop	HL
	ld	A,(HL)
	and	%00111111
	srl	A
	srl	A
	srl	A
	call	reg8_to_char
	call	char_out
	call	commaspc
	ld	A,(HL)
	and	%00000111
	call	reg8_to_char
	call	char_out
	ret

reg8_to_char:
	ld	BC,reg_8_list
	ld	IXH,0
	ld	IXL,A
	add	IX,BC
	ld	A,(IX)
	ret

; *****************************************************************************
; Print comma space parenthesis start [, (]
; *****************************************************************************
commapar:
	call	commaspc
	ld	A,'('
	call	char_out
	ret

; *****************************************************************************
; Print Comma space [, ]
; *****************************************************************************
commaspc:
	ld	A,','
	call	char_out
	ld	A,' '
	call	char_out
	ret

; *****************************************************************************
; Add B to HL if B<$80 else subtract B form HL
; Used to calculate absolute address from relative offset
; *****************************************************************************
; Input:	HL = Current address
;		B  = Offset
; Uses:		BC
; Output:	HL = Calculated 16bit address
; *****************************************************************************
add_or_sub:
	ld	C,B	; B contains offset value because hexout has saved it there
	ld	B,0
	inc	HL
	bit	7,C
	jr	Z,.do_add
	ld	A,C
	neg
	ld	C,A
	and	A		; Reset carry Flag
	sbc	HL,BC
	ret
.do_add:
	add	HL,BC
	ret

wrd_adc		defb	"ADC  ",0
wrd_add		defb	"ADD  ",0
wrd_and		defb	"AND  ",0
wrd_bit		defb	"BIT  ",0
wrd_call	defb	"CALL ",0
wrd_ccf		defb	"CCF",  0
wrd_cp		defb	"CP   ",0
wrd_cpd		defb	"CPD",  0
wrd_cpdr	defb	"CPDR", 0
wrd_cpi		defb	"CPI",  0
wrd_cpir	defb	"CPIR", 0
wrd_cpl		defb	"CPL",  0
wrd_daa		defb	"DAA",  0
wrd_dec		defb	"DEC  ",0
wrd_di		defb	"DI",   0
wrd_djnz	defb	"DJNZ ",0
wrd_ei		defb	"EI",   0
wrd_ex		defb	"EX   ",0
wrd_exx		defb	"EXX",  0
wrd_halt	defb	"HALT", 0
wrd_im		defb	"IM   ",0
wrd_in		defb	"IN   ",0
wrd_inc		defb	"INC  ",0
wrd_ind		defb	"IND"  ,0
wrd_indr	defb	"INDR" ,0
wrd_ini		defb	"INI"  ,0
wrd_inir	defb	"INIR" ,0
wrd_jp		defb	"JP   ",0
wrd_jr		defb	"JR   ",0
wrd_ld		defb	"LD   ",0
wrd_ldd		defb	"LDD"  ,0
wrd_lddr	defb	"LDDR" ,0
wrd_ldi		defb	"LDI"  ,0
wrd_ldir	defb	"LDIR" ,0
wrd_neg		defb	"NEG"  ,0
wrd_nop		defb	"NOP"  ,0
wrd_or		defb	"OR   ",0
wrd_otdr	defb	"OTDR" ,0
wrd_otir	defb	"OTIR" ,0
wrd_out		defb	"OUT  ",0
wrd_outd	defb	"OUTD" ,0
wrd_outi	defb	"OUTI" ,0
wrd_pop		defb	"POP  ",0
wrd_push	defb	"PUSH ",0
wrd_res		defb	"RES  ",0
wrd_ret		defb	"RET  ",0
wrid_reti	defb	"RETI" ,0
wrd_retn	defb	"RETN" ,0
wrd_rl		defb	"RL   ",0
wrd_rla		defb	"RLA"  ,0
wrd_rlc		defb	"RLC  ",0
wrd_rlca	defb	"RLCA" ,0
wrd_rld		defb	"RLD"  ,0
wrd_rr		defb	"RR   ",0
wrd_rra		defb	"RRA"  ,0
wrd_rrc		defb	"RRC  ",0
wrd_rrca	defb	"RRCA" ,0
wrd_rrd		defb	"RRD"  ,0
wrd_rst		defb	"RST  ",0
wrd_sbc		defb	"SBC  ",0
wrd_scf		defb	"SCF"  ,0
wrd_set		defb	"SET  ",0
wrd_sla		defb	"SLA  ",0
wrd_sll		defb	"SLL  ",0
wrd_sra		defb	"SRA  ",0
wrd_srl		defb	"SRL  ",0
wrd_sub		defb	"SUB  ",0
wrd_xor		defb	"XOR  ",0
wrd_ld_xxp_mid:	defb	"), ",0

reg_ixh		defb	"IXH",0
reg_ixl		defb	"IXL",0
reg_iyh		defb	"IYH",0
reg_iyl		defb	"IYL",0
reg_af		defb	"AF",0
reg_afo		defb	"AF'",0
reg_16_list:
reg_bc		defb	"BC",0
reg_de		defb	"DE",0
reg_hl		defb	"HL",0
reg_sp		defb	"SP",0
reg_ix		defb	"IX",0
reg_iy		defb	"IY",0
reg_bcp		defb	"(BC)",0
reg_dep		defb	"(DE)",0
reg_hlp		defb	"(HL)",0
reg_ixp		defb	"(IX+",0
reg_iyp		defb	"(IY+",0
reg_spp		defb	"(SP)",0

reg_8_list:
reg_b		defb	'B'
reg_c		defb	'C'
reg_d		defb	'D'
reg_e		defb	'E'
reg_h		defb	'H'
reg_l		defb	'L','x'
reg_a		defb	'A'


flg_nc		defb	"NC",0
flg_nz		defb	"NZ",0
flg_pe		defb	"PE",0
flg_po		defb	"PO",0

op3:	defb	"           ",0
op2:	defb	"        ",0
op1:	defb	"     ",0
