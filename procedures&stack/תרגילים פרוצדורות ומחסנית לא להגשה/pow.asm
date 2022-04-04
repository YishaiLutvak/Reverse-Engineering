include 'win32a.inc'

format PE console
entry start

section '.text' code readable executable
; ======================================
start:
	; calculates a ** b
	call	read_hex
	mov		ebx, eax
	call	read_hex
	call	power
	call	print_eax
; ====================================

	push	0
	call	[ExitProcess]

power:
	; stores ebx ** eax in eax
	mov		ecx, eax
	mov		eax, 1
mult:
	call	multiply
	loop	mult
	
multiply:
	; stores eax * ebx in eax
	mul		ebx
	ret

include 'training.inc'
