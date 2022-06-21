org 100h
jmp start

data: dw "Enter a Letter (A -- Z) or (a -- z) :"
datalength: dw 40

data1: dw "The lowercase Letter is : "
data1length: dw 29

data2: dw "The uppercase Letter is : "
data2length: dw 29

data3: dw "Wrong Letter! Try again."
data3length: dw 27

clrscr:
    push ax
    push es
    push di

    mov ax,0xb800
    mov es,ax

    mov di,0
    mov ax,0x0720
   
    l1:
        mov word[es:di],ax
        add di,2
        cmp di,4000
        jne l1

    pop di
    pop es
    pop ax
    ret


cupplow:
    push ax
    push es
    push di
    push bx
    push cx
    push dx
    push si


    mov ax , 0xb800
    mov es , ax
    xor ax , ax

        mov di , 0

        entrypoint:

            mov si , data
            mov cx , [datalength]

            mov ah , 0x07
            loop1:
                mov al , [si]
                mov word[es:di] , ax

                add si , 1
                add di , 2

                loop loop1

            add di , 80

            mov ah,1
            int 21H
           
            mov dl , al
            mov ah,2        
            int 21h


            mov al , dl

            cmp dl , 0x61
            jge checkhigher

            cmp dl , 0x41
            jge checklower

            cmp dl , 0x1B
            jne falseinput






            pop si
            pop dx
            pop cx
            pop bx
            pop di
            pop es
            pop ax
            ret




            checkhigher:
                cmp al , 0x7A
                jbe converthigher

                jmp falseinput


            checklower:
                cmp al , 0x5A
                jbe converttolower
               
                jmp falseinput

        converthigher:
            mov bl , al

            mov ah , 0x07
            mov si , data2
            mov cx , [data2length]

            loop4:
                mov al , [si]
                mov word[es:di] , ax

                add si , 1
                add di , 2

                loop loop4

            mov al , bl
            sub al , 32

            add di , 2

            mov word[es:di] , ax
           
            add di , 260


            jmp entrypoint        



        converttolower:
            mov bl , al

            mov ah , 0x07
            mov si , data1
            mov cx , [data1length]

            loop6:
                mov al , [si]
                mov word[es:di] , ax

                add si , 1
                add di , 2

                loop loop6

            mov al , bl
            add al , 32

            add di , 2

            mov word[es:di] , ax
            add di , 260

            jmp entrypoint        

    falseinput:

        mov si , data3
        mov cx , [data3length]

        mov ah , 0x07

        loop5:
            mov al , [si]
            mov word[es:di] , ax

            add si , 1
            add di , 2
            loop loop5


        add di , 266

        jmp entrypoint

start:
    call clrscr
    call cupplow

    mov ax , 0x4c00
    int 21h