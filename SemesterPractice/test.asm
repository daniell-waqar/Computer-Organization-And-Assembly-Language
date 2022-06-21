

calculateDiagonalSum:

	push bp
	mov bp, sp

	sub sp,4

	; local variables [Main diagonal Sum = bp-2] and [Total sum = bp-4]

	push ax
	push bx
	push cx
	push dx
	push si
	push di


	;Storing the adress of first element of an array which was passed through parameter in this case which is  address of "3"
	
	mov bx, [bp+6]


	;Storing the length of an array which was previously passed throug parameter and it's the logic of program.
	
	mov di,[bp+4]

	cmp word [di] , 9
	je sumOf3By3Array




	
	sumOf4By4Array:


			;Calculating the sum of main diagonal

			mov si, 0
			mov cx, 0
			mov ax, [bx+si]

			

			sumOfMainDiagonal:

			
				cmp si,0
				je mainDiagonalSum


				cmp si,10
				je mainDiagonalSum
				
				cmp si,20
				je mainDiagonalSum

				cmp si,30
				jne noAdd

				mainDiagonalSum:

					add cx, [bx+si]



				noAdd:
					add si, 2

					cmp si, 32
					jne sumOfMainDiagonal



			mov [bp-2], cx	 ;Storing the sum of main diagonal in the local variable

			



		;Calculating the sum of secondary  diagonal of Array 3 by 3

			mov si, 0
			mov cx, 0
			mov ax, [bx+si]


			sumOfSecondaryDiagonal:

				cmp si,6
				je secondaryDiagonalSum


				cmp si,12
				je secondaryDiagonalSum
				
				cmp si,18
				je secondaryDiagonalSum

				cmp si,24
				jne noAdd2

				secondaryDiagonalSum:

					add cx, [bx+si]



				noAdd2:
					add si, 2

					cmp si, 32
					jne sumOfSecondaryDiagonal






		add  cx,[bp-2]     ;storing the total sum of 4 by 4 2D-Array in cx register.... 


	jmp exit


