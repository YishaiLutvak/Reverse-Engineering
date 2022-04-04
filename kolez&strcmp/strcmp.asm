; Yishai Lutvak

include 'win32a.inc'

format PE console
entry start
MAX_STR_SIZE = 0x30

section '.data' data readable writeable
	str1		db	'sometheing', 0
	str2		db	'sometheinx', 0
	same		db	'Identical', 13, 10, 0
	different	db	'Not identical', 13, 10, 0
	
section '.text' code readable executable

start:
	    
    ; Check str1 length
	mov edi,str1
    mov eax,0
    mov ecx,0xffffffff     
    mov edx,ecx
    repne scasb 
    sub edx, ecx

	; Check str2 length
	mov edi,str2
    mov eax,0
    mov ecx,0xffffffff 
    mov ebx,ecx
    repne scasb 
    sub ecx, ebx
    neg ecx

	; compare strings lengths
	cmp		ecx, edx
	jne		not_identical
	
	mov 	esi, str1
	mov 	edi, str2
	repe	cmpsb
	jne		not_identical

identical:
	mov		esi, same
	call 	print_str
	jmp		done	
	
not_identical:
	mov		esi, different
	call 	print_str
	
done:	
	push	0
	call	[ExitProcess]
	
include 	'..\training.inc'