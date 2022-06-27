[org 0x0100]
jmp start

data: db 1,2,3,4,5,6,7,8,9,10
todd: dw 0
teven: dw 0

start:

    mov ax, 0
    mov bx,0
    mov dx,0

    oloop:
        mov ax,0
        mov al,byte[data + bx]
        mov dx,ax ;store number in dx 
        shr ax,1 ;if carry generated then number is odd if carry not generated then number even
        jc odd
            add word[teven],dx
            jmp next



        odd:
            add word[todd],dx
            
        next:
        inc bx
        cmp bx,10
        jnz oloop



mov ax, 0x4c00
int 0x21