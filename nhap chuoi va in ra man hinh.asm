.model small
.stack 100
.data  
    tbao2 db 10,13,'chuoi vua nhap la: $'   
    tbao1 db 'xin moi duy giang nhap : $'
    str db 100 dup('$')
.code
main proc
    mov ax,@data
    mov ds,ax       
    
    lea dx,tbao1      ;in tbao1
    mov ah,9
    int 21h
    
    lea dx,str
    mov ah,10         ;nhap chuoi
    int 21h
    
    lea dx,tbao2
    mov ah,9           ;in tbao 2
    int 21h
    
    lea dx,str+2
    mov ah,9           ;in ra( chuoi bat dau tu ki tu thu2)
    int 21h            ; kitu 0 la 100
                       ;kitu 1 la do dai chuoi
    main endp

end
    