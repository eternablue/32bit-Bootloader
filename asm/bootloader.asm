[BITS 16]
[ORG 0x7C00]

mov [BOOT_DISK], dl

mov bp, 0x7C00
mov sp, bp

call ReadDisk

jmp 0x7E00

%include "read.asm"

times 510-($-$$) db 0
dw 0xAA55