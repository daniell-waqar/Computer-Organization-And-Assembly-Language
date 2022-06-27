[org 0x0100]

;problem 2 from khurammi lab part 1

jmp start

num: dw 11
odd_b:db 0 ;if number is odd it is set 1
even:db 0 ;if number is even it is set 1
prime: db 0 ;sets prime number to 1 if number is prime
; record: dw 0

prime_num:

push ax
push bx
push cx
push dx

    

    

    mov cx,2
    mov ax,word[num]
    outerloop:
        cmp cx,word[num]
        je is_prime
        
    
        mov dx,0
        mov bx,cx
        div bx
        cmp dx,0
        je break
            
            ; jmp break


    next:
    mov ax,word[num]
    inc cx
    cmp cx,ax
    jnz outerloop
    is_prime:
    mov byte[prime],1


    break:


pop dx
pop cx
pop bx
pop ax

    

    

    


ret

odd_even:
push ax
mov ax,word[num]


shr ax,1
jc odd
    mov byte[even],1 ;set even
    jmp return
odd:
    mov byte[odd_b],1

return:
pop ax
ret

start:




call odd_even
call prime_num






mov ax,0x4c00
int 0x21