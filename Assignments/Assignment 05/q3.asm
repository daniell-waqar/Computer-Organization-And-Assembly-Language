
[org 0x0100]

jmp start

num1: dw 12
num2: dw 12

add2:						
	push bp
	mov bp,sp

	sub sp,2				; making local variable to store sum

	push ax
	push bx                 
	push cx

	mov word[bp-2],0        ; initializing local variable to 0

	mov ax,[bp+8]
	mov bx,[bp+6]		
	mov cx,[bp+4]

	add word[bp-2],ax
	add word[bp-2],bx      ; adding all three arguments
	add word[bp-2],cx

	mov dx,[bp-2]		   ; storing result in dx 

	pop cx
	pop bx
	pop ax                 
	mov sp,bp
	pop bp

	ret 6				 


add1:                      ;subroutine have 2 parameters
	push bp
	mov bp,sp

	sub sp,2			   ; local variable of add1

	push ax
	push bx				 
	push cx

	mov word[bp-2],0	   ; initializing local variable\ to 0

	mov ax,[bp+6]        
	mov bx,[bp+4]

	add word[bp-2],ax	  
	add word[bp-2],bx

	mov cx,[bp-2]         

	push ax
	push bx				   ; passing arguments for add2
	push cx

	call add2			   ; after call dx will now contain the sum of add2(cx,a,b)


	pop cx
	pop bx
	pop ax				
	mov sp, bp
	pop bp

	ret 4                 

start:
	mov ax,[num1]		  
	mov bx,[num2]

	push ax              
	push bx

	call add1
   

mov ax, 0x4c00 
int 0x21 