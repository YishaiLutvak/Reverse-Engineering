; Yishai Lutvak 304909864

include 'win32a.inc'

format PE console
entry start


section '.data' data readable writeable
	solution    db  'Number of hops:',13,10,0
	way    		db  'The way of the solution:',13,10,0
;	 bye   db  'bye',13,10,0
	
section '.text' code readable executable
; ======================================

;n = int(input())
;i = 0
;
;while n != 1:
;    if n % 2 == 0:
;        n /= 2
;    else:
;        n = 3 * n + 1
;    i += 1
;print(i)


start:
	call	read_hex
	mov     esi, way
	call    print_str
	xor		ebx, ebx
	xor 	edx, edx

again:
	cmp 	eax,1
	je		finish
	inc		edx
	mov		ebx, 1
	and		ebx, eax
	cmp		ebx, 0
	je		zugi
	mov		ecx,eax
	shl		eax,1
	add		eax,ecx
	inc		eax
	call 	print_eax
	jmp		again
	
zugi:
	shr		eax,1
	call 	print_eax
	jmp		again

finish:
	mov     esi, solution
	call    print_str
	mov     eax, edx
	call 	print_eax
	push	0
	call	[ExitProcess]

include '..\training.inc'
