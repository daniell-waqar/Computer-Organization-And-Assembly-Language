org 100h

minimum:

mov si, 0

	mov cx, [data2+si]

	mini:
		add si, 2

		cmp [data2+si], cx

		ja noswap

		mov cx, [data2+si]

		noswap:

			cmp si, 8
            jne mini
    

     mov ah , 4ch                  
    int 21h


data2: dw 11,8,4,9,3
