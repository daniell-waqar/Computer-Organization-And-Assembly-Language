[org 0x0100]

jmp start

data: dw  5, 10, 8, 6, 11, 20
less: dw 0
greater: dw 0

start:
    xor ax, ax    ; empty ax
    mov bx , 0    ;initialize base register 
    mov cx , 6    	; loading 6 to register cx

    loop1:
        mov ax , [data + bx]     ;moving value to ax
        add bx , 2            ;to access next value
        cmp ax , 12         ;compare current value of ax with 12
        ja else            ;jump to else    if the value of ax is greater than 12

            add [less] , ax  ;if value of ax is less than 12 add value into memory variable  "less"
            sub cx , 1         ;decreament cx register by one
            jnz loop1     ;if zero flag is not set jump to loop1

        

    else:
        add [greater],ax     ;if value of ax is not less  than 12 add value into memory variable  "greater"

    mov ax , 0x4c00
    int 0x21
