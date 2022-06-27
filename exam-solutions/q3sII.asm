[org 0x0100]
jmp start

msg1: db "this",0

clrscr:

push ax
push di
push es

mov ax, 0xb800
mov es,ax
mov cx, 2000
mov di,0

mov ax, 0x0720

cld 
rep stosw




pop es
pop di
pop ax
ret


findLen1: ;without repne scasb
push bp
mov bp,sp
; push ax ;dont push pop ax as we store return value in ax
push bx
push cx
push dx
push es
push di

    mov ax,[bp+6] ;moving data segment into es
    mov es,ax ;same stuff
    mov di,[bp+4] ;moving offset of the message from where data segment start to di
    ;above can be simply done with les di,[bp+4] directly

    mov ax, 0

    mov cx,0

    nextp:

    cmp byte[es:di],al
    je exit
        inc cx
        inc di
        jmp nextp
    exit:

    ; dec cx ;because the 0 is also counted

    mov ax,cx ;return value stored in ax  

    
    




pop di
pop es
pop dx
pop cx
pop bx
; pop ax ;dont push pop  ax as we store return value in ax
mov sp,bp
pop bp
ret 4 ;because 2 parameters were pushed and each parameter 1 word = 2 bytes so 2x2 = 4





findLen2: ;method 2 using repne scasb
push bp ;necessary if you pass parameters
mov bp,sp ;necessary if you pass parameters
push es
push di

; push ax
push dx
push cx

    les di,[bp+4] ; es = bp + 6 and di = bp + 4

    mov ax,0
    mov cx,0xffff ;we did this because repne only decrements

    repne scasb ;repne decrements cs and scasb compares es:di with ax 
                ;and increments di by 1 in case of scasb
    mov ax,0xffff
    sub ax,cx

    dec ax ;because it counts the 0 too
    ;ax has the length of string as return value


pop cx
pop dx
; pop ax
pop di
pop es
mov sp,bp
pop bp

ret 4



showLen:
push bp
mov bp,sp
push ax
push bx
push cx
push dx
push es
push di

    

    ; mov ax,[bp + 4] ;pushing length which we need to print

    mov bx,10
    
    
    nextDig:
    mov dx,0 ;this is very important always when using div
    div bx  ;quotient = ax, remainder = dx

    mov dh,0x07 ;white foreground
    add dl,0x30 ;converting number to its string form
    push dx ; right most digit extracted
    inc cx ;count digits will be used when printing


    cmp ax,0
    jnz nextDig

    ;cx has the count for number of digits


    mov ax,0xb800
    mov es,ax
    mov di,0

    next:
        pop dx
        mov word[es:di],dx
    add di,2
    dec cx
    jnz next



    




pop di
pop es
pop dx
pop cx
pop bx
pop ax
pop bp

ret 

start:
call clrscr

push ds
mov ax,msg1
push ax
; call findLen1
call findLen2

; push ax ;length of string
call showLen ;to print length of string


mov ah,0x1
int 0x21

mov ax, 0x4c00
int 0x21