org 100h

jmp start

clearscreen:

    mov ah ,06h
    xor al , al
    mov ch , 0
    mov cl , 0
    mov dh , 24
    mov dl , 79
    mov bh , 07h
    int 10h 
    ret

setCursor:
     ; mov dx , 0c23h
     mov dh , 13
     mov dl , 35
     mov bh , 0
     mov ah , 02h 
     int 10h 
     ret

setBox:

    mov ah ,06h
    xor al , al
    mov ch , 11
    mov cl , 30
    mov dh , 15
    mov dl , 45
    mov bh , 30h
    int 10h 
    ret


setBorl:

    mov ah ,06h
    xor al , al
    mov ch , 0
    mov cl , 0
    mov dh , 24
    mov dl , 0
    mov bh , 40h
    int 10h 
    ret

  
    
setBorr:

    mov ah ,06h
    xor al , al
    mov ch , 0
    mov cl , 79
    mov dh , 24
    mov dl , 79
    mov bh , 40h
    int 10h
    ret


setBortop: 

    mov ah ,06h
    xor al , al
    mov ch , 0
    mov cl , 0
    mov dh , 0
    mov dl , 79
    mov bh , 40h
    int 10h 
    ret
   

setBorbot
    mov ah ,06h
    xor al , al
    mov ch , 24
    mov cl , 0
    mov dh , 24
    mov dl , 79
    mov bh , 40h
    int 10h 
    ret

    




    


start:

    call clearscreen

    call setCursor

    call setBox

    call setBorl

    call setBorr

    call setBortop

    call setBorbot
  


    mov ax , 0x4c00
    int 0x21
