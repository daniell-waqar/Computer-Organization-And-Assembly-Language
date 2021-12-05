[org 0x0100]
jmp start

num: dw 20,15,5 ,10
swap: db 0


    bubblesort:
        
        dec cx
        shl cx,1

            main:
                mov si,0
                mov byte[swap],0

                innerloop:
                    mov ax,[ bx + si]
                    cmp ax,[bx + si + 2]
                    jbe noswap

                        mov dx,[bx+ si + 2]
                        mov [bx + si],dx
                        mov [bx + si +2],ax
                        mov byte[swap],1


                noswap:
                    add si,2
                    cmp si , cx
                    jne innerloop

            cmp byte[swap],1
            je main
        ret


start
    mov bx,num
    mov cx,4

    call bubblesort


