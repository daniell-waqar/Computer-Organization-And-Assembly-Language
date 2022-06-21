org 100h

jmp start


GCD:
    push bp
    mov bp , sp
    push ax 
    push bx

    mov ax , [bp+6]
    mov bx , [bp+4]

    cmp  bx , 0    ;if Y == 0
    je if

    cmp ax , bx  ;In case X < Y
    jb elif


;return (X-Y , Y)
else:
    sub ax , bx
    push ax
    push bx

    call GCD
    pop bx
    pop ax
    pop bp 
    ret 4

;return (X, Y)
    elif:
        push ax 
        push bx

        call GCD
        pop bx
        pop ax
        pop bp
        ret 4



;return X
    if:
        mov dx , ax


start:
    mov ax , 15
    mov bx , 20

    push ax 
    push bx

    call GCD 
    
    
    mov ax , 0x4c00
    int 0x21

