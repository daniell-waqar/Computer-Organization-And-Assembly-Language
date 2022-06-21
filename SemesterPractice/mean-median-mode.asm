

[org 0x100]

jmp start 

data:   dw  2, 7, 9, 5 ,6 ,3, 6,5,3,1
size:  dw 10
mean: dw 0
median: dw 0
mode: dw 0
swap: dw 0

bubblesort: 
    dec  cx
    shl  cx, 1                   

    mainloop:  
        mov  si, 0               
        mov  byte[swap], 0       

        innerloop: 
            mov  ax, [bx + si]
            cmp  ax, [bx + si + 2]
            jbe  noswap 

                mov  dx, [bx + si + 2]
                mov  [bx + si], dx 
                mov  [bx + si + 2], ax 
                mov  byte[swap], 1 

            noswap: 
            add  si, 2 
            cmp  si, cx
            jne  innerloop

        cmp  byte[swap], 1 
        je   mainloop 

    ret    ; 



calculateMean:
	xor ax , ax
	xor bx , bx
	mov cx,[size]
	shl cx

	loop1:
		add ax [data+bx]
		add bx,2
		cmp bx,cx

		jne loop1
		div [size]
		mov [mean],ax
		ret

calculateMedian:
	xor ax , ax
	xor bx , bx
	mov ax,[data+cx]
	add ax , [data+cx-2]
	mov [median] , ax

call bubblesort

	mov cx, [size]
	shr cx
	shl cx
	cmp cx,size

	je calculateMedian
	mov ax , [data+cx]
	mov [median] , ax
	
	ret


calculateMode:
	call bubblesort
	xor bx , bx
loop3:

	add bx ,2

loop1:
	mov ax ,[data+bx]
	
loop2:
	cmp ax ,[data+bx +2]
	je findmode
	add bx,2
	cmp bx , 20
	je loop3
	jne loop2

findmode:
	add cx , 1
	cmp cx,7
	jne loop1


mov [mode] , cx 

ret


start:
	call calculateMean

 	call caculateMedian

	call calculateMode

    mov ax, 0x4c00
    int 0x21