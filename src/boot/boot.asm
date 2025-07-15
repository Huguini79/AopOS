ORG 0x7c00
BITS 16

start:
    ; --- Limpia pantalla (opcional) ---
    mov ah, 0x00
    mov al, 0x03    ; Modo texto 80x25
    int 0x10

call imprimir_bienvenida

jmp loop

loop:
	call detectar_tecla
	
	jmp loop

imprimir_bienvenida: 
	mov si, mensaje

.next_char:
    lodsb
    cmp al, 0
    je .fin
    mov ah, 0x0E
    int 0x10
    jmp .next_char
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00

    ; --- Limpia pantalla (opcional) ---
    mov ah, 0x00
    mov al, 0x03    ; Modo texto 80x25
    int 0x10
.fin:
    ret

mensaje db 'BIENVENIDO A AopOS, PRESIONA ESC PARA ENTRAR EN LA INTERFAZ GRAFICA', 0x0D, 0x0A, 0x0D, 0x0A, 'ordenador:~/AopOS$ ', 0

%include "src/keyboard/keyboard.asm"

times 510 - ($ - $$) db 0
dw 0xAA55
