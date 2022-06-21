[org 0x0100]

mov ax, 4
mov bx, 2
div bx

mov [res],ax

mov ax , 0x4c00
int 0x21

res: dw 0

