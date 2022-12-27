[ORG 0x7E00]

jmp EnterProtectedMode
%include "protected.asm"

[BITS 32]

ProtectedModeEntry:

    mov ax, data_segment
    mov ds, ax
    mov ss, ax 
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov [0xB8000], byte 'H'
    mov [0xB8002], byte 'E'
    mov [0xB8004], byte 'L'
    mov [0xB8006], byte 'L'
    mov [0xB8008], byte 'O'

    ; call _start

    jmp $

times 2048-($-$$) db 0