

[org 0x0100]

jmp start

Array: dw 3,9,56,43,1,2,23
cEven: dw 0
cOdd: dw 0

even:						
	push bp
	mov bp, sp  

	sub sp, 2               ;a local variable to store count
	
	push ax				       
	push si                 
	push bx                 
	push cx  

	mov word[bp-2],0		; initializing local variable to 0
	
	mov bx, [bp+6]				
	mov si, [bp+4]

	mov cl, 2
	mov dx,0

	loop:
		mov ax, [bx+si]
		div cl
		cmp ah, 0
		jne skip
			add word[bp-2],1	; adding 1 to count

		skip:
		sub si,2
		cmp si,-2
		jnz loop

	mov dx,[bp-2]			; storing value of count in dx
	
	pop cx					
	pop bx                  
	pop si               
	pop ax
	mov sp, bp             
	pop bp

	ret 

odd:
	push bp
	mov bp, sp

	sub sp, 2             ; a local variable to store count

	push ax
	push si              
	push bx
	push cx

	mov word[bp-2],0      ; initialising local variable to 0

	mov bx, [bp+6]		  
	mov si, [bp+4]

	mov cl, 2
	mov dx,0

	loop1:
		mov ax, [bx+si]
		div cl
		cmp ah, 0
		jz skip1
			add word[bp-2],1   ; adding 1 to count	
		skip1:
		sub si,2
		cmp si, -2
		jnz loop1

	mov dx,[bp-2]

	pop cx
	pop bx
	pop si
	pop ax
	mov sp, bp
	pop bp

	ret 4                ; ret 4 will pop IP and take 4 byte jump
					
start:
	mov ax,Array
	mov si,12           

	push ax
	push si

	call even
	mov [cEven],dx 

	call odd
	mov [cOdd],dx	


mov ax, 0x4c00 
int 0x21 