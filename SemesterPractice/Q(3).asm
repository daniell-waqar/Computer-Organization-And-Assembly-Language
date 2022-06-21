[org 0x0100]



array: dw 1,4,7,9,2,6,4,1,7,4



loop1:
    xor ax , ax
    mov dx, [array]
    mov bx, 2
    

    maxi:

        cmp [array + bx ],dx
        jbe skip

        mov ax,[array + bx]

        skip:

            add bx,2
            cmp bx, 10
            jne maxi


    mov cx,[array + 12]
    mov bx , 14

    mini:

        cmp [array + bx],cx
        ja againskip

        mov cx,[array + bx]

        againskip:

            add bx , 2
            cmp bx,20
            jne mini

    add ax,cx

        mov ax, 0x4c00
        
        int 0x21

array: dw 1,4,7,9,2,6,4,1,7,4
