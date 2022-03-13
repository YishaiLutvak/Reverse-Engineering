include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable
    hi    db  'hi',13,10,0
	bye   db  'bye',13,10,0
	
section '.text' code readable executable
; ======================================
	
start:
	mov		ecx, 0x1000
again:
	loop again
	; Show a message to the user:
    mov     esi, hi
    call    print_str
	; Show a message to the user:
    mov     esi, bye
    call    print_str
	
; ====================================

	push	0
	call	[ExitProcess]

include '..\training.inc'

