[org 0x0100]


jmp start

data: dw 2,0,0,7,5,0
res: dw 0

start:
    mov cx , 6
    mov dx,[data + 6]
    mov bx , 0

innerloop:
    mov ax , [data + bx]
    add bx , 2
    cmp  ax, dx
    jnae innerloop


    mov [res] , dx

    mov ax , 0x4c00
    int 0x21



