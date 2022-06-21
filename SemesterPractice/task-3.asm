[org 0x0100]

jmp start

array: dw 1,2,3,4,5,6


start: 
    mov bx , 0       ; empty bx
    xor ax , ax          ; empty ax
    mov si , 10        ; loading 10 to register si

loop1:
    mov ax , [array + bx]   ;moving first value to ax register
    mov dx , [array + si]     ;moving last value to dx register
    
    mov [array+si] , ax        ;exchanging values of ax and dx
    mov [array + bx] ,dx

    sub si , 2      ;decreament si by 2
    add bx , 2       ;increament bx by 2
    cmp bx , 6       ;compare value of bx with 6 
    jnz loop1        ;if zero flag is not set jump to loop1

mov ax , 0x4c00
int 0x21


