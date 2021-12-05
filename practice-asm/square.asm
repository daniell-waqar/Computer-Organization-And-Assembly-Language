; programm to find square of 20 using direct addressing

[org 0x0100]

jmp start

num: dw 20
result dw 0

start:
    mov ax,0        ; empty ax
	mov cx, 20		; loading 20 to register cx
    loop:
        add ax,[num]   ;adding value of num to ax
        sub cx,1       ; decreament cx by one
        jnz loop       ;if zero flag is not set jump to loop

        mov [result],ax   ; store final result in result
    mov ax,0x4c00
    int 0x21



