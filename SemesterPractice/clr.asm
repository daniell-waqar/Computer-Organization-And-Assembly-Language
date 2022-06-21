[org 0x0100]

jmp main

name: db "Waqar Ahmed"
nLength: dw $ - name

clrscr:
    push bp
    push ax
    push di
    push es

    mov ax,0xb800
    mov es,ax
    mov di,0

    mov al,0x20
    mov ah,0x07
    
    l1:
        mov [es:di],ax
        add di,2
        cmp di,4000
        jne l1

    pop es
    pop di
    pop ax
    pop bp

    ret


    printname:
        push bp
        mov bp,sp

        push ax
        push bx
        push es
        push cx
        push si
        push di
        push dx


        mov ax,0xb800
        mov es,ax
        add di,2000

        mov cx,[bp + 4] ;nLength
        mov si,[bp + 6]  ; adress of 1st char
        mov ah , 0x83 ;color

        l2:
            mov al,[si]
            mov [es:di],ax
            add si,1
            add di,2
           loop l2
            jmp exit

        exit:

        
        pop dx
        pop di
        pop si
        pop cx
        pop es
        pop ax
        pop bx
        pop bp


    ret 04


        








        





main:
    push name
    push word[nLength]
    call clrscr
    call printname

    mov ax,0x4c00
    int 0x21