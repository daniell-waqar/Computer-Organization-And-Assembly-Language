org 100h
jmp start

data: dw  3,8,12,3,8,15,3,2,2,11,7,3,10,5,9,6


length: dw 16

length1: dw 9

calculateDiagonalSum:
    push bp
    mov bp , sp
    sub sp , 2
    push ax
	push bx
	push cx
	push dx
	push si
	push di

    mov bx , [bp+6]
    mov di , [bp+4]

    

    sumOf4By4Array:
     mov si , 0
     mov cx , 0
     mov ax , [bx + si] 

    sumOfMainDiagonal:

     cmp si , 0
     je mainDiagonalSum 

     cmp si , 10
     je mainDiagonalSum
     cmp si , 20
     je mainDiagonalSum

     cmp  si , 30
     jnz noadd


     mainDiagonalSum:
        add cx , [bx + si] 

    noadd:
    add si , 2
    cmp si , 32
    jne sumOfMainDiagonal

mov [bp-2] , cx ;sum of main diagonal into local variable


; sum of secondary diagonal

mov si , 0
mov cx , 0
mov ax  , [bx + si]

sumOfSecondaryDiagonal:

    cmp si , 6
    je secondaryDiagonalSum

     cmp si , 12
    je secondaryDiagonalSum

      cmp si , 18
    je secondaryDiagonalSum

    
      cmp si , 24
    jnz noadd2


    

    secondaryDiagonalSum:
        add cx , [bx + si]
    noadd2:
    add si , 2
    cmp si , 32
    jne sumOfSecondaryDiagonal

add cx , [bp-2]
jmp exit

exit:
    pop di
    pop si
    pop dx
    pop cx
    pop bx 
    pop ax
    add sp  , 2
    pop bp
    ret 4


start:
    push data
    push length
    call calculateDiagonalSum

    mov ax , 0x4c00
    int 0x21
