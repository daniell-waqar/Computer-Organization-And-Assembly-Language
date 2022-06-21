[org 0x0100]

jmp start

num: dw 10
res: dw 0

start:
    mov ax,0

    mov cx,10

    loop1:
        add ax,[num]
        sub cx,1
        jnz loop1

    mov [res],ax

    mov ax,0x4c00
    int 0x21
    