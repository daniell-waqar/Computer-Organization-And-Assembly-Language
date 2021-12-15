[org 0x0100]


jmp main

parameter : dw 5

FactorialFunction:
push bp
mov bp, sp
push ax
push cx
mov ax, [bp+4]
mov cx, ax
Factoriallogic:
sub cx, 1
mul cx
cmp cx, 1
jne Factoriallogic
mov di, ax 
pop cx
pop ax
pop bp
ret 2 
sum:
push bp
mov bp, sp
sub sp, 6
push ax
push bx
push cx
push dx
push si
push di
mov dx, [bp+4] 
add dx, 1
mov si, 0 
Series:
mov ax, si
mov cx, 2
div cl
cmp ah, 0
jne find
mov word[bp-2], 1  
jmp Noswap

find:
mov word[bp-2], -1
Noswap:
mov ax, si
mul cl
add ax, 1
push ax  
call FactorialFunction
pop ax
mov [bp-4], di 
mov ax, [bp-2]
mov cx, [bp-4]
div cl
add [bp-6], ax ; Moving the sum of series in the local variable
add si, 1
cmp dx, si
jne Series

pop di
pop si
pop dx
pop cx
pop bx
pop ax
add sp, 6
pop bp
ret 2
main:
	push word[parameter]
	call sum

	mov ax, 0x4c00
	int 0x21



