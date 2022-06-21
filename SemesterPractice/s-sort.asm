org 100h

jmp start

data: dw 7,5,4,2
counter: dw 2


start:
    mov ax , 0
    mov bx , 0
    mov si , 0
    mov di , 0


outerloop:

  
    mov bx , [counter] ;use for indexing

    mov cx , [data + si] ;cx contain 5

    sorting:
        cmp [data + bx] , cx
        ja noswap

        mov cx, [data + bx] ;at the moment cx conatin  minimum element

        mov di , bx ; di conatin index of  minimum element


    noswap:
    add bx , 2
    cmp bx , 8
    jnz sorting


    mov bx , [data + si]
    mov [data + si] , cx
    mov [data + di] , bx 

    add si , 2

    add word[counter] , 2
    cmp si , 6

    jnz outerloop

      mov  ax, 0x4c00 
    int  0x21 

    