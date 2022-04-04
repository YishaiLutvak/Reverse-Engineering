section '.data' data readable writeable
    format_to_print db "%x",10,13,0

section '.text' code readable executable

print_integer:
    pushad      ; Keep all registers.
    mov bl,'i'
    call print_something
    popad
    ret


print_unsigned :
    pushad      ; Keep all registers.
    mov bl,'u'
    call print_something
    popad
    ret

print_float:
    pushad
    mov bl,'f'
    call print_something
    popad
    ret

print_hex:
    pushad
    mov bl,'x'
    call print_something
    popad
    ret


print_something:
    pushad ;keep all registers
    push eax
    mov byte[format_to_print+1],bl
    push format_to_print
    call [printf]
    add esp,8
    popad
    ret
  
include 'training.inc'