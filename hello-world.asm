
; Prints hello world in the terminal

section .data:
   message: db "Hello World!", 0x0a ; 0x0a means '\n'
   message_length: equ $-message ; $-message means: current location (message_length) - message
   ; this is pointer arithmetic

section .text:
   global _start

_start:
   ; Prints the message
   mov eax, 0x4            ; using write syscall
   mov ebx, 0x1            ; using stdout (1) as fd (file descriptor)
   mov ecx, message        ; using message as the buffer
   mov edx, message_length ; using message length
   int 0x80                ; int = interrupt, 0x80 to run the syscall we defined in eax

   ; Exits the program
   mov eax, 0x1            ; using exit syscall 
   mov ebx, 0              ; using 0 as return code
   int 0x80
