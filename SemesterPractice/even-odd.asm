
[org 0x0100]

jmp START

Array: dw 2,5,3,7,8,6
evenn: dw 0
oddn: dw 0


START:  
        mov bx , 0
        mov cx , 6 
        mov dx,0
        mov di , 0

                
CHECK:  
        mov dx,[Array + bx]                    
        mov bl, 2    ;divide by 2  
        DIV bl        ;remainder should go into ah         
        cmp ah , 0
        JE EVEN
        JNE ODD        
        
        
EVEN:   
       

        DEC cx
        mov [di] ,dx
        add di, 2
        CMP cx,0
        JNZ CHECK
        
         
ODD:    
       
        DEC cx
        add bx , 2
        CMP bx , 12
        dec cx
        JNZ CHECK

mov ax , 0x4c00
int 0x21
