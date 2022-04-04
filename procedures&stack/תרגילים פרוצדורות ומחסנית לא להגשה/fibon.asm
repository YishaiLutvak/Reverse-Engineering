include 'win32a.inc'

format PE console
entry start

section '.text' code readable executable
; ======================================
start:
	call	read_hex
	push	eax
	call	fib
	add		esp, 4
	call	print_eax
; ====================================

	push	0
	call	[ExitProcess]

fib:
	n = 8			; define const. n
	fib1 = -4		; define const. fib1
	push	ebp
	mov		ebp, esp
	sub		esp, 4

	mov		eax, [ebp + n]
	cmp		eax, 1
	jg		recurse
	mov		eax, 1
	jmp		done
recurse:
	dec		eax
	push	eax
	dec		eax
	push	eax
	call	fib
	add		esp, 4
	mov		[ebp + fib1], eax
	call	fib
	add		esp, 4
	add		eax, [ebp + fib1]
done:
	mov		esp, ebp
	ret

include 'training.inc'
