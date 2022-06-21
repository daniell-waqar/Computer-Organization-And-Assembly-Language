[org 0x0100]

jmp start

GCD:
push bp
mov bp, sp
push cx
push dx

mov cx, [bp+6]  
mov dx, [bp+4] 
cmp dx, 0  
je if
cmp dx, cx 
ja elif

else:            
sub cx, dx 
push word [bp+6]
push word [bp+4]
call GCD
pop dx
pop cx
pop bp
ret 4

elif:
push word [bp+6]
push word [bp+4]
call GCD
pop dx
pop cx
pop bp
ret 4

if:
mov ax, cx 
pop dx
pop cx
pop bp
ret 4

start:
push 20
push 15
call GCD
mov ax, 0x4c00
int 0x21