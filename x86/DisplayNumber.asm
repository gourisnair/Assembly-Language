section .data
msg1: db 'Enter a number: '
msg1len: equ $ - msg1
msg2: db 'The number you have entered is '
msg2len: equ $ - msg2

section .bss
num resb 5

section .text
global _start
_start:

;Output the message
mov eax, 4
mov ebx, 1
mov ecx, msg1
mov edx, msg1len
int 80h

;Read input from user
mov eax, 3
mov ebx, 2
mov ecx, num
mov edx, 5
int 80h

;Output the message
mov eax, 4
mov ebx, 1
mov ecx, msg2
mov edx, msg2len
int 80h

;Print the user entered value
mov eax, 4
mov ebx, 1
mov ecx, num
mov edx, 5
int 80h

;Exit
mov eax, 1
mov ebx, 0
int 80h
