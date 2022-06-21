; Find maximum number

[org 0x0100]

jmp start:

val1: dw 5,10,20,15


start:
    mov ax , 18
    outerloop:
        cmp ax, [val1]
        add [val1],5
        jbe outerloop

        mov ax , 0x4c00
        int 0x21




