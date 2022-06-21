org 100h

jmp start

section.data
    msgchr db 'Enter a character (A-Z or a-z):$'
    msgstring db 10, 'The lower case is: $' , 10
    msgstring2 db 10, 'The Uper case is: $'
    num dw 0
    res dw 0

section.code
printf:
    mov ah ,9
    int 21h
 
ret

scanchr:
    
    ;Take input   character
    mov ah ,7
    int 21h
    cmp al , 41
    jae label
    mov byte[num] , al   ;hexa value will be stored in al automatically must stored in memory for use        
    mov byte[num+1] ,'$'
  
   
    mov dx , num           ;print the Entered character
    mov ah ,9
    int 21h

label:
    mov byte[res] , al
    mov byte[res + 1] , '$'
     mov ax , 0
    mov dx , res
    mov ah ,9
    int 21h


    ret

scanstring:

    ;Take input
    mov dx , answer
    mov ah , 0x0a
    int 21h               ;input character will be stored in al
    xor bx , bx
    mov bl, [answer + 1]        ; buffer size
    mov word[answer + bx + 2], '$'
    mov ax , 0

    mov dx, msgstring2

    call printf

    
    mov dx , answer+2

    mov ah ,9
    int 21h


ret


start:


    mov dx , msgchr
    call printf
    call scanchr

    mov dx , msgstring
    call printf
    call scanstring

    mov ah , 4ch                   ;end of program
    int 21h

answer: db 20, 0    ; 0 is for used len in buffer
resb 20

