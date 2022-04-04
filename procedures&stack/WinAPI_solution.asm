; Program receives a string from console, 
; calculates length and prints message to console
; Implementing syscalls GetStdHandle, ReadFile, printf
; Author - Barak Gonen

include 'win32a.inc'

format PE console
entry start

INPUT_SIZE_LIMIT = 100h

; ======================================
section '.data' data readable writeable
    prompt_string	db	'Please enter text', 13, 10, 0
	bytes_read		dd	?
	user_string		db	INPUT_SIZE_LIMIT dup (?), 0
	result_string	db 	'User entered: %sLength: %d'
	
; ======================================	
section '.text' code readable executable
start:
	; Show prompt message
	push 	prompt_string
	call	[printf]
	add		esp, 4
	
	
	
	; Get console input handle - returned in EAX
	push 	STD_INPUT_HANDLE	; from win32a.inc, default is console
	call	[GetStdHandle]
	add		esp, 4
	
	
	
	; Read from the device pointed by EAX
	push	0
	push 	bytes_read
	push 	INPUT_SIZE_LIMIT
	push 	user_string
	push 	eax
	call	[ReadFile]
	add		esp, 5*4
	
	
	; Get string length, pointed by EAX
	push	user_string
	call	[strlen]
	add		esp, 4
	sub		eax, 2
	
	; print string to console
	push 	eax
	push 	user_string
	push	result_string
	call	[printf]
	add		esp, 3*4	
	
	push	0
	call	[ExitProcess]

section '.idata' import data readable

library kernel32, 'kernel32.dll',\
		msvcrt, 'msvcrt.dll'
		
import	kernel32,\
		ExitProcess, 'ExitProcess',\
		GetStdHandle, 'GetStdHandle',\
		ReadFile, 'ReadFile'
		
import	msvcrt,\
		printf, 'printf',\
		strlen, 'strlen'
		

