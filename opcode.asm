
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
	jp	(IX)
	ret

handle_fd:
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

	ld	BC,fd_list
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
	jp	(IX)
	ret

handle_ed:
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

	ld	BC,ed_list
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
	jp	(IX)
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
	defw	ld_dd_nn	; $01
	defw	ld_bcp_a	; $02
	defw	op_nop		; $03
	defw	inc_r		; $04
	defw	dec_r		; $05
	defw	ld_r_n		; $06
	defw	op_nop		; $07
	defw	ex_af_af	; $08
	defw	op_nop		; $09
	defw	ld_a_bcp	; $0A
	defw	op_nop		; $0B
	defw	inc_r		; $0C
	defw	dec_r		; $0D
	defw	ld_r_n		; $0E
	defw	op_nop		; $0F
	defw	op_nop		; $10
	defw	ld_dd_nn	; $11
	defw	ld_dep_a	; $12
	defw	op_nop		; $13
	defw	inc_r		; $14
	defw	dec_r		; $15
	defw	ld_r_n		; $16
	defw	op_nop		; $17
	defw	op_nop		; $18
	defw	op_nop		; $19
	defw	ld_a_dep	; $1A
	defw	op_nop		; $1B
	defw	inc_r		; $1C
	defw	dec_r		; $1D
	defw	ld_r_n		; $1E
	defw	op_nop		; $1F
	defw	op_nop		; $20
	defw	ld_dd_nn	; $21
	defw	ld_nnp_hl	; $22
	defw	op_nop		; $23
	defw	inc_r		; $24
	defw	dec_r		; $25
	defw	ld_r_n		; $26
	defw	op_daa		; $27
	defw	op_nop		; $28
	defw	op_nop		; $29
	defw	ld_hl_nnp	; $2A
	defw	op_nop		; $2B
	defw	inc_r		; $2C
	defw	dec_r		; $2D
	defw	ld_r_n		; $2E
	defw	op_cpl		; $2F
	defw	op_nop		; $30
	defw	ld_dd_nn	; $31
	defw	ld_nnp_a	; $32
	defw	op_nop		; $33
	defw	inc_hlp		; $34
	defw	dec_hlp		; $35
	defw	ld_hlp_n	; $36
	defw	op_scf		; $37
	defw	op_nop		; $38
	defw	op_nop		; $39
	defw	ld_a_nnp	; $3A
	defw	op_nop		; $3B
	defw	inc_r		; $3C
	defw	dec_r		; $3D
	defw	ld_r_n		; $3E
	defw	op_ccf		; $3F
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
	defw	ld_hlp_r	; $70
	defw	ld_hlp_r	; $71
	defw	ld_hlp_r	; $72
	defw	ld_hlp_r	; $73
	defw	ld_hlp_r	; $74
	defw	ld_hlp_r	; $75
	defw	op_halt		; $76
	defw	ld_hlp_r	; $77
	defw	ld_r_r		; $78
	defw	ld_r_r		; $79
	defw	ld_r_r		; $7A
	defw	ld_r_r		; $7B
	defw	ld_r_r		; $7C
	defw	ld_r_r		; $7D
	defw	ld_r_hlp	; $7E
	defw	ld_r_r		; $7F
	defw	add_a_r		; $80
	defw	add_a_r		; $81
	defw	add_a_r		; $82
	defw	add_a_r		; $83
	defw	add_a_r		; $84
	defw	add_a_r		; $85
	defw	add_a_hlp	; $86
	defw	add_a_r		; $87
	defw	adc_a_r		; $88
	defw	adc_a_r		; $89
	defw	adc_a_r		; $8A
	defw	adc_a_r		; $8B
	defw	adc_a_r		; $8C
	defw	adc_a_r		; $8D
	defw	adc_a_hlp	; $8E
	defw	adc_a_r		; $8F
	defw	sub_r		; $90
	defw	sub_r		; $91
	defw	sub_r		; $92
	defw	sub_r		; $93
	defw	sub_r		; $94
	defw	sub_r		; $95
	defw	sub_hlp		; $96
	defw	sub_r		; $97
	defw	sbc_a_r		; $98
	defw	sbc_a_r		; $99
	defw	sbc_a_r		; $9A
	defw	sbc_a_r		; $9B
	defw	sbc_a_r		; $9C
	defw	sbc_a_r		; $9D
	defw	sbc_a_hlp	; $9E
	defw	sbc_a_r		; $9F
	defw	and_r		; $A0
	defw	and_r		; $A1
	defw	and_r		; $A2
	defw	and_r		; $A3
	defw	and_r		; $A4
	defw	and_r		; $A5
	defw	and_hlp		; $A6
	defw	and_r		; $A7
	defw	xor_r		; $A8
	defw	xor_r		; $A9
	defw	xor_r		; $AA
	defw	xor_r		; $AB
	defw	xor_r		; $AC
	defw	xor_r		; $AD
	defw	xor_hlp		; $AE
	defw	xor_r		; $AF
	defw	or_r		; $B0
	defw	or_r		; $B1
	defw	or_r		; $B2
	defw	or_r		; $B3
	defw	or_r		; $B4
	defw	or_r		; $B5
	defw	or_hlp		; $B6
	defw	or_r		; $B7
	defw	cp_r		; $B8
	defw	cp_r		; $B9
	defw	cp_r		; $BA
	defw	cp_r		; $BB
	defw	cp_r		; $BC
	defw	cp_r		; $BD
	defw	cp_hlp		; $BE
	defw	cp_r		; $BF
	defw	op_nop		; $C0
	defw	pop_qq		; $C1
	defw	op_nop		; $C2
	defw	op_nop		; $C3
	defw	op_nop		; $C4
	defw	push_qq		; $C5
	defw	add_a_n		; $C6
	defw	op_nop		; $C7
	defw	op_nop		; $C8
	defw	op_nop		; $C9
	defw	op_nop		; $CA
	defw	op_nop		; $CB
	defw	op_nop		; $CC
	defw	op_nop		; $CD
	defw	adc_a_n		; $CE
	defw	op_nop		; $CF
	defw	op_nop		; $D0
	defw	pop_qq		; $D1
	defw	op_nop		; $D2
	defw	op_nop		; $D3
	defw	op_nop		; $D4
	defw	push_qq		; $D5
	defw	sub_n		; $D6
	defw	op_nop		; $D7
	defw	op_nop		; $D8
	defw	op_exx		; $D9
	defw	op_nop		; $DA
	defw	op_nop		; $DB
	defw	op_nop		; $DC
	defw	handle_dd	; $DD
	defw	sbc_a_hlp	; $DE
	defw	op_nop		; $DF
	defw	op_nop		; $E0
	defw	pop_qq		; $E1
	defw	op_nop		; $E2
	defw	ex_spp_hl	; $E3
	defw	op_nop		; $E4
	defw	push_qq		; $E5
	defw	and_n		; $E6
	defw	op_nop		; $E7
	defw	op_nop		; $E8
	defw	op_nop		; $E9
	defw	op_nop		; $EA
	defw	ex_de_hl	; $EB
	defw	op_nop		; $EC
	defw	handle_ed	; $ED
	defw	xor_n		; $EE
	defw	op_nop		; $EF
	defw	op_nop		; $F0
	defw	pop_qq		; $F1
	defw	op_nop		; $F2
	defw	op_di		; $F3
	defw	op_nop		; $F4
	defw	push_qq		; $F5
	defw	or_n		; $F6
	defw	op_nop		; $F7
	defw	op_nop		; $F8
	defw	ld_sp_hl	; $F9
	defw	op_nop		; $FA
	defw	op_ei		; $FB
	defw	op_nop		; $FC
	defw	handle_fd	; $FD
	defw	cp_n		; $FE
	defw	op_nop		; $FF

op_im2:
	ld	B,'2'
	jp	op_im
op_im1:
	ld	B,'1'
	jp	op_im
op_im0:
	ld	B,'0'
op_im:
	PRINT_STR op2
	PRINT_STR wrd_im
	ld	A,B
	call	char_out
	pop	HL
	ret

op_ei:
	PRINT_STR op3
	PRINT_STR wrd_ei
	pop	HL
	ret

op_di:
	PRINT_STR op3
	PRINT_STR wrd_di
	pop	HL
	ret

op_halt:
	PRINT_STR op3
	PRINT_STR wrd_halt
	pop	HL
	ret

op_nop:
	PRINT_STR op3
	PRINT_STR wrd_nop
	pop	HL
	ret

op_scf:
	PRINT_STR op3
	PRINT_STR wrd_scf
	pop	HL
	ret

op_ccf:
	PRINT_STR op3
	PRINT_STR wrd_ccf
	pop	HL
	ret

op_neg:
	PRINT_STR op2
	PRINT_STR wrd_neg
	pop	HL
	ret

op_cpl:
	PRINT_STR op3
	PRINT_STR wrd_cpl
	pop	HL
	ret

op_daa:
	PRINT_STR op3
	PRINT_STR wrd_daa
	pop	HL
	ret

dec_iydp:
	ld	BC,wrd_dec
	jp	arl_iydp
dec_ixdp:
	ld	BC,wrd_dec
	jp	arl_ixdp
dec_hlp:
	ld	BC,wrd_dec
	jp	arl_hlp
dec_r:
	ld	BC,wrd_dec
	jp	ind_r
inc_iydp:
	ld	BC,wrd_inc
	jp	arl_iydp
inc_ixdp:
	ld	BC,wrd_inc
	jp	arl_ixdp
inc_hlp:
	ld	BC,wrd_inc
	jp	arl_hlp
inc_r:
	ld	BC,wrd_inc
	jp	ind_r
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

ind_r:
	PRINT_STR op3
	ld	HL,BC
	call	write_str
	pop	HL
	push	HL
	ld	A,(HL)
	and	%00111111
	srl	A
	srl	A
	srl	A
	call	reg8_to_char
	call	char_out
	pop	HL
	ret

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
