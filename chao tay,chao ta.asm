.model small 
.stack
.data
    chaotay db 'hello duy giang!$'
    chaota db 10,13,'xin chao duy giang!$'  ; 10,13 la xuong dong
.code                
main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9          ; ham in ra man hinh 1 chuoi ki tu
    lea dx, chaotay  
    int 21h 
    
    lea dx, chaota
    int 21h
                     ;ham ket thuc ctrinh
    mov ah,4ch
    int 21h
    
main endp
end
    
        
        
       