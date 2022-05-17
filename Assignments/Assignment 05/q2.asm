

[org 0x0100]

jmp start

Array: dw 47,72,31

findMax:                
	
	push bp
	mov bp,sp
	
	sub sp,2			   ; local variable to store the number
	
	push ax
	push bx                
	push cx
	push si
	
	mov word[bp-2],0       ; initializing local variable to 0
	
	mov bx,[bp+6]         
	mov si,0
	mov cx,10
	mov dx,0

	loop:
		xor ax,ax
		xor dx, dx
		mov ax,[bx+si]
		div cx
		add ax,dx
		mov dx,[bx+si]
		cmp ax,[bp-2]
		jbe skip
			mov [bp-2],dx 
		
		skip:
		add si,2
		cmp si,[bp+4]     
		jne loop

		mov dx,[bp-2]	  
		
		pop si
		pop cx
		pop bx
		pop ax
		mov sp,bp
		pop bp
		
		ret 4         

start:
	mov ax,Array
	mov bx,4

	push ax
	push bx

	call findMax		


mov ax, 0x4c00 
int 0x21 