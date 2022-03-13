; Yishai Lutvak 304909864

include 'win32a.inc'

format PE console
entry start


section '.data' data readable writeable
	endl    db  13,10,0
	
section '.text' code readable executable
; ======================================


;# nested loop
;num = int(input())
;for i in range(1, num+1):
;    for j in range(1, i+1):
;        print(j, end='')
;    print()
	
start:
	mov     esi, endl
	call 	read_hex
	call    print_str; print endl
	cmp		eax, 0; To avoid an endless loop
	jng		finish
	mov 	ecx, eax
	mov		eax, 1; eax is outer counter
again1:
	mov 	ebx, 0; ebx is inner counter
again2:
	inc 	ebx
	mov		edx, eax
	mov		eax, ebx
	call    print_eax; print inner counter
	mov     eax, edx
	cmp 	ebx, eax
	jl		again2
	 
    call    print_str; print endl
	inc		eax
	loop 	again1

	
; ====================================
finish:
	push	0
	call	[ExitProcess]

include '..\training.inc'
