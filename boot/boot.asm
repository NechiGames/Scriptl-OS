[org 0x7c00]
[bits 16]

start:
    ; clear screen
    mov ax, 03
    int 0x10

    mov si, msg1
    call .print

    mov si, msg2
    call .print

.print:
    lodsb

    test al, al
    jz .done

    mov ah, 0x0e
    int 0x10

    jmp .print

.done:
    ret

msg1 db "                           Scriptl OS v0.1 Genesis", 0xa, 0xd, 0
msg2 db "ScriptlOS>$ ", 0

times 510 - ($ - $$) db 0
dw 0xaa55
