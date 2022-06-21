[org 0x100]


mov cx , 12
outerloop:
	mov ax , 260
outerloop1:
		mov bx , 260
		innerloop:
			sub bx , 1
			jnz innerloop
	sub ax , 1
	jnz outerloop1
	sub cx , 1
	
	jnz outerloop

mov ax , 0x4c00
int 0x21