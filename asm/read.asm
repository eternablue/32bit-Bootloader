ReadDisk:
    mov ah, 0x02
    mov bx, 0x7E00
    mov al, 4
    mov dl, [BOOT_DISK]
    mov ch, 0x00
    mov dh, 0x00
    mov cl, 0x02

    int 0x13
    jc Hang
    ret

BOOT_DISK:
    db 0

Hang:
    jmp $