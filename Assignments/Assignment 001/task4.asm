[org 0x0100]


start:
    mov ax , 0         ; empty ax
    mov bx , 200      ; loading 200 to register bx
    mov cx , 30       ; loading 30 to register cx

while:

    cmp ax , bx   ;compare current value of ax with bx
    jne if        ;if not equal jump to if


if:
    cmp ax , 100    ;compare current value of ax with 100
    ja elseif      jump to elseif if value of ax is greater than 100

    add ax , cx       ;adding cx to ax
    add ax , 10       ;again add 10 to ax register
    jmp while         ;jump to while

elseif:
    cmp ax , 100         ;compare current value of ax with 100
    je quit             jump to quit if value of ax is 100

    add ax , 10         ;add 10 to ax
    jmp while              ;jump to while


quit:

    mov ax , 0x4c00
    int 0x21
