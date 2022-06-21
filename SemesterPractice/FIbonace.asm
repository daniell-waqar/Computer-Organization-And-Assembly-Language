[org 0x0100]

jmp start

data:dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

fib:
    push bp
    mov bp , sp
    push dx

    mov dx , [bp+4]

    cmp dx , 0
    je zero

    cmp dx , 1
    je zeroOne


    cmp di , dx
    je exit

    cmp di , 2
    je l1


zero:
    mov word[bx + si], 0
    jmp exit

zeroOne:
    mov word[bx+si] , 0
    mov word[bx+si] , 1
    jmp exit


	mov word[bx+0], 0
	mov word[bx+2], 1

	l1:


		add di,1
		mov ax, [bx+si-2]
		mov cx, [bx+si]

		add ax, cx

		add si, 2


		mov [bx+si], ax

		cmp di , dx

		je exit

		push word[bp+4]

		call Fib


		pop dx
		pop bp

		ret 2


start:
    push 5
    mov bx , data
    mov ax , 0
    mov cx , 0
    mov si , 2
    mov di , 2

    call fib
    


	mov ax, 0x4c00
	int 0x21
	