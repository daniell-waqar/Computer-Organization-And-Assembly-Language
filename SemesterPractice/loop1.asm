;program to add numbers using loop (Lable)  using three registers


[org 0x0100]

mov ax , 0          ;reset the accumulator
mov cx , 10         ;set the iterator count
mov bx , 0           ;set the base

outerloop:
    add ax , [num1 + bx]    
    add bx , 2
    sub cx , 1
    jnz outerloop
mov [result] , ax

mov ax , 0x4c00  ;terminate the program
int 0x21


num1: dw 10,20,30,40,50,10,20,30,40,50
result: dw 0