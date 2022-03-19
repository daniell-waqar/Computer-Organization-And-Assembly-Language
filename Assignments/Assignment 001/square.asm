; programm to find square of 20 using direct addressing

[org 0x0100]

jmp start

data: dw 20
result: dw 0

start:
    mov ax,0        ; empty ax
	mov cx, 20		; loading 20 to register cx
    l1:
        add ax,[data]   ;adding value to ax
        sub cx,1       ; decreament cx by one
        jnz l1      ;if zero flag is not set jump to l1

        mov [result],ax   ; store final result in memory
    mov ax,0x4c00
    int 0x21



