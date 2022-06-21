org 100h

jmp start

array: dw 1,3,9,2,4,8,7,1,6,5

start:
    mov si , 0
    mov bx , 2
    mov ax , [array + si]

    maximum:
        cmp [array + bx] , ax
        ja notMax

        mov cx , [array + bx]
    notMax:
        add bx , 2
        cmp bx , 8
        jnz maximum

    mov si , 10
    mov bx , 12
    mov ax , [array + si]

    minimum:
        cmp [array + bx] , ax
        ja notMin

        mov dx , [array + bx]
    notMin:
        add bx , 2
        cmp bx , 18
        jnz minimum

    add dx , cx

    mov ax , 0x4c00
    int 0x21
