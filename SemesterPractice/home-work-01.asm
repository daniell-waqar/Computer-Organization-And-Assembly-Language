[org 0x0100]

jmp start 

data: dw 2,0,0,7,5,0
result: dw 0

start:

    mov ax, [data]
    mov bx, 2
    
;code for maximum

    maximum:

        cmp [data + bx ],ax
        jbe notmaximum

        mov ax,[data + bx]

        notmaximum:

            add bx,2
            cmp bx, 10
            jnz maximum

    mov [result],ax

    mov ax , 0x4c00
    int 0x21
