
code_out:
IF NC100 == 1
	call	txtwrchar
ELSE
	call	$BB5D
ENDIF
	ret

char_out:
IF NC100 == 1
	call	txtoutput
ELSE
	call	$BB5A
ENDIF
	ret

write_str:
IF NC100 == 1
	call	textout
ELSE
	ld	A,(HL)
	cp	0
	ret	Z
	inc	HL
	call	$BB5A
	jr	write_str
ENDIF
	ret

clear_scr:
IF NC100 == 1
	call	txtclearwindow
ELSE
	call	$BB6C
ENDIF
	ret

cursor_on:
IF NC100 == 1
	call	txtcuron
ELSE
	call	$BB81
ENDIF
	ret

wait_keyb:
IF NC100 == 1
	call	txtcuron
	call	kmwaitkbd
ELSE
	push	AF
	call	$BB06
	ld	C,A
	pop	AF
ENDIF
	ret

get_xy:
IF NC100 == 1
	call	txtgetcursor
ELSE
	call	$BB78
ENDIF
	ret

goto_xy:
IF NC100 == 1
	call	txtsetcursor
ELSE
	push	AF
	push	HL
	call	$BB75
	pop	HL
	pop	AF
ENDIF
	ret
