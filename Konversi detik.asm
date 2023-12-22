.model small
.stack 100h

.data
detik dw 3665 ;Detik yang ingin di masukkan
jam db 0 
menit db 0
detik_sisa dw 0
pembagi dw 3600  

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ax, detik
    mov dx, 0
    mov bx, pembagi 
    div bx
    mov jam, al
    
    mov ax, dx
    mov dx, 0
    mov bx, 60
    div bx
    mov menit, al
    mov detik_sisa, dx
    
    mov ah, 2
    
    ; Menampilkan Jam
    add jam, 30h
    mov dl, jam
    int 21h
    mov dl, 'j'
    int 21h
    mov dl, 'a'
    int 21h
    mov dl, 'm'
    int 21h   
    
    
    ; Menampilkan Menit
    mov dl, ' '
    int 21h 
    add menit, 30h
    mov dl, menit
    int 21h
    mov dl, 'm'
    int 21h
    mov dl, 'e'
    int 21h
    mov dl, 'n'
    int 21h
    mov dl, 'i'
    int 21h
    mov dl, 't'
    int 21h
    
    ; Menampilkan Detik
    mov dl, ' '
    int 21h
    add detik_sisa, 30h
    mov dx, detik_sisa
    int 21h
    mov dl, 'd'
    int 21h
    mov dl, 'e'
    int 21h
    mov dl, 't'
    int 21h
    mov dl, 'i'
    int 21h
    mov dl, 'k'
    int 21h
          
    mov ax, 4c00h
    int 21h
main endp
end main
