.model small
.stack 100
.data
    tb1 db 10,13,'in thuong la: $'
    tb2 db 10,13,'in hoa la: $'
    
    str db 100 dup('$')
    
.code 
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,str     ;nhap chuoi
    mov ah,10
    int 21h
    
    lea dx,tb1;         ;in ra tb1
    mov ah,9
    int 21h    
    call inthuong       ;goi ham in thuong (dong 33)
    
    lea dx,tb2
    mov ah,9             ;in ra tb2
    int 21h
    call inhoa           ;goi ham inhoa(dong 54)
    
    mov ah,4ch
    int 21h
    
    main endp

inthuong proc
    lea si,str+2
    
    lap:
        mov dl,[si]
        cmp dl,'A'       ;neu nho hon A (la chu thuong)
        jl inra          ;nhay den inra(dong 44)
        cmp dl,'Z'
        jg inra          ;tuong tu
        add dl,32         ;neu la in hoa , cong them 32
     
    inra:
        mov ah,2
        int 21h         ;in ra
        add si,1
        cmp [si],'$'    ;ktra da het chuoi chua
        jne lap
        
    ret
    inthuong endp

inhoa proc
    lea si,str+2
    
    lap2:
        mov dl,[si]
        cmp dl,'a'
        jl inra2           ;tuong tu nhu ham inthuong
        cmp dl,'z'
        jg inra2   
        sub dl,32
        
    inra2:
        mov ah,2
        int 21h 
        add si,1
        cmp [si],'$'
        jne lap2
        
        ret
        inhoa endp
end
        
    
    