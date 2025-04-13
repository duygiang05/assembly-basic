.model small
.stack 100
.data          
    xuongdong db 10,13,'$'
    tmp db ?
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov bl,0   ;bl la dieu kien dung 
    mov cl,1    ;cl dem so ki tu da in
    
    start:
    
    mov dl,bl
    
    cmp dl,0
    je lap
    cmp dl,7       ;ktra dl la cac ki tu dieu khien thi ko in
    je lap
    cmp dl ,8
    je lap
    cmp dl,9
    je lap
    cmp dl,10
    je lap    
    cmp dl,13
    je lap
    cmp dl,32
    je lap   
    jmp inra      ;ko phai kitu dkhien thi in
    
    lap:
    inc bl          ;tang bl, ktra tiep
    jmp start 
    
    inra:
    mov dl,bl        ;in ra
    mov ah,2
    int 21h    
    
    mov dl,' '
    mov ah,2          ;in dau cach
    int 21h  
    
    inc bl
    jmp check  ;dong 58
    tieptuc:
    inc cl
    cmp bl,255 
    jne start   
    
    mov ah,4ch
    int 21h
    
    main endp 
check proc
    mov al,cl   ;dung al lam so bi chia
    mov tmp,cl    ;tmp luu cl
    mov cl,20      ;chia cho 20
    xor ah,ah      ;dung al chia, phai cho ah =0
    div cl
    cmp ah,0        ;so du luu o ah sau phep chia, neu bang 0,inra2(dong69)
    je inra2  
    mov cl ,tmp             ;ko chia het cho 20, in tiep
    jmp tieptuc
    
    inra2:
    lea dx,xuongdong
    mov ah,9          ;in xuong dong
    int 21h   
    
    mov cl,tmp       ;in tiep cac kitu sau
    jmp tieptuc

    check endp

end
    
    
       