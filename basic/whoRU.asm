; Program prints a message to the user
; The message is encrypted using a simple key and XOR function
; Barak Gonen

;Yishai Lutvak 304909864

include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable
	my_str  db   'A(ie(i(kggd(kqjmz({|}lmf|',13,10,0
	key 	db	 00001000b
	
section '.text' code readable executable
start:
	xor		ecx, ecx
decrypt:
	; Edit code and add new code only to this part
	mov		al, [my_str+ecx]
	xor		al, [key]
	mov		[my_str+ecx], al
	
	; Do not change from here on
	inc		ecx
	cmp		ecx, key - my_str - 3 
	jne 	decrypt
	mov		esi, my_str
	call	print_str
	push	0
	call	[ExitProcess]

include '..\training.inc'

