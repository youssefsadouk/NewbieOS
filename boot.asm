ORG 0X7C00
BITS 16

start:
    mov si, message
    call print
    jmp $

print:  
    mov bx, 0 
.loop:
    lodsb
    cmp al, 0
    je .end
    call printChar
    jmp .loop

.end: ret

printChar: 
    mov ah, 0eh      
    int 0x10       
    ret 

message: db 'first bootloader msg', 0

times 510- ($ - $$) db 0
dw 0xAA55
