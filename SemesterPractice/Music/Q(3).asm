[org 0x0100]

jmp start 

data: dw 1,4,7,9,2,6,4,1,7,4,3
result: dw 0

start:

    mov ax, [data]
    mov bx, 2
    

    maximum:

        cmp [data + bx ],ax
        jbe notmaximum

        mov ax,[data + bx]

        notmaximum:

            add bx,2
            cmp bx, 10
            jnz maximum

;to find minimum
    mov cx,[data + 12]
    mov bx , 14

    minimum:

        cmp [data + bx],cx
        ja notminimum
        mov cx,[data + bx]

        notminimum:

            add bx , 2
            cmp bx,22
            jnz minimum

    add ax,cx
    mov [result],ax


           
        mov ax, 0x4c00
        
        int 0x21