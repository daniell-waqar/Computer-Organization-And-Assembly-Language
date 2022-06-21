org 0x0100

jmp start

num1: dw 0x40FF
dest1: dw 0x0
dest2: dw 0x40FF
start:

    ;shift left when a single register is capable to hold

    mov ax , [num1]
    shl ax , 1
    mov [dest1] , ax

  ;shift  when a single register can not   hold our number
    shl byte[dest2], 1  ;first 8 bit
    rcl byte[dest2 + 1] , 1  ; next  8 bit

mov ax , 0x4c00
int 0x21
