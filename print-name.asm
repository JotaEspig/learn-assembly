
; Prints the name that was read from keyboard
section .data
    welcome_msg db "Welcome!, type your name: "
    welcome_msg_len equ $-welcome_msg

section .bss
    name: resb 100 ; Reserves 10 byte

section .text
    global _start

_start:
    mov edx, welcome_msg_len
    mov ecx, welcome_msg
    mov ebx, 1
    mov eax, 0x4
    int 0x80

    ; Read from keyboard
    mov edx, 100            ; storing length to name_length
    mov ecx, name           ; storing buffer into name variable
    mov ebx, 0              ; stdin fd
    mov eax, 0x3            ; read syscall
    int 0x80

    ; Prints the name
    mov edx, 100
    mov ecx, name
    mov ebx, 1
    mov eax, 0x4
    int 0x80

    ; Exits
    mov ebx, 0
    mov eax, 0x1
    int 0x80
    