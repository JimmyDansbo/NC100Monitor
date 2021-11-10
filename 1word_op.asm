op_otdr:ld	IX,wrd_otdr
	jp	op2_op
op_outd:ld	IX,wrd_outd
	jp	op2_op
op_otir:ld	IX,wrd_otir
	jp	op2_op
op_outi:ld	IX,wrd_outi
	jp	op2_op
op_indr:ld	IX,wrd_indr
	jp	op2_op
op_ind:	ld	IX,wrd_ind
	jp	op2_op
op_inir:ld	IX,wrd_inir
	jp	op2_op
op_ini:	ld	IX,wrd_ini
	jp	op2_op
op_retn:ld	IX,wrd_retn
	jp	op2_op
op_reti:ld	IX,wrd_reti
	jp	op2_op
op_rrd:	ld	IX,wrd_rrd
	jp	op2_op
op_rld:	ld	IX,wrd_rld
	jp	op2_op
op_cpdr:ld	IX,wrd_cpdr
	jp	op2_op
op_cpd:	ld	IX,wrd_cpd
	jp	op2_op
op_cpir:ld	IX,wrd_cpir
	jp	op2_op
op_cpi:	ld	IX,wrd_cpi
	jp	op2_op
op_lddr:ld	IX,wrd_lddr
	jp	op2_op
op_ldd:	ld	IX,wrd_ldd
	jp	op2_op
op_ldir:ld	IX,wrd_ldir
	jp	op2_op
op_ldi:	ld	IX,wrd_ldi
	jp	op2_op
op_neg:	ld	IX,wrd_neg
	jp	op2_op
op_nop2:ld	IX,wrd_nop
	jp	op2_op

op_ei:	ld	IX,wrd_ei
	jp	op3_op
op_di:	ld	IX,wrd_di
	jp	op3_op
op_halt:ld	IX,wrd_halt
	jp	op3_op
op_nop:	ld	IX,wrd_nop
	jp	op3_op
op_scf:	ld	IX,wrd_scf
	jp	op3_op
op_ccf:	ld	IX,wrd_ccf
	jp	op3_op
op_cpl:	ld	IX,wrd_cpl
	jp	op3_op
op_daa:	ld	IX,wrd_daa
	jp	op3_op
op_exx:	ld	IX,wrd_exx
	jp	op3_op
op_rrca:ld	IX,wrd_rrca
	jp	op3_op
op_rla:	ld	IX,wrd_rla
	jp	op3_op
op_rlca:ld	IX,wrd_rlca
	jp	op3_op
op_rra:	ld	IX,wrd_rra
	jp	op3_op
op_ret:	ld	IX,wrd_ret
	jp	op3_op

op2_op:	print_str op2
	jp	op3_op.op_e
op3_op:
	print_str op3
.op_e:	push	IX
	pop	HL
	call	write_str
	pop	HL
	ret
op_nop0:
	pop	HL
	call	out2hex
	ld	A,' '
	call	char_out
	call	char_out
	print_str wrd_nop
	pop	HL
	inc	HL
	inc	HL
	ret
