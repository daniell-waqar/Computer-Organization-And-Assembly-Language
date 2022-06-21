[org 0x0100]

jmp start

message:     db   'p20-0750'  
star: db       '*'
length:      dw   8

clearscreen:     
    push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 0

    nextloc:
        mov  word [es:di], 0x0720
        add  di, 2
        cmp  di, 4000
        jne  nextloc

    pop  di 
    pop  ax
    pop  es
    ret


setLowerHalf:

    mov ah ,06h
    xor al , al
    mov ch , 11
    mov cl , 0
    mov dh , 24
    mov dl , 79
    mov bh , 50h
    int 10h 
    ret


setCursor:
     
     mov dh , 2
     mov dl , 0
     mov bh , 0
     mov ah , 02h 
     int 10h 
     ret




printstar1:

      mov bx , 1
    mov cx, 5


    outer2:
        push cx
        mov cx , bx

        s1:
            mov dl,'*'
            mov ah,02
            int 21h
        loop s1
        mov dl,0Ah
        mov ah,02
        int 21h
        mov dl,0Dh
        mov ah,02
        int 21h

        inc bl 
        pop cx
    loop outer2
  


    mov cx,4

    outer1:
        push cx
        s:
            mov dl,'*'
            mov ah,02
            int 21h
        loop s
        mov dl,0Ah
        mov ah,02
        int 21h
        mov dl,0Dh
        mov ah,02
        int 21h
        pop cx
    loop outer1

  
      ret



printstring:
    push bp
    mov  bp, sp
    push es
    push ax
    push cx 
    push si 
    push di 

    mov ax, 0xb800 
    mov es, ax 
    mov di,  1830             


    mov si, [bp + 6]
    mov cx, [bp + 4]
    mov ah, 0x07

    nextchar: 
        mov al, [si]
        mov [es:di], ax 
        add di, 2 
        add si, 1   
        loop nextchar 


    pop di 
    pop si 
    pop cx 
    pop ax 
    pop es 
    pop bp 
    ret 4 



start: 
    call clearscreen 
    call setLowerHalf

    
    call setCursor

    mov ax, message 
    push ax 
    push word [length]

    call printstring 

    call printstar1


    mov ax, 0x4c00 
    int 0x21