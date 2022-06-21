[org 0x0100]

jmp start

data: dw 1,2,3,4,5,6,7,8
length: dw 7
max: dw 0
secMAx; dw 0



next:

    
    mov ax , [data + bx]
    mov [max] , ax
    mov [secMAx] , ax
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
    jnae next

        add bx , 2
        sub cx , 1
        jnz compareloop
        jz terminate
