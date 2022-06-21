[org 0x0100]

jmp start 

data: dw 2,0,0,7,5,0
result: dw 0
result1: dw 0

start:

    ; Code for finding second maximum

    mov bx , 0

    l1;

        mov ax , [data + bx]           ;loading data into ax register
        cmp ax , 5                   ;compare current value of ax with 5
        jne skip

        mov dx,[data + bx]
        

        skip:

            add bx,2       ;increament bx by 2
            cmp bx, 12      ;compare value of bx with 12
            jnz l1    ;if zero flag is not set jump to l1


    
    ; Code for finding second minimum
    
    mov bx , 0

    l2:

        mov ax , [data + bx]    ;loading data into ax register
        cmp ax , 2        ;compare current value of ax with 2
        jne quit

            mov cx , [data + bx]
             

        quit:

            add bx,2       ;increament bx by 2
            cmp bx,12        ;compare value of bx with 12
            jnz l2      ;if zero flag is not set jump to l2

    

    mov [result],dx     ; store second maximum number  in memory variable result

    mov [result1],cx     ; store second minimum number  in memory variable result1



    mov ax , 0x4c00
    int 0x21
