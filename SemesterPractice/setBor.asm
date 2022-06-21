org 100h

jmp main

data: db 'Assembly Language Course, FAST University Peshawar Campus'
Lendata: 
data1: db 'I Love Pakistan'
Lendata1:

 

clearscreen:

    mov ah ,06h
    mov al , 0
    mov ch , 0
    mov cl , 0
    mov dh , 24
    mov dl , 79
    mov bh , 07h
    int 10h 
    ret


Cursor1:

     mov dh , 1
     mov dl , 0
     mov bh , 0
     mov ah , 02h 
     int 10h 
     ret

Cursor2:

     mov dh , 24
     mov dl , 0
     mov bh , 0
     mov ah , 02h 
     int 10h 
     ret


Cursor:

     mov dh , 13
     mov dl , 35
     mov bh , 0
     mov ah , 02h 
     int 10h 
     ret

greenWhiteBox:

    mov ah ,06h
    mov al , 0
    mov ch , 8
    mov cl , 35
    mov dh , 17
    mov dl , 62
    mov bh , 20h
    int 10h



    mov ah ,06h
    mov al , 0
    mov ch , 8
    mov cl , 18
    mov dh , 17
    mov dl , 35
    mov bh , 70h
    int 10h 
   
    ret


setcorner:

    mov ah ,06h
    mov al , 0
    mov ch , 0
    mov cl , 0
    mov dh , 24
    mov dl , 0
    mov bh , 50h
    int 10h 

    mov ah ,06h
    xor al , al
    mov ch , 1
    mov cl , 79
    mov dh , 24
    mov dl , 79
    mov bh , 50h
    int 10h


    mov ah ,06h
    xor al , al
    mov ch , 0
    mov cl , 0
    mov dh , 0
    mov dl , 79
    mov bh , 50h
    int 10h 
   
    mov ah ,06h
    xor al , al
    mov ch , 24
    mov cl , 0
    mov dh , 24
    mov dl , 79
    mov bh , 50h
    int 10h 
  
    

printstring:
    mov cx , Lendata1 - data1
    mov al , 1
    mov bh , 0
    mov dh , 13
    mov dl , 38
    mov bl , 07h
    push cs 
    pop es
    mov bp , data1
    mov ah , 13h


    int 10h

    ret


printLovemsg:
    mov cx , Lendata - data
    mov al , 1
    mov bh , 0
    mov dh , 6
    mov dl , 14
    mov bl , 07h
    push cs 
    pop es
    mov bp , data
    mov ah , 13h
    int 10h

    ret

printchar:
    mov cx , 79
    mov bx , 57h
    mov ah , 09h
    mov al , 40h
    int 10h 
    ret

printchar1:
 
    mov cx , 79
    mov bx , 57h
    mov ah , 09h
    mov al , 40h
    int 10h 
  
    ret
    

main:

    call clearscreen

   
    call greenWhiteBox

    call setcorner

    call Cursor

    call printstring

    call printLovemsg

    call Cursor1

    call printchar

    call Cursor2

    call printchar1


    mov ax , 0x4c00
    int 0x21
