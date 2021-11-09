
handle_cb:
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

	ld	BC,cb_list
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

jp_nn:
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
	PRINT_STR wrd_jp
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

res_b_iydp:
	ld	IX,wrd_res
	jp	srt_b_iydp
res_b_ixdp:
	ld	IX,wrd_res
	jp	srt_b_ixdp
res_b_hlp:
	ld	IX,wrd_res
	jp	srt_b_hlp
res_b_r:
	ld	IX,wrd_res
	jp	srt_b_r
set_b_iydp:
	ld	IX,wrd_set
	jp	srt_b_iydp
set_b_ixdp:
	ld	IX,wrd_set
	jp	srt_b_ixdp
set_b_hlp:
	ld	IX,wrd_set
	jp	srt_b_hlp
set_b_r:
	ld	IX,wrd_set
	jp	srt_b_r
bit_b_iydp:
	ld	IX,wrd_bit
	jp	srt_b_iydp
bit_b_ixdp:
	ld	IX,wrd_bit
	jp	srt_b_ixdp
bit_b_hlp:
	ld	IX,wrd_bit
	jp	srt_b_hlp
bit_b_r:
	ld	IX,wrd_bit
	jp	srt_b_r

srt_b_iydp:
	ld	A,' '
	call	char_out
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	pop	HL			;CB
	inc	HL			;d
	push	HL
	inc	HL			;b
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	call	char_out
	push	IX
	pop	HL
	call	write_str
	pop	HL
	push	HL
	inc	HL
	ld	A,(HL)
	and	%00111000
	srl	A
	srl	A
	srl	A
	or	%00110000
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
	inc	HL
	ret

srt_b_ixdp:
	ld	A,' '
	call	char_out
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	pop	HL			;CB
	inc	HL			;d
	push	HL
	inc	HL			;b
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	call	char_out
	push	IX
	pop	HL
	call	write_str
	pop	HL
	push	HL
	inc	HL
	ld	A,(HL)
	and	%00111000
	srl	A
	srl	A
	srl	A
	or	%00110000
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
	inc	HL
	ret

srt_b_hlp:
	PRINT_STR op2
	push	IX
	pop	HL
	call	write_str
	pop	HL
	push	HL
	ld	A,(HL)
	and	%00111000
	srl	A
	srl	A
	srl	A
	or	%00110000
	call	char_out
	call	commaspc
	PRINT_STR reg_hlp
	pop	HL
	ret

srt_b_r:
	PRINT_STR op2
	push	IX
	pop	HL
	call	write_str
	pop	HL
	push	HL
	ld	A,(HL)
	and	%00111000
	srl	A
	srl	A
	srl	A
	or	%00110000
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

op_rrd:
	PRINT_STR op2
	PRINT_STR wrd_rrd
	pop	HL
	ret

op_rld:
	PRINT_STR op2
	PRINT_STR wrd_rld
	pop	HL
	ret

srl_iydp:
	ld	IX,wrd_srl
	jp	ras_iydp
srl_ixdp:
	ld	IX,wrd_srl
	jp	ras_ixdp
srl_hlp:
	ld	IX,wrd_srl
	jp	ras_hlp
srl_r:
	ld	IX,wrd_srl
	jp	ras_r
sra_iydp:
	ld	IX,wrd_sra
	jp	ras_iydp
sra_ixdp:
	ld	IX,wrd_sra
	jp	ras_ixdp
sra_hlp:
	ld	IX,wrd_sra
	jp	ras_hlp
sra_r:
	ld	IX,wrd_sra
	jp	ras_r
sla_iydp:
	ld	IX,wrd_sla
	jp	ras_iydp
sla_ixdp:
	ld	IX,wrd_sla
	jp	ras_ixdp
sla_hlp:
	ld	IX,wrd_sla
	jp	ras_hlp
sla_r:
	ld	IX,wrd_sla
	jp	ras_r
rr_iydp:
	ld	IX,wrd_rr
	jp	ras_iydp
rr_ixdp:
	ld	IX,wrd_rr
	jp	ras_ixdp
rr_hlp:
	ld	IX,wrd_rr
	jp	ras_hlp
rr_r:
	ld	IX,wrd_rr
	jp	ras_r
rrc_iydp:
	ld	IX,wrd_rrc
	jp	ras_iydp
rrc_ixdp:
	ld	IX,wrd_rrc
	jp	ras_ixdp
rrc_hlp:
	ld	IX,wrd_rrc
	jp	ras_hlp
rrc_r:
	ld	IX,wrd_rrc
	jp	ras_r
rl_iydp:
	ld	IX,wrd_rl
	jp	ras_iydp
rl_ixdp:
	ld	IX,wrd_rl
	jp	ras_ixdp
rl_hlp:
	ld	IX,wrd_rl
	jp	ras_hlp
rl_r:
	ld	IX,wrd_rl
	jp	ras_r
rlc_iydp:
	ld	IX,wrd_rlc
	jp	ras_iydp
rlc_ixdp:
	ld	IX,wrd_rlc
	jp	ras_ixdp
rlc_hlp:
	ld	IX,wrd_rlc
	jp	ras_hlp
rlc_r:
	ld	IX,wrd_rlc
	jp	ras_r

ras_iydp:
	ld	A,' '
	call	char_out
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	pop	HL
	inc	HL
	push	HL
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	call	char_out
	push	IX
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
	inc	HL		; Skip last $06
	ret

ras_ixdp:
	ld	A,' '
	call	char_out
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	pop	HL
	inc	HL
	push	HL
	inc	HL
	ld	A,(HL)
	call	hexout
	ld	A,' '
	call	char_out
	call	char_out
	push	IX
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
	inc	HL		; Skip last $06
	ret

ras_hlp:
	PRINT_STR op2
	push	IX
	pop	HL
	call	write_str
	PRINT_STR reg_hlp
	pop	HL
	ret

ras_r:
	PRINT_STR op2
	push	IX
	pop	HL
	call	write_str
	pop	HL
	push	HL
	ld	A,(HL)
	and	%00000111
	call	reg8_to_char
	call	char_out
	pop	HL
	ret

op_rra:
	PRINT_STR op3
	PRINT_STR wrd_rra
	pop	HL
	ret

op_rrca:
	PRINT_STR op3
	PRINT_STR wrd_rrca
	pop	HL
	ret

op_rla:
	PRINT_STR op3
	PRINT_STR wrd_rla
	pop	HL
	ret

op_rlca:
	PRINT_STR op3
	PRINT_STR wrd_rlca
	pop	HL
	ret

dec_iy:
	ld	BC,wrd_dec
	jp	id_iy
dec_ix:
	ld	BC,wrd_dec
	jp	id_ix
dec_ss:
	ld	BC,wrd_dec
	jp	id_ss
inc_iy:
	ld	BC,wrd_inc
	jp	id_iy
inc_ix:
	ld	BC,wrd_inc
	jp	id_ix
inc_ss:
	ld	BC,wrd_inc
	jp	id_ss

id_iy:
	PRINT_STR op2
	ld	HL,BC
	call	write_str
	PRINT_STR reg_iy
	pop	HL
	ret

id_ix:
	PRINT_STR op2
	ld	HL,BC
	call	write_str
	PRINT_STR reg_ix
	pop	HL
	ret

id_ss:
	PRINT_STR op3
	ld	HL,BC
	call	write_str
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
	ret

add_iy_rr:
	PRINT_STR op2
	PRINT_STR wrd_add
	PRINT_STR reg_iy
	call	commaspc
	pop	HL
	push	HL
	ld	A,(HL)
	and	%00110000
	cp	%00000000
	jr	Z,.do_bc
	cp	%00010000
	jr	Z,.do_de
	cp	%00100000
	jr	Z,.do_iy
	ld	HL,reg_sp
	jr	.write
.do_bc:
	ld	HL,reg_bc
	jr	.write
.do_de:
	ld	HL,reg_de
	jr	.write
.do_iy:
	ld	HL,reg_iy
.write:
	call	write_str
	pop	HL
	ret

add_ix_pp:
	PRINT_STR op2
	PRINT_STR wrd_add
	PRINT_STR reg_ix
	call	commaspc
	pop	HL
	push	HL
	ld	A,(HL)
	and	%00110000
	cp	%00000000
	jr	Z,.do_bc
	cp	%00010000
	jr	Z,.do_de
	cp	%00100000
	jr	Z,.do_ix
	ld	HL,reg_sp
	jr	.write
.do_bc:
	ld	HL,reg_bc
	jr	.write
.do_de:
	ld	HL,reg_de
	jr	.write
.do_ix:
	ld	HL,reg_ix
.write:
	call	write_str
	pop	HL
	ret

sbc_hl_ss:
	ld	HL,op2
	ld	BC,wrd_sbc
	jp	adx_hl_ss
adc_hl_ss:
	ld	HL,op2
	ld	BC,wrd_adc
	jp	adx_hl_ss
add_hl_ss:
	ld	HL,op3
	ld	BC,wrd_add
adx_hl_ss:
	call	write_str
	ld	HL,BC
	call	write_str
	PRINT_STR reg_hl
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
	ret
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
