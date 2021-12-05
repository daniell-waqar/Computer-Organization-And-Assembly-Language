[org 0x0100]
jmp start
array: dw 5,8,11,12,16,9,21

max: dw 0

start:

    mov ax,5
    mov bx,0

    outerloop:

        mov dx,[array + bx]
        add bx,2
        
        cmp dx,ax
        ja outerloop

    mov [max],dx

mov ax,0x4c00
int 0x21