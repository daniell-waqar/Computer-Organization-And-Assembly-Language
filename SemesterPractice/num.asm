[org 0x0100]

jmp start

clrscr:
    push bp
    push ax
    push di
    push es

    mov ax,0xb800
    mov es,ax

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

; point es to video base
printnum: push bp
 mov bp, sp
 push es
 push ax
 push bx
 push cx
 push dx
 push di
 mov ax, 0xb800
 mov es, ax 
 mov ax, [bp+4]
 mov bx, 10 ; use base 10 for division
 mov cx, 0 
nextdigit: mov dx, 0 
 div bx ; divide by 10
 add dl, 0x30 
 push dx 
 inc cx 
 cmp ax, 0 
 jnz nextdigit 
 mov di, 0 

nextpos: pop dx 
 mov dh, 0x07 
 mov [es:di], dx
 add di, 2 
 loop nextpos 
 pop di
 pop dx
 pop cx
 pop bx
 pop ax
 pop es
 pop bp
 ret 2
start: call clrscr
 mov ax, 4529
 push ax 
 call printnum 
 mov ax, 0x4c00 
 int 0x21