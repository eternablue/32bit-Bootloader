gdt_null_descriptor:
    dd 0
    dd 0

gdt_code_descriptor:
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 10011010b
    db 11001111b
    db 0x00

gdt_data_descriptor:
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 10010010b
    db 11001111b
    db 0x00

gdt_end:

gdt_descriptor:
    gdt_size:
        dw gdt_end - gdt_null_descriptor - 1
        dd gdt_null_descriptor

code_segment equ gdt_code_descriptor - gdt_null_descriptor
data_segment equ gdt_data_descriptor - gdt_null_descriptor

EnterProtectedMode:
    in al, 0x92
    or al, 2
    out 0x92, al
    
    cli
    
    xor ax, ax
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    lgdt [gdt_descriptor]
    mov eax, cr0
    or eax, 1
    mov cr0, eax
    jmp code_segment:ProtectedModeEntry