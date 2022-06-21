org 0x0100

jmp start

multiplicand: dd 0x3102E   ;200750
multiplier: db 0xc4 ; 196
result:   dw 0

start:
    mov cl , 8
    mov dl , [multiplier]

    checkbit:
        shr dl , 1
        jnc skip
            mov al , [multiplicand]
            add byte[result] , al
            mov al , [multiplicand + 1]
            add byte[result + 1] , al
            mov al , [multiplicand + 2]
            adc byte[result + 2] , al
            mov al , [multiplicand + 3]
            adc byte[result + 3] , al

    skip:
    shl byte[multiplicand] , 1
    rcl byte[multiplicand + 1] , 1
    rcl byte[multiplicand + 2] , 1
    rcl byte[multiplicand + 3] , 1

    dec cl
    jnz checkbit


    mov ax , 0x4c00
    int 0x21