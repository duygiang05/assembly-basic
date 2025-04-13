.model small
.stack 100
.data 
    tb1 db 'nhap chuoi: $'
    tb2 db 10,13,'nhap ki tu can dem: $'
    kitu db ?    
    str db 100 dup('$')
    tb3 db 10,13,'so lan xuat hien: $'
    
.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,tb1       ; in ra tb1
    mov ah,9
    int 21h  
    
    lea dx,str        ;nhap chuoi ki tu
    mov ah,10
    int 21h
    
    lea dx,tb2
    mov ah,9             ;in ra tb2
    int 21h
    
    mov ah,1
    int 21h               ;nhap ki tu can dem
    mov kitu,al
    
    lea dx,tb3  
    mov ah,9                 ;in ra tb3
    int 21h
    
    mov cl,0  ; khoi tao bien dem cl   
                
    call count   ; goi ham count (dong thu 60)
    ;cl hien tai dang chua so lan xhien cua ki tu
    ; ta chi co the in ki tu , khong the in so nguyen
    ; chuyen so thanh ki tu roi in ra. su dung stack
     
    
    mov ax,0
    mov al,cl    ;dung al lam so bi chia
    mov bx,10    ;bx la so chia
    mov cx,0      ; cx chua so ki tu trong stack
    lap1:
        mov dx,0  ; dx la so du
        div bx      ; chia ax cho bx
        push dx      ;push so du vao stack
        inc cx       ;tang cx len 1 dvi
        cmp ax,0     ; ktra neu ax =0 , da xog phep chia
        jnz lap1     ; chua xog , chia tiep
    lap2:
        pop dx       ;lay dx ra stack
        add dx,'0'   ;chuyen dx thanh ki tu
        mov ah,2     ;in ra
        int 21h
        loop lap2     ;lap den khi cx=0
        
    mov ah,4ch
    int 21h
    
    main endp
count proc
    lea si,str+2  ; chuoi ki tu bat dau o vtri thu 2
    lap:
        mov dl,[si]
        cmp dl,kitu    ; ktra dl voi kitu can dem
        je congdem     ;neu giong nhau thi hay den congdem(dong 72)
        inc si         ; khac nhau thi tang si
        cmp [si],'$'    ; ktra da het chuoi chua
        jne lap         ;chua het thi duyet tiep
        jmp ketthuc     ; het roi thi ket thuc ham
    congdem:
        inc cl         ;tang cl
        inc si         ;tang si
        cmp [si] , '$' ;ktra het chuoi chua
        jne lap 
        
        ketthuc: ret
        count endp
end
    
    