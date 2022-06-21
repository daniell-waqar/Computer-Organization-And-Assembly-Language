
100h

jmp start

data : dw 1,3,9,2,4,8,7,1,6,5
data2: dw 11,8,4,9,3

start:
    mov si , 0
    mov bx , [data + si]
  
sumFirstHalf:
    add si , 2
    add bx , [data + si]
    cmp si , 8
    jnz sumFirstHalf

mov si , 10
mov dx , [data + si]

sumSecondHalf:
    add si , 2
    add dx , [data + si]
    cmp si , 18
    jnz sumSecondHalf


 mov si , 0
 mov cx , [data2 + si]


 mini:
    add si , 2
    cmp cx , [data2 + si]
    
    jb noswap

    mov cx , [data2+si]

noswap:
    cmp si , 8
    jnz mini

cmp bx , dx
ja l1

    mov ax , 0
    mov ax , dx
    div cx
    jmp exit

l1:
    mov ax , 0
    mov ax , bx
    div cl

exit:
    mov ax, 0x4c00

	int 0x21 



