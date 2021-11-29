SECTION .text:

; We mark the start for this library using the following: 
GLOBAL _start


_start:

    mov eax,0x4   ;write syscall is 0x4
    mov ebx,1     ;std output should be used that is 1 for console
    mov ecx,string  ; the string to write 
    mov edx ,string_length  ; the length of the string 	
    int 0x80       ; invoke the system call 


    ;exit the program
    mov eax,0x1     ; exit system call is 0x1 
    mov ebx ,0       ; exit code is 0 (return 0) 
    int 0x80          


SECTION .data:
    string: db "cat", 0xA, 0x0      ;0xA is new line 
                                    ;0x0 is null terminator 
    string_length: equ $- string

;string_length: equ 5 ...is exactly same as #define string_length 5






