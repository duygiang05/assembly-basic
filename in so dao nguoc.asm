.model small
.stack 100
.data
    str db 100 dup('$')  
    xuongdong db 10,13,'$'
    tb1 db 'xin moi nhap: $'
    tb2 db 13,10,'chuoi dao nguoc:   $'
    
.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,tb1
    mov ah,9       ;in tb1
    int 21h
    
    lea dx,str
    mov ah,10         ;nhap chuoi
    int 21h
    
    lea dx,tb2
    mov ah,9             ;in tb2
    int 21h 
    mov cx,0
    
    lea dx,xuongdong
    mov ah,9               ; ko hieu sao khi in, chuoi kq cua minh bi ghi
    int 21h                  ;de len tb2, nen mik phai xuong dong
    
    lea si,str+2
    lap:
    push [si]       ;push si vao ngan xep
    inc si
    inc cx;
    cmp [si] ,'$'       ; chua ket thuc thi push tiep
    jne lap:
    
    inra:
    pop dx  ;pop ra , luu vao dx
    mov ah,2   ;in ra ki tu da luu tai dl
    int 21h
    loop inra 
    
     mov ah,4ch
     int 21h
    main endp
end