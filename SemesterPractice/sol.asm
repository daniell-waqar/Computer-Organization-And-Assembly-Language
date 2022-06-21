[org 0x0100]

jmp start

result: dw 0

factorial:

push bp
mov bp ,sp
push ax
push dx 
push cx

mov cx , [bp + 4]
mov dx , cx
mov ax , dx
sub dx  , 1 

l1:
    mov cx , dx
    mul dx
    mov dx ,cx
    sub dx , 1
    jnz l1

mov [result], ax
pop cx
pop dx
pop ax
pop bp
ret 2


start:
mov dx ,5
push dx
call factorial


mov ax , 0x4c00
int 0x21