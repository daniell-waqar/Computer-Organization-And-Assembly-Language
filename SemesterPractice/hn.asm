org 0x0100]

jmp start 

data: dw 2,0,0,7,5,0
result: dw 0

start:

    mov ax, [data]       ;adding first value to  ax register
    mov bx, 2             ; loading 2 to register bx    
;code for maximum

    maximum:

        cmp [data + bx ],ax     ;compare next value with first one
        jbe notmaximum      ;if next value is below or equal jump to notmaximum

        mov ax,[data + bx]         ;otherwise move maximum value to ax register

        notmaximum:

            add bx,2       ;increament bx by 2
            cmp bx, 12      ;compare value of bx with 12
            jnz maximum    ;if zero flag is not set jump to maximum

    mov [result],ax     ; store maximum number in memory variable

    mov ax , 0x4c00
    int 0x21