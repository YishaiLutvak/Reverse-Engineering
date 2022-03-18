; Yishai Lutvak 304909864

include 'win32a.inc'

format PE console
entry start


;section '.data' data readable writeable
;    hi    db  'hi',13,10,0
;	 bye   db  'bye',13,10,0
	
section '.text' code readable executable
; ======================================

;for loop in python that we need convert to assembly:
;
;for
;num = input()
;total = 0
;for i in range(1,int(num)+1):
;    total += i
;print(total)
	
start:
	xor		ebx, ebx
	mov 	edx, ebx 	
	call 	read_hex
	mov 	ecx, eax
my_loop:
	inc		edx
	add		ebx, edx
	loop 	my_loop

	mov		eax, ebx
	call    print_eax

	
; ====================================

	push	0
	call	[ExitProcess]

include '..\training.inc'
