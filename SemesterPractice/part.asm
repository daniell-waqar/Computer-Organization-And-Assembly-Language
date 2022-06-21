section	.text
   global _start        ;must be declared for using gcc
	
_start:	                ;tell linker entry point
   mov	ebx,'0'
   add eax, ebx
  ; sub     eax, '0'
	
   mov 	ebx, '7'
   ;sub     ebx, '0'
   add 	eax, ebx
  

   	
   mov 	ebx, '5'
   ;sub     ebx, '0'
   add 	eax, ebx
  
   	
   mov 	ebx, '0'
   ;sub     ebx, '0'
   add 	eax, ebx
	
   mov 	[sum], eax
   mov	ecx,rollNO	
   mov	edx, len
   mov	ebx,1	         ;file descriptor (stdout)
   mov	eax,4	         ;system call number (sys_write)
   int	0x80	         ;call kernel
	
  mov	ecx,rollNO
   mov	edx, 1
   mov	ebx,1	         ;file descriptor (stdout)
   mov	eax,4	         ;system call number (sys_write)
   int	0x80	         ;call kernel
	
   mov	eax,1	         ;system call number (sys_exit)
   int	0x80	         ;call kernel
	
section .data

rollNO: db "0750" , 0xA
name: db "Welcome from Waqar" , 0xA, 0x0
msg: db "The sum is:",sum
len: equ $ - rollNO   
sum : db 0