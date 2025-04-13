.model small
.stack 100
.data
    tb db 13,10,'ki tu chuyen doi la: $'  
    kitu db ? ,'$'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,1     
    int 21h
    sub al,32   
    mov kitu ,al
    
    lea dx,tb
    mov ah,9
    int 21h
    
    lea dx,kitu
    mov ah,9
    int 21h
    
    main endp
end