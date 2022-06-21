[org 0x0100]

jmp start       

data: dw 8,2,5,3,2,1


start: 
    mov  cx, 6                       ; make 4 passes, has to be outside the loop! 

    outerloop: 
        mov  bx, 0    
        
        innerloop: 
            mov  ax, [data + bx]
            cmp ax , [data + bx + 2]
            je noswap

            mov dx , [data +bx +2]
            cmp  dx ,2
            je noswap
            
            cmp  ax, [data + bx + 2]    ; why did we move the value to AX? 
            jbe  noswap                 ; if we don't have to swap, we just jump over the swap thing 
                                        ; think of this as the "if"

                ; the swap potion 
                mov  dx, [data + bx + 2]
                mov  [data + bx + 2], ax    ; again with the AX? 
                mov  [data + bx], dx

            noswap:
            add  bx, 2
            cmp  bx, 10
            jne  innerloop

        ; check outer loop termination 
        sub cx, 1 
        jnz outerloop 


    ; exit system call 
    mov  ax, 0x4c00
    int  0x21



