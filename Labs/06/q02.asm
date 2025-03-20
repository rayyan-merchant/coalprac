INCLUDE Irvine32.inc
.data
; 1
; 1 1
; 1 1 1
; 1 1 1 1
space BYTE " ", 0  
num DWORD 1       
.code 
main PROC
    mov ecx, 1 

outer:
    mov ebx, ecx

inner:
    mov eax, num  
    call WriteDec 


    mov edx, OFFSET space 
    call WriteString      

         
    dec ebx
    jnz inner 

    call Crlf

    inc ecx
    cmp ecx, 5  
    jne outer  

    exit
main ENDP
end main
