[org 0x0100]

jmp start

arr : dw 1,3,9,2,4,8,7,1,6,5  ; array 1

arr2: dw 11,8,4,9,3,5,8       ; array 2

res : dw 0                     

res2: dw 0                     

res3: dw 0                    

asize : dw 10                   

start:                            

mov ax , [asize]            ;we will divide array size b 2 to iterate half on array    
mov bx , 2                      
div bx                                   
mov cx,ax                        

mov ax , 0                        
mov bx , 0                       


outerloop:                       

mov ax , [arr + bx]             ; we will take values from array and then sum them and store in result
mov dx , [res]                 
add ax,dx                        
mov [res] , ax                 
add bx , 2                       
sub cx , 1                        

jnz outerloop                    
                    
mov ax , [asize]               ; for second half of array
mov cl , 2

div cl

mov cx,ax



secloop:

mov ax , [arr + bx]         ; now we will take values from other half of array and sum them and put in result
mov dx , [res2]
add ax,dx
mov [res2] , ax
add bx , 2
sub cx , 1

jnz secloop




quit
mov si, 0                                   ; we will find minimum from 2nd array
xor si, si
mov cx, [arr2]
min:

cmp [arr2+si], cx

ja nothing
    mov cx, [arr2+si]

    nothing:
        add si, 2
        cmp si, 14
        jne min


mov ax,0
mov bx,0


mov ax , [res]    ; then we compare the both result 1 and result 2 and then we will divde it with 2nd array minimum values
cmp ax,[res2]

jbe noswap

mov ax,[res2]
div cl
mov [res3],ax

jmp exit

noswap:

div cl

mov [res3],ax

exit:

mov ax ,0x4c00
int 0x21





