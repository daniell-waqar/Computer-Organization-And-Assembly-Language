[org 0x0100]


mov al,25

shl al,1

mov ax, 0x4c00
int 0x21
