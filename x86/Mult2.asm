SYS_EXIT equ 1
SYS_WRITE equ 4
SYS_READ equ 3
STDIN equ 0
STDOUT equ 1

section .data

msg1: db 'Enter a number: ', 10, 0
msg1len: equ $ - msg1
msg2: db 'Enter the second digit', 10, 0
msg2len: equ $ - msg2
msg3: db 'The product is '
msg3len: equ $ - msg3

section .bss

num1 resb 2
num2 resb 2
pro resb 1

section .text
global _start
_start:
mov eax, SYS_WRITE
mov ebx, STDOUT
mov ecx, msg1
mov edx, msg1len
int 80h

mov eax, SYS_READ
mov ebx, STDIN
mov ecx, num1
mov edx, 2
int 80h

mov eax, SYS_WRITE
mov ebx, STDOUT
mov ecx, msg2
mov edx, msg2len
int 80h

mov eax, SYS_READ
mov ebx, STDIN
mov ecx, num2
mov edx, 2
int 80h

mov eax, [num1]
sub eax, '0'

mov ebx, [num2]
sub ebx, 0

mul ebx
add ebx, '0'

mov [pro], eax

mov eax, SYS_WRITE
mov ebx, STDOUT
mov ecx, msg3
mov edx, msg3len
int 80h

mov eax, SYS_WRITE
mov ebx, STDOUT
mov ecx, pro
mov edx, 1
int 80h

mov eax, 1
mov ebx, 0
int 80h
