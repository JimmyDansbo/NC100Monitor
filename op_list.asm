op_list:
	defw	op_nop		; $00
	defw	ld_dd_nn	; $01
	defw	ld_bcp_a	; $02
	defw	inc_ss		; $03
	defw	inc_r		; $04
	defw	dec_r		; $05
	defw	ld_r_n		; $06
	defw	op_rlca		; $07
	defw	ex_af_af	; $08
	defw	add_hl_ss	; $09
	defw	ld_a_bcp	; $0A
	defw	dec_ss		; $0B
	defw	inc_r		; $0C
	defw	dec_r		; $0D
	defw	ld_r_n		; $0E
	defw	op_rrca		; $0F
	defw	op_nop		; $10
	defw	ld_dd_nn	; $11
	defw	ld_dep_a	; $12
	defw	inc_ss		; $13
	defw	inc_r		; $14
	defw	dec_r		; $15
	defw	ld_r_n		; $16
	defw	op_rla		; $17
	defw	op_nop		; $18
	defw	add_hl_ss	; $19
	defw	ld_a_dep	; $1A
	defw	dec_ss		; $1B
	defw	inc_r		; $1C
	defw	dec_r		; $1D
	defw	ld_r_n		; $1E
	defw	op_rra		; $1F
	defw	op_nop		; $20
	defw	ld_dd_nn	; $21
	defw	ld_nnp_hl	; $22
	defw	inc_ss		; $23
	defw	inc_r		; $24
	defw	dec_r		; $25
	defw	ld_r_n		; $26
	defw	op_daa		; $27
	defw	op_nop		; $28
	defw	add_hl_ss	; $29
	defw	ld_hl_nnp	; $2A
	defw	dec_ss		; $2B
	defw	inc_r		; $2C
	defw	dec_r		; $2D
	defw	ld_r_n		; $2E
	defw	op_cpl		; $2F
	defw	op_nop		; $30
	defw	ld_dd_nn	; $31
	defw	ld_nnp_a	; $32
	defw	inc_ss		; $33
	defw	inc_hlp		; $34
	defw	dec_hlp		; $35
	defw	ld_hlp_n	; $36
	defw	op_scf		; $37
	defw	op_nop		; $38
	defw	add_hl_ss	; $39
	defw	ld_a_nnp	; $3A
	defw	dec_ss		; $3B
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
	defw	jp_nn		; $C3
	defw	op_nop		; $C4
	defw	push_qq		; $C5
	defw	add_a_n		; $C6
	defw	op_nop		; $C7
	defw	op_nop		; $C8
	defw	op_nop		; $C9
	defw	op_nop		; $CA
	defw	handle_cb	; $CB
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