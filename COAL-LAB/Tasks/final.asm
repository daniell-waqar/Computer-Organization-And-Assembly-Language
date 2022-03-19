; Program final value will be 16 in AX Register

[org 0x0100]

mov ax , 0
outerloop:

    add ax, 4
    cmp ax , 16
    jne outerloop

    mov ax , 0x4c00
    int 0x21







