%define X 100
%define Y 50
%define COLOR 35

iniciar_gui:
	mov ah, 0x00      ; Función: cambiar modo de video
	mov al, 0x13      ; Modo 13h: 320x200, 256 colores
	int 0x10
mov ax, Y ; coord Y
mov bx, 640 ; resolución en horizontal
mul bx ;(640*y)% 0ffffh en AX y (640*y)/0ffffh en DX
add ax, X ; coord X
inc dx
mov bx,0a000h ; acceder a memoria de pantalla a dibujar
mov es,bx ; ES -> a000h
mov di,ax ; el offset está calculado en AX
mov ax, COLOR ; color del pixel
mov [es:di],ax
