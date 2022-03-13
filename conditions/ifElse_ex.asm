;Yishai Lutvak 304909864

include 'win32a.inc'

format PE console
entry start

;section '.data' data readable writeable
;   hi    db  'hi',13,10,0
;	bye   db  'bye',13,10,0
	
section '.text' code readable executable
; ======================================
	
start:
	call 	read_hex
	mov		ebx, eax
	call 	read_hex
	cmp		ebx, eax
	je		equal
	xor		eax, eax
	jmp		final
equal:
	mov     eax, 1
final:
	call    print_eax
	
	
; ====================================

	push	0
	call	[ExitProcess]

include '..\training.inc'
