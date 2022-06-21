[org 0x0100]

mov ax , 0
mov bx , 0

outerloop:
add ax , [num1+ bx]
add bx , 2
cmp bx , 20
jne outerloop

mov [result] , ax
mov ax , 0x4c00

int 0x21

num1: dw 5,10,15 
result: dw 0


