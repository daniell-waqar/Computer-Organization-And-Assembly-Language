[org 0x0100]

mov  ax, 0xb800         ; video memory base
mov  es, ax             ; cannot move to es through IMM
mov di , 160           ; top left location 

nextpos: 
    mov  word [es:160], 0x0741       ; 0x07 -- full white  (try 41)
                                    ; 0x20 is the space character
    
     mov  word [es:320], 0x0741 
      mov  word [es:480], 0x0741 
      
    mov  ax, 0x4c00
    int  0x21