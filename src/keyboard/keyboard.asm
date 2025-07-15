detectar_tecla:
    mov ah, 0x00
    int 0x16
    
    cmp ah, 0x01
    je iniciar_gui
    mov si, scan_code_table
    mov cx, 27

.buscar_scan_code:
    cmp ah, [si]
    je .encontrado
    add si, 2
    loop .buscar_scan_code
    jmp .fin

.encontrado:
    mov al, [si + 1]
    mov ah, 0x0E
    int 0x10

.fin:
    ret

scan_code_table:
    db 0x1E, 'a'   ; A
    db 0x30, 'b'   ; B
    db 0x2E, 'c'   ; C
    db 0x20, 'd'   ; D
    db 0x12, 'e'   ; E
    db 0x21, 'f'   ; F
    db 0x22, 'g'   ; G
    db 0x23, 'h'   ; H
    db 0x17, 'i'   ; I
    db 0x24, 'j'   ; J
    db 0x25, 'k'   ; K
    db 0x26, 'l'   ; L
    db 0x32, 'm'   ; M
    db 0x31, 'n'   ; N
    db 0x18, 'o'   ; O
    db 0x19, 'p'   ; P
    db 0x10, 'q'   ; Q
    db 0x13, 'r'   ; R
    db 0x1F, 's'   ; S
    db 0x14, 't'   ; T
    db 0x16, 'u'   ; U
    db 0x2F, 'v'   ; V
    db 0x11, 'w'   ; W
    db 0x2D, 'x'   ; X
    db 0x15, 'y'   ; Y
    db 0x2C, 'z'   ; Z
    db 0x39, ' '   ; Espacio
    
%include "src/gui/gui.asm"
