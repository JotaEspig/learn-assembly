
; Programs that deals with tables of data (arrays)

section .data
	MY_TABLE db 65, 66, 67, 68, 0xa

section .text
	global _start

_start:
	;printing table as string
	mov edx, 5
	mov ecx, MY_TABLE
	mov ebx, 1
	mov eax, 0x4
	int 0x80


	; printing table address
	;mov ecx, [MY_TABLE] ; gets the address of the table

	mov edx, 1
	mov ecx, MY_TABLE + 3 ; gets the 4th value of the table
	mov ebx, 1
	mov eax, 0x4
	int 0x80

	; exits the program
	mov ebx, 0
	mov eax, 0x1
	int 0x80
