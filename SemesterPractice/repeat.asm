org 100h

jmp start


data: dw 1,3,9,2,4,8,7,1,8,5


start:
    mov bx , 0
    mov cx , 9

outerloop:
    mov si , 2
    inner:
        mov ax , [data+bx]
        cmp [data + bx + si] , ax
        jne label
            mov dx , [data + bx + si]
        
        label:
        add si , 2
        cmp si , 18
        jnz inner

    l1:
    add bx , 2
    sub cx , 1
    jnz outerloop
    
