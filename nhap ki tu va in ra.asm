.model small 
.stack 100
.data
    step1 db 'xin moi nhap ki tu:$'
    step2 db 13,10,'ki tu vua nhap:$'
    kitu db ?
.code

main proc
    mov ax, @data
    mov ds,ax
    
    lea dx,step1
    mov ah,9                ;in step1
    int 21h
    
    mov ah,1
    int 21h                 ;nhap ki tu
    mov kitu,al
    
    lea dx, step2
    mov ah,9                ;in step2
    int 21h
    
    mov dl,kitu
    mov ah,2                ; in ki tu (luu o dl)
    int 21h   
    
    mov ah,4ch
    int 21h                ;ket thuc
    
    main endp
end