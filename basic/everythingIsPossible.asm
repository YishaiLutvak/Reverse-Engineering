include 'win32a.inc'

format PE console
entry start

section '.text' code readable writeable executable 
; ======================================
	
start: 
	mov 	byte[0x0040101d],-5
	mov	    byte[0x0040101e], 0xFF
	mov		byte[0x0040101f], 0xFF
    mov		byte[0x00401020], 0xFF
	mov		eax, 7	
	add		eax, 5
	call	print_eax
	
; ====================================
	push	0
	call	[ExitProcess]

include '..\training.inc'
