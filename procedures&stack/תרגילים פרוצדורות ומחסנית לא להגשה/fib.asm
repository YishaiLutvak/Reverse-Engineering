include 'win32a.inc'

format PE console
entry start

section '.text' code readable executable
; ======================================
start:
	call	read_hex
	call	fib
	call	print_eax
; ====================================

	push	0
	call	[ExitProcess]

fib:
	cmp		eax, 1
	jg		recurse
	mov		eax, 1
	ret
recurse:
	dec		eax
	push	eax
	call	fib
	mov		ebx, eax
	pop		eax
	dec		eax
	call	fib
	add		eax, ebx
	ret

include 'training.inc'
