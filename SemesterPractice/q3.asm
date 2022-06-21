[org 0x0100]

jmp start

array: dw 1,2,3,4,5,6


start:
    mov bx , 0
    xor ax , ax
    mov si , 10

loop1:
    mov ax , [array + bx]
    mov dx , [array + si]
    
    mov ax , [array+si]
    mov  dx , [array + bx]

    sub si , 2
    add bx , 2
    cmp bx , 6
    jnz loop1

mov ax , 0x4c00
int 0x21


