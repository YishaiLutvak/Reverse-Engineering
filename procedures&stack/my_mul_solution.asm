include 'win32a.inc'

format PE console
entry start

; ======================================
section '.data' data readable writeable
	arg1			dd	8
	arg2			dd  2
    return_value	dd	?


; ======================================
section '.text' code readable executable

start:
	push 	return_value
	push 	[arg2]
	push 	[arg1]
	call	my_mul
	mov		eax, [return_value]
	call	print_eax
	push	0
	call	[ExitProcess]

; ====================================

my_mul:
	push 	ebp
	mov		ebp, esp
	push	eax
	push	ebx
	mov     eax, [ebp+8]
	mov		ebx, [ebp+12]
	mul		ebx
	mov		ebx, [ebp+16]	
	mov		[ebx], eax
	pop 	ebx
	pop		eax
	pop		ebp
	ret		12

include '..\training.inc'
