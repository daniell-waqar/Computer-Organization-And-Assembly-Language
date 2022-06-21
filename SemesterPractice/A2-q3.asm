[org 0x0100]

jmp start





start:
    var1: dw 1
    var2: dw 0
    var3: dw 7

    cmp [N], 0
    je end

    ; c = a + b
		mov [var3], var1	; c = a
		add [var3], var2	; c += b

		mov [var1], var2	; a = b
		mov [var2], var3	; b = c

		dec 		; iteration --

end:
    mov ax,0x4c00
    int 0x21
    