
[org 0x0100]

jmp start

data:
name : db "Waqar"
length:   dw $ -name



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
     
   


    printhorizontal:
        push bp
        mov bp,sp
        

        push ax
        push bx
        push cx
        push dx
        push di
        push si
        
        mov di, [bp + 08]      ;position
        loop1:
        mov ax, 0xb800
        mov es, ax
         
 
        mov si, [bp+ 06]        ;text
        mov cx, [bp + 04]        ;length
        mov bx, 0
        mov ah, 0x0E      ;text color
        loop3:
            mov al, [si + bx]
            mov [es:di], ax
            add di, 2   ; next box
            inc bx      ; next character
            dec cx      ; 
            cmp di,[bp + 10]
            jnz skip
            jmp exit1
            skip:
            
            cmp cx, 0
            jnz loop3
        jmp loop1

        exit1:

        
        pop si
        pop di
        pop dx
        pop cx
        pop bx
        pop ax
        pop bp

    ret 08



     printvertical:  ; 160 -3840
        push bp
        mov bp,sp
        

        push ax
        push bx
        push cx
        push dx
        push di
        push si
        
        mov di, 160      ;position
        loop5:
        mov ax, 0xb800
        mov es, ax
           
    
        mov si, [bp+ 06]        ;text
        mov cx, [bp + 04]        ;length
        mov bx, 0
        mov ah, 0xF0       ;text color
        loop6:
            mov al, [si + bx]
            mov [es:di], ax
            add di, 158   ; next box
            mov al, [si + bx]
            mov [es:di], ax
            add di,2
            inc bx      ; next character
            dec cx      ; 
            cmp di,3840
            jnz skip1
            jmp exit12
            skip1:
            
            cmp cx, 0
            jnz loop6
        jmp loop5

        exit12:

        
        pop si
        pop di
        pop dx
        pop cx
        pop bx
        pop ax
        pop bp

    ret 04
        
    


;MAIN CODE

start: 



call clearscreen
xor ax,ax
xor bx,bx
mov ax , name 
mov bx , [length]
mov cx, 0
mov dx, 160


push dx    ; bp +10
push cx    ; bp + 8
push ax    ; bp + 6
push bx    ; bp + 4

call printhorizontal

xor ax,ax
xor bx,bx
mov ax , name 
mov bx , [length]
mov cx, 3840
mov dx, 4000


push dx    ; bp +10
push cx    ; bp + 8
push ax    ; bp + 6
push bx    ; bp + 4

call printhorizontal

xor ax,ax
xor bx,bx
mov ax , name 
mov bx , [length]


push ax    ; bp + 6
push bx    ; bp + 4

call printvertical


      mov  ah, 0x1        
          int 0x21 

mov ax , 0x4c00
int 0x21


push ax 
push bx 
push cx 

