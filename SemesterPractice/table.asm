org 100h

jmp start

 msgchr db 'Enter a number:$'

num: dw 0
res: dw 0

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


scanstring:

    ;Take input

    mov ax , 0
    mov bx , 0
l1:
    mov cx , 10
    mov dx , [res+bx]

   call printf
   add bx , 2
   dec cx 
   loop l1

ret
tab:
    mov cx , 0x0A
    mov bx , 0x01
    mov ax , 0x02
    mov di , 0
label:
    mul bx
    mov [res] , ax
    add di , 2
    mov ah , 0x02
    loop label

    ret 


start:
    mov dx , msgchr
    call printf
    call scanchr
  
    call tab
    push word[res]
    call scanstring


    mov ah , 4ch                   ;end of program
    int 21h
