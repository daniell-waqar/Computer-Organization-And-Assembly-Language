[org 0x0100]

data: dw 0
mov ax , 10
mov  bx , 5
mul bx

;mul [data]



mov ax , 0x4c00
int 0x21