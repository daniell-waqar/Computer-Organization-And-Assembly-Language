[org 0x0100]

jmp start

data: dw 1,5,2,3,6
res: dw 0

start:
    mov ax,0
    mov bx,data
    mov cx,5


loop1:
    add ax,[bx]
    add bx,2
    dec cx
    jnz loop1

mov [res],ax

mov ax,0x4c00
int 0x21
    
    
