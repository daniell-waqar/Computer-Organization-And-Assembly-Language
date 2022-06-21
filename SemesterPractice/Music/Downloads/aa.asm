

segment .data
   option db   '0'
   continue db '0'

   msg4 db "Do you want to continue [y/n]",0xA,0x0
   len4 equ $- msg4

   msg3 db "Please enter a given option : ", 0xA, "1. Sum  2. Subtraction  3. Multiplication  4.  Division  5. Exit",0xA
   len3 equ $- msg3

   msg1 db "Enter a digit ", 0xA,0x0
   len1 equ $- msg1 

   msg2 db "Please enter a second digit", 0xA,0x0 
   len2 equ $- msg2   

   Msg5 db "The Result is: "
   len5 equ $- Msg5

segment .bss
  
   num1 resb 2 
   num2 resb 2
   res resb 1 
   sign resb 1

section	.text
   global _start    ;must be declared for using gcc
	
_start:             ;tell linker entry point

start:
   mov eax, 4         
   mov ebx, 1         
   mov ecx, msg1         
   mov edx, len1 
   int 0x80                

   mov eax, 3 
   mov ebx, 0  
   mov ecx, num1 
   mov edx, 2
   int 0x80            

   mov eax, 4        
   mov ebx, 1         
   mov ecx, msg2          
   mov edx, len2         
   int 0x80

   mov eax, 3  
   mov ebx, 0  
   mov ecx, num2 
   mov edx, 2
   int 0x80 

   mov eax, 4         
   mov ebx, 1         
   mov ecx, msg3         
   mov edx, len3 
   int 0x80

   mov eax, 3 
   mov ebx, 0  
   mov ecx, option 
   mov edx, 2
   int 0x80

   mov ax,[option]
   cmp ax, 1
   je Sum
   cmp ax, 2
   je Subtract
   cmp ax, 3
   je Multiplication
   cmp ax, 4
   je Division
   cmp ax, 5
   je exit


   Sum:
    ; moving the first number to eax register and second number to ebx
   ; and subtracting ascii '0' to convert it into a decimal number
	
   mov eax, [num1]
   sub eax, '0'
	
   mov ebx, [num2]
   sub ebx, '0'

   ; add eax and ebx
   add eax, ebx
   ; add '0' to to convert the sum from decimal to ASCII
   add eax, '0'

   ; storing the sum in memory location res
   mov [res], eax
   jmp Result

   Subtract:
   
   mov eax, [num1]
   sub eax, '0'
	
   mov ebx, [num2]
   sub ebx, '0'

   ; add eax and ebx
   sub eax, ebx
   ; add '0' to to convert the sum from decimal to ASCII
   add eax, '0'

   ; storing the sum in memory location res
   mov [res], eax
   jmp Check

   Check:
   cmp eax, 0
	jg Result
	jl negative
   negative:
	neg eax
	mov bl, '-'
	mov [sign], bl
	jmp Result

   Multiplication:
   
   mov	eax,[num1]
   sub   eax, '0'
	
   mov 	ebx, [num2]
   sub   ebx, '0'
   mul 	ebx
   add	eax, '0'
	
   mov 	[res], eax
   jmp Result

   Division:
   
   mov	eax,[num1]
   sub   eax, '0'
	
   mov 	bx, [num2]
   sub   bx, '0'
   div 	bx
   add	eax, '0'
	
   mov 	[res], eax
   jmp Result


Result:

   mov eax, 4         
   mov ebx, 1         
   mov ecx, Msg5          
   mov edx, len5         
   int 0x80
Print:
   ; print the Result
   mov eax, 4        
   mov ebx, 1
   mov ecx, res         
   mov edx, 2        
   int 0x80
   ;Continue
   mov eax, 4         
   mov ebx, 1         
   mov ecx, msg4         
   mov edx, len4 
   int 0x80

   mov eax, 3 
   mov ebx, 0  
   mov ecx, continue 
   mov edx, 2
   int 0x80

   mov al, [continue]
   cmp al, 'y'
   je start 

exit:    
   
   mov eax, 1  
   xor ebx, ebx 
   int 0x80