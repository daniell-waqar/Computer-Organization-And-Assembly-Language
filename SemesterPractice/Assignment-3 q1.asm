[org 0x0100]

jmp start

ARRAY : dw 1,2,3,4,5,6,7,8,9
size : dw 9

function:

	xor ax, ax
	xor bx, bx
	xor cx, cx
	xor dx, dx
	xor si, si
	xor di, di

	push bp
	mov bp, sp
	sub sp,4

	mov bx, [bp+6]
	mov di,[bp+4]


; Main diagonal Sum

	mov si, 0
	mov cx, 0
	mov ax, [bx+si]

			
	l1:

		cmp si,0
		je l2


		cmp si,8
		je l2
				
		cmp si,16
		jne nothing

				

		l2:
			add cx, [bx+si]

		nothing:
			add si, 2

			cmp si, 18
			jne l1


		mov [bp-2], cx	

			



		;Calculating the sum of scondary diagonal

			mov si, 0
			mov cx, 0
			mov ax, [bx+si]


			l3:

			cmp si,4
			je l4
			cmp si,8
			je l4
			cmp si,12
			jne nothing2

				
			l4:

				add cx, [bx+si]



			nothing2:
				add si, 2

				cmp si, 18
				jne l3




		add  cx,[bp-2] 


			add sp, 4
			pop bp

			ret 4



start:
	push word ARRAY
	push word length
	call function

	mov ax, 0x4c00
	int 0x21