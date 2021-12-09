[org 0x0100]

jmp start

num: dw 10,20,30
result: dw 0

start:
    mov ax,0
    mov bx,0
    outerloop:
        add ax,[num + bx]
        add bx,2
        cmp bx,6

        jne outerloop
    mov [result],ax
    mov ax,0x4c00
    int 0x21

