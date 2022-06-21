;program to add numbers using loop (Lable)  using two registers

[org 0x0100]

jmp start 

num1: dw 10,20,30,40,50,10,20,30,40,50
result: dw 0

start:
mov ax , 0          ;reset the accumulator
mov bx , 0           ;set the base

outerloop:
    add ax , [num1 + bx]    
    add bx , 2
    cmp bx , 20   ;sets ZF = 1 when they are equal,
    jne outerloop  ;not set ZF = 0 if they are equal

    mov ax , 0x4c00      ;just move the value 0x4c00 (for exit)
    int 0x21    ;this line send interupt to os and os will check ax register either it has exit /read/write
