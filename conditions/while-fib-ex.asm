; Yishai Lutvak 304909864

include 'win32a.inc'

format PE console
entry start


;section '.data' data readable writeable
;    hi    db  'hi',13,10,0
;	 bye   db  'bye',13,10,0
	
section '.text' code readable executable
; ======================================


;# while True
;num = int(input())
;fib1 = 0
;print(fib1)
;fib2 = 1
;print(fib2)
;while True:
;    tmp = fib1 + fib2
;    fib1 = fib2
;    fib2 = tmp
;    if fib2 > num:
;        break
;    print(fib2)
	
start:
	mov 	edx, 1
	call 	read_hex
	mov 	ecx, eax
	mov		eax	,0
again:
	call    print_eax
	mov		ebx, eax
	mov		eax, edx
	add		edx, ebx
	cmp 	eax, ecx	
	jle		again
	
; ====================================

	push	0
	call	[ExitProcess]

include 'training.inc'
