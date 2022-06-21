
org 100h

jmp start
 
data2: dw 11,8,4,9,3

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

section.data
    msgchr db 'Enter a num:$'
    num: dw 0
    num1: dw 0
     num2: dw 0
      num3:dw 0
       num4: dw 0
       
  

section.code
printf:
    mov ah ,9
    int 21h

ret

scandigit:
    
    ;Take input   character
    mov ah ,7
    int 21h
   
    mov byte[num] , al   ;hexa value will be stored in al automatically must stored in memory for use        
    mov byte[num+1] ,'$'
  
   
    mov dx , num           ;print the Entered character
    mov ah ,9
    int 21h

 


scandigit1:
    
    ;Take input   character
    mov ah ,7
    int 21h
   
    mov byte[num1] , al   ;hexa value will be stored in al automatically must stored in memory for use        
    mov byte[num+1] ,'$'
  
   
    mov dx , num1          ;print the Entered character
    mov ah ,9
    int 21h



scandigit2:
    
    ;Take input   character
    mov ah ,7
    int 21h
   
    mov byte[num2] , al   ;hexa value will be stored in al automatically must stored in memory for use        
    mov byte[num2+1] ,'$'
  
   
    mov dx , num2           ;print the Entered character
    mov ah ,9
    int 21h


scandigit3:
    
    ;Take input   character
    mov ah ,7
    int 21h
   
    mov byte[num3] , al   ;hexa value will be stored in al automatically must stored in memory for use        
    mov byte[num3+1] ,'$'
  
   
    mov dx , num3           ;print the Entered character
    mov ah ,9
    int 21h




scandigit4:
    
    ;Take input   character
    mov ah ,7
    int 21h
   
    mov byte[num4] , al   ;hexa value will be stored in al automatically must stored in memory for use        
    mov byte[num4+1] ,'$'
  
   
    mov dx , num4           ;print the Entered character
    mov ah ,9
    int 21h

    ret


mov si, 0

	mov cx, [data2+si]

	mini:
		add si, 2

		cmp [data2+si], cx

		ja noswap

		mov cx, [data2+si]

		noswap:

			cmp si, 8
			jne mini
start:
    call clearscreen
    call printf
    call scandigit