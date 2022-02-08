SECTION .text: 

GLOBAL _start 

_start: 
	 
	mov eax, 0x4 				; syscall
	mov ebx, 1 					; std output
	mov ecx, rollno 			; the string to write 
	mov edx, rollno_length 	; the length of the string 		
	int 0x80 					; invoke the system call 

_start1:

    mov eax, 0x4 				;  syscall
	mov ebx, 1 					; std output 
	mov ecx, name 			; the string to write 
	mov edx, name_length 	; the length of the string 		
	int 0x80 					; invoke the system call 



	; exit the program 
	mov eax, 0x1 				; exit system call is 0x1 
	mov ebx, 0 					; (return 0) 
	int 0x80 					 

SECTION .data: 
	
	rollno: db "20P_0750",  0xA,  0x0 
	rollno_length: equ $-rollno

    name: db "Waqar Ahmed",  0xA,  0x0 
	name_length: equ $-name 




