; This is an in-line calculator for doing basic arithmatic
; with two small positive integers. Input size is a max of
; 10 characters total (including the operator).
;
; The program supports two integer operands and one of
; the following five operators: +, -, *, /, %
;
; Designed to work with an online NASM assembler:
; https://www.tutorialspoint.com/compile_asm_online.php
; https://www.jdoodle.com/compile-assembler-nasm-online

	
section	.text
	global _start
	
_start:

	; Collect the input equation.
I:	MOV eax, 3
	MOV ebx, 0
	MOV ecx, input
	MOV edx, 10
	INT 0x80

    ; Find the operator in the input.
    ; Loop through string and compare.
    MOV al, 0
    MOV ebx, input
F1: MOV dl, [ebx]
    CMP dl, 43      ; Check if '+'
    JE  C
    CMP dl, 45      ; Check if '-'
    JE  C
    CMP dl, 42      ; Check if '*'
    JE  C
    CMP dl, 47      ; Check if '/'
    JE  C
    CMP dl, 37      ; Check if '%'
    JE  C
    CMP dl, 48      ; Check if below '0'
    JL  W
    CMP dl, 57      ; Check if above '9'
    JG  W
    INC al
    INC ebx
    CMP al, 10
    JLE F1
    
    ; If the program doesn't jump at this point, it
    ; means we've iterated through the string and
    ; didn't find an operator. Error message and quit.
W:  MOV eax, 4
    MOV ebx, 1
    MOV ecx, wroStr
    MOV edx, wroLen
    INT 0x80
    MOV ebx, -1
    JMP E

    ; We've found an operator. eax has it's location
    ; and dl has the operator itself.
C:  MOV [oper], dl
    MOV [loc], al
    
    ; Continue looking for more non-numbers
    INC ebx
    INC al
F2: MOV dl, [ebx]
    CMP dl, 10      ; Check for new line
    JE  F3
    CMP dl, 13      ; Check for carriage return
    JE  F3
    CMP dl, 48      ; Check if below '0'
    JL  W
    CMP dl, 57      ; Check if above '9'
    JG  W
    INC al
    INC ebx
    CMP al, 10
    JL F2
    MOV [len], BYTE 10
    JMP F4
    
F3: MOV [len], al

    ; If the operator is in the first or the last slot,
    ; the equation is unreadable. Exit.
    MOV ebx, input
    MOV cl, [ebx]
    CMP cl, [oper]
    JE  W
    ADD bl, al
    DEC ebx
    MOV cl, [ebx]
    CMP cl, [oper]
    JE  W
    
    ; Equation is valid. Parse the string for
    ; the first integer.
F4: MOV ecx, 0
    MOV cl, [loc]
    DEC ecx
    MOV ebx, 1
L1: MOV edx, input
    ADD edx, ecx
    MOV eax, 0
    MOV al, [edx]
    SUB eax, 48
    MUL ebx
    ADD eax, [num1]
    MOV [num1], eax
    MOV eax, ebx
    MOV ebx, 10
    MUL ebx
    MOV ebx, eax
    DEC ecx
    CMP ecx, -1
    JG  L1
    
    ; Parse the string for the second integer.
    MOV ecx, 0
    MOV cl, [len]
    DEC ecx
    MOV ebx, 1
L2: MOV edx, input
    ADD edx, ecx
    MOV eax, 0
    MOV al, [edx]
    SUB eax, 48
    MUL ebx
    ADD eax, [num2]
    MOV [num2], eax
    MOV eax, ebx
    MOV ebx, 10
    MUL ebx
    MOV ebx, eax
    DEC ecx
    MOV edx, 0
    MOV dl, [loc]
    CMP ecx, edx
    JG  L2
    
    ; Output the orignal input.
    MOV eax, 4
    MOV ebx, 1
    MOV ecx, inStr
    MOV edx, inLen
    INT 0x80
    MOV eax, 4
    MOV ecx, input
    MOV edx, 0
    MOV dl, [len]
    INC edx
    INT 0x80
    
    ; Calculate the result!
    MOV bh, [oper]
    MOV eax, [num1]
    MOV ecx, [num2]
    CMP bh, 43      ; Check if '+'
    JE  A1
    CMP bh, 45      ; Check if '-'
    JE  A2
    CMP bh, 42      ; Check if '*'
    JE  A3
    CMP bh, 47      ; Check if '/'
    JE  A4
    CMP bh, 37      ; Check if '%'
    JE  A5
    
A1: ADD eax, ecx
    JMP A6
A2: CMP eax, ecx    ; Check for negative result.
    JGE A7
    MOV eax, ecx
    MOV [sign], BYTE 1
    MOV ecx, [num1]
A7: SUB eax, ecx
    JMP A6
A3: MUL ecx
    JMP A6
A4: MOV edx, 0
    CMP ecx, 0      ; Check for divide by zero.
    JZ  W2
    DIV ecx
    JMP A6
A5: MOV edx, 0
    CMP ecx, 0      ; Check for divide by zero.
    JZ  W2
    DIV ecx
    MOV eax, edx
    JMP A6
    
W2  MOV eax, 4
    MOV ebx, 1
    MOV ecx, divStr
    MOV edx, divLen
    INT 0x80
    MOV ebx, -1
    JMP E

A6: MOV [res], eax
    
    ; Convert integer back to a string. Re-use
    ; the variable "input".
    
    ; Clear the original "input"
    MOV ebx, input
    MOV cl, 0
    MOV ch, 0
L3: MOV [ebx], ch
    INC cl
    INC ebx
    CMP cl, 10
    JL  L3
    
    
    ; Start by getting the length of the number.
    MOV ecx, 0
    MOV ebx, 10
L4: MOV edx, 0
    DIV ebx
    INC ecx
    CMP eax, 0
    JG  L4
    MOV [len], cl
    
    ; Now to convert each digit back to characters.
    MOV eax, [res]
    MOV edx, 0
    MOV dl, [sign]
    CMP dl, 0
    JE  L5
    INC ecx
    MOV ebx, input
    MOV dl, [oper]
    MOV [ebx], dl
    MOV dl, [len]
    INC dl
    MOV [len], dl
L5: DEC ecx
    MOV ebx, 10
    MOV edx, 0
    DIV ebx
    ADD edx, 48
    MOV ebx, input
    ADD ebx, ecx
    MOV [ebx], dl
    MOV edx, 0
    MOV dl, [sign]
    CMP ecx, edx
    JG  L5
    
    ; Output result.
    MOV eax, 4
    MOV ebx, 1
    MOV ecx, ansStr
    MOV edx, ansLen
    INT 0x80
    MOV eax, 4
    MOV ecx, input
    MOV edx, 0
    MOV dl, [len]
    INT 0x80
    MOV ebx, 0

    ; Quit the program.
E:  MOV eax, 1
    INT 0x80

section	.data
    ; Create output strings and assign them memory.
    inStr   DB  'The input:', 0xa
    inLen   EQU     $ - inStr
	wroStr	DB	'Did not recognize input.', 0xa
	wroLen	EQU		$ - wroStr
	divStr  DB  'Divide by zero!', 0xa
	divLen  EQU     $ - divStr
	ansStr	DB	'The answer is: ', 0xa
	ansLen  EQU     $ - ansStr
	
	; Memory for variables
    input   TIMES 10 DB 0       ; Holds the input equation.
            DB  0xa
    len     DB  0               ; Input length
	oper    DB  0               ; Extracts the operator.
	loc     DB  0               ; Holds the operator location.
	num1    DD  0               ; The two operands.
	num2    DD  0
	res     DD  0               ; The result.
	sign    DD  0               ; Sign. Used in case of subtraction.