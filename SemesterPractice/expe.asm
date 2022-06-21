[org 0x0100]

jmp start

data: dw 2,5,9,1,4,3,7
res: dw 0


start:
    mov ax,[data]
    mov bx,2


    loop1:
        cmp [data + bx],ax
        ja notMax

        mov ax,[data + bx]

    notMax:
    add bx,2
    cmp bx,16
    jnz loop1

mov [res],ax

mov ax,0x4c00
int 0x21
    




