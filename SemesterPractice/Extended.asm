[org 0x0100]

jmp start

multiplcand:  dd 3000
multiplier:   dw 500
total:        dd  0
start:

    mov cl,16
    mov dx,[multiplier]

    checkbit:
    shr dx,1
    jnc skip

        mov ax,[multiplcand]
        add [total],ax
        mov ax,[multiplcand + 2]
        add [total + 2],ax


    skip:
    shl word [multiplcand],1
    rcl word [multiplcand + 2],1
    dec cl
    jnz checkbit

    mov ax,0x4c00
    int 0x21
