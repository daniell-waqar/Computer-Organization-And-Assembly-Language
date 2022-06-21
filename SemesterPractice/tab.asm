org 100h

jmp start


section.data
    msgchr db 'Enter a number:$'
    msgstring db 10, 'Entered number: $' , 10
    num dw 0



section.code
printf:
    mov ah ,9
    int 21h

ret



scanchr:
    
    ;Take input   character
    mov ah ,7
    int 21h

    mov byte[num] , al   ;hexa value will be stored in al automatically must stored in memory for use        
    mov byte[num+1] ,'$' 
   
    mov dx , num           ;print the Entered character
    mov ah ,9
    int 21h

    ret

tab:
    mov cx , 0x0A
    mov bx , 0x01
    mov ax , 0x02
    mov di , 0
label:
    mul bx
    inc bx
    mov [di] , ax
    add di , 2
    mov ah , 0x02
    loop label






start:

   
    call tab



    mov ah , 4ch                   ;end of program
    int 21h
