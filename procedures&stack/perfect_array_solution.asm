; Barak Gonen
; An array is perfect if it contains all the values starting from zero
; and incrementing by 1, with no value appearing twice (order not important)
; For example: 0, 2, 1 is perfect
; While 0, 2, 3 is not perfect, 0, 1, 1 is not perfect 

include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable
    array		db 9, 8, 0, 2, 5, 6, 3, 4, 1, 7
	array_len 	dd $-array
	bad_array	db "Array is no good", 13, 10, 0
	good_array	db "Perfect", 13, 10, 0
	
section '.text' code readable executable
; ======================================

check:
	; pointer to array, array_len, value to find
	push 	ebp
	mov		ebp, esp
	sub		esp, 4 			 ; one local variable
	push 	ebx				 ; need to use in 3 registers
	push	ecx
	push	edx
	mov		eax, [ebp+8]     ; value to find
	mov		ecx, [ebp+12]    ; array len = 10
	mov		ebx, [ebp+16]    ; array address [9, 8, 0, 2, 5, 6, 3, 4, 1, 7]
	mov		dword [ebp-4], 0 ; represent return value
	xor		edx, edx		 ; edx = 0
.loop:
	mov		dl, byte [ebx+ecx-1] ; ecx down in every iterable
	cmp		edx, eax
	je		.found
	loop	.loop
.not_found:
	mov		dword [ebp-4], 0 ; asign false in return value
	jmp		.done
.found:
	mov		dword [ebp-4], 1 ; asign true in return value
.done:
	mov		eax, [ebp-4]	 ; eax is return value
	pop		edx				 ; recycle registers
	pop		ecx
	pop		ebx
	add 	esp, 4 	   		 ; one local variable
	pop		ebp              
	ret		12				 ; 3 arguments
	
start:
	mov		ecx, [array_len]
	xor		ebx, ebx
check_element:
	push	array		  ; array address
	push	[array_len]	  ; array length
	push	ebx			  ; value to search
	call	check
	cmp		eax, 0
	je		bad
	inc		ebx
	loop	check_element
good:
	mov		esi, good_array
	call	print_str
	jmp		done
bad:
	mov 	esi, bad_array
	call	print_str
	
done:
	push	0
	call	[ExitProcess]

include '..\training.inc'

