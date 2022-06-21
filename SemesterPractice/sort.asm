[org 0x0100]
jmp start

data : dw 45,23,14,98

start:
mov cx,4
  loop1:
    mov bx,0

    loop2:
    mov ax,[data + bx]
    cmp [data + bx + 2],ax
    ja noswap

        mov dx,[data + bx + 2]
        mov [data + bx],dx
        mov [data + bx + 2],ax

    noswap:
    add bx,2
    cmp bx,6
    jne loop2

mov ax,0x4c00
int 0x21
