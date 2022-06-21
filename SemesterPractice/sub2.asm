org 0x0100

jmp start

data: dw 5,7,4,8
swapflag: db 0
swap:

    push ax
    ;push cx

    mov ax , [bx + si]
    xchg ax , [bx + si + 2]
    mov [bx + si] , ax


    dec cx

    pop ax 
    
    ret


bubblesort:
    push ax
    push cx         ;three new pushes
    push si
    dec cx
    shl cx , 1
    
      mainloop:
        mov si, 0
        mov byte[swapflag] , 0

        innerloop:
            mov ax , [bx + si]       
            cmp ax , [bx + si + 2]
            jbe noswap


                call swap    ;another call here
                mov byte[swapflag] , 1

            noswap:
            add si , 2
            cmp si , cx
            jne innerloop

        cmp byte[swapflag] , 1
        je mainloop

        ;pop in reverse order

        pop si
        pop cx
        pop ax

    ret 

    start:
        mov bx , data
        mov cx , 4
        ;make a function call
        call bubblesort 

        ; data is now sorted

    mov ax , 0x4c00
    int 0x21

