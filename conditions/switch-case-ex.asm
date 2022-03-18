; Yishai Lutvak 304909864

include 'win32a.inc'

format PE console
entry start


section '.data' data readable writeable
    enterDay    db  'Enter day:',13,10,0
    weekday    db  'This is a weekday',13,10,0
	friday   db  'Friday',13,10,0
	saturday   db  'Saturday',13,10,0
	ilegal   db  'Not a legal day',13,10,0

	
section '.text' code readable executable
; ======================================


;int main() {
;    int day;
;    scanf_s("%x", &day);
;    switch (day) {
;    case 1:
;    case 2:
;    case 3:
;    case 4:
;    case 5:
;        printf("This is a weekday\n");
;        break;
;    case 6:
;        printf("Friday\n");
;        break;
;    case 7:
;        printf("Saturday\n");
;        break;
;    default:
;        printf("Not a legal day\n");
;        break;
;    }
;    return 0;
;}
	
start:
	mov     esi, enterDay
	call    print_str
	call 	read_hex
	mov		ebx, 1
	cmp 	ebx, eax
	je		day1
	inc		ebx
	cmp 	ebx, eax
	je		day2
	inc		ebx
	cmp 	ebx, eax
	je		day3
	inc		ebx
	cmp 	ebx, eax
	je		day4
	inc		ebx
	cmp 	ebx, eax
	je		day5
	inc		ebx
	cmp 	ebx, eax
	je		day6
	inc		ebx
	cmp 	ebx, eax
	je		day7
	jmp		default
day1:
day2:
day3:
day4:
day5:
	mov     esi, weekday
    call    print_str
	jmp 	finish
day6:
	mov     esi, friday
    call    print_str
	jmp 	finish
day7:
	mov     esi, saturday
    call    print_str
	jmp 	finish
default:
	mov     esi, ilegal
    call    print_str
finish:

	
; ====================================

	push	0
	call	[ExitProcess]

include 'training.inc'