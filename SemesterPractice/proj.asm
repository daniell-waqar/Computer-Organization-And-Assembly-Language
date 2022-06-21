[org 0x0100]
jmp start


string: dw "#"


welcome: dw "WELCOME TO ROYAL TAJ HOTEL PESHAWAR"
welcomelength: dw 35


menu1: dw "Press 1 for Fast Food Menu "
lengthmenu1: dw 28

menu2: dw "Press 2 for Desi Food Menu "
lengthmenu2: dw 28

menu3: dw "Press 3 for Dessert Menu "
lengthmenu3: dw 25

exitt: dw "Press 4 for exit"
exitlength: dw 16


clrscr:

	push dx
	push es
	push di


	mov dx, 0xb800
	mov es, dx
	mov di, 0


	s1:
		mov word [es:di], 0x0120
		add di, 2

		cmp di, 4000
		jne s1


	pop di
	pop es
	pop dx

	ret



screen:
	push bp
	mov bp, sp
	sub sp, 2
	
	push ax
	push bx
	push cx
	push dx
	push si
	push di


	mov ax, 0xb800
	mov es, ax
	mov di, 0


	mov si, [bp+4]
	mov al, [si]
	mov ah, 0x0E

	;Code for upper screen 
	
	l2:
		mov word[es:di], ax
		add di, 2

		cmp di,158
		jne l2

	;code for lower screen

	mov di, 3840

	l3:
		mov word[es:di], ax
		add di, 2

		cmp di,3998
		jne l3


	;code for left screen

	mov bx, 2
	mov cx, 1

	l4:
		
		mov ax, 80
		mul bx
		mul cx

		mov dh, 0x0E
		mov dl, [si]


		mov di, ax

		mov word[es:di],dx

		add cx, 1

		cmp cx, 28

		jne l4



	; code for ri8 screen



	mov bx, 2
	mov cx, 0
	mov word [bp-2],158

	l5:
		
		mov ax, 80
		mul cx

		add ax, word[bp-2]

		mul bx

		mov dh, 0x0E
		mov dl, [si]


		mov di, ax

		mov word[es:di],dx

		add cx, 1

		cmp cx, 28

		jne l5

	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	add sp, 2
	pop bp

	ret 2


mainmenu:
	push bx
	push cx
	push dx
	push si
	push di
	push es

	mov dx, 0xb800
	mov es, dx


	mov si, welcome
	mov di, 680
	mov cx, [welcomelength]

	m0:
		mov bh, 0x02
		mov bl, [si]

		mov word[es:di], bx

		add si,1

		add di, 2

		loop m0

	mov si, menu1
	mov di, 1168
	mov cx, [lengthmenu1]

	m1:
		mov bh, 0x0E
		mov bl, [si]

		mov word[es:di], bx

		add si,1

		add di, 2

		loop m1

		mov si, menu2
		mov di, 1488
		mov cx, [lengthmenu2]

	m2:
		mov bh, 0x0E
		mov bl, [si]

		mov word[es:di], bx

		add si,1

		add di, 2

		loop m2




		mov si, menu3
		mov di, 1808
		mov cx, [lengthmenu3]

	


	m3:
		mov bh, 0x0E
		mov bl, [si]

		mov word[es:di], bx

		add si,1

		add di, 2

		loop m3



		mov si, exitt
		mov di, 2128
		mov cx, [exitlength]
	m4:
		mov bh, 0x0E
		mov bl, [si]

		mov word[es:di], bx

		add si,1

		add di, 2

		loop m4



    exit:



	pop es
	pop di
	pop si
	pop dx
	pop cx
	pop bx

	ret




start:


	call clrscr
	push string
	call screen
	call mainmenu


	mov ax, 0x4c00
	int 0x21




