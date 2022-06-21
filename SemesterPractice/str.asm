org 100h

data: db 'I Love Pakistan'
length: 

jmp start



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



start:
    call clearscreen
    call printstring

    mov ax , 0x4c00
    int 0x21
