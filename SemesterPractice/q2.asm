org 100h

jmp start

msg1 db 'Enter a Number :$'
msg2 db 'Entered Number is even :$'
msg3 db 'Entered Number is odd :$'
clr:
mov ah,06h
xor al,al
mov ch,0
mov cl,0
mov dh,24
mov dl,80
mov bh,00001001b
int 10h
ret


inputt:
mov dx,10
mov ah,2
int 21h

xor ax,ax
xor bx,bx
mov dx,msg1
mov ah,9h
int 21h
xor ax,ax
mov ah,1h
int 21h

;mov al,2
mov bl,al
mov cl,bl
comparee:
mov al,bl
mov bl,2

div bl

cmp ah,1
je odd

cmp ah,0
je even



ret

even:
mov dx,10
mov ah,2
int 21h

mov dx,msg2
mov ah,9h
int 21h

mov dl,cl
mov ah,2h
int 21h

jmp exit

odd:
mov dx,10
mov ah,2
int 21h

mov dx,msg3
mov ah,9h
int 21h

mov dl,cl
mov ah,2h
int 21h

jmp exit




start:
call clr

call inputt

exit:
mov ah,4ch
int 21h