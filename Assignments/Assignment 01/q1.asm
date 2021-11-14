[org 0x0100]

	
	mov ax, 0
	mov bx, 0
	
	mov al, [data] ; moving 53 number in al

	mov cx, 0   ; This cx will be used for the loop until the number will reversed

	label: 
		shr	al , 1  ; We are shifting this al right because the least significant bit will be stored in the carry
		rcl bl , 1  ; By using rcl we will get the number reversed

		add cx, 1

		cmp cx, 8

		jne label ; 




mov ax, 0x4c00

int 0x21

data : dw 53