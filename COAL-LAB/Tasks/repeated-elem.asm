;program to find most repeated element from Arrau

[org 0x0100]

jmp start

data: dw 1, 2, 4, 4, 8, 7, 8,6, 8, 3

start:

	mov ax, 0
	mov bx, 0
	mov cx, 9

outerloop:
	mov si, 2

	innerloop:
		mov ax, [data+bx]
		cmp ax, [data+bx+si]
		jne next
			mov dx, [data+bx+si]
			
			
	next:
	add si, 2
	cmp si, 18
	jne innerloop

	


l2:
	add bx, 2
	sub cx, 1
	jnz outerloop

mov ax, 0x4c00
int 0x21 

