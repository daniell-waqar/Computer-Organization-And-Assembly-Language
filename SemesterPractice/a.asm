[org 0x0100]

jmp start

data: dw 1,5,6,8,3,4,2,3
length: dw 8
max: dw 0
secMAx: dw 0


if:
    mov [secMAx] , ax
    mov ax , [data + bx]
    mov [max] , ax
    add bx , 2
    sub cx , 1
    jz terminate
    jnz compareloop




start:
    mov ax , [data + bx]
    mov [max] , ax
    mov  bx , 2
    mov cx , [length]

compareloop:
    cmp ax , [data + bx]
    jnae if


else:
    cmp [secMAx] , ax
    ja l1
        add bx , 2
        sub cx , 1
        jz terminate
        jnz compareloop
l1:
    mov [secMAx] , ax
    jmp compareloop  
terminate:
mov ax , 0x4c00
int 0x21