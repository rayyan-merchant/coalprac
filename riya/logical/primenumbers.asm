INCLUDE Irvine32.inc

.DATA
    newline BYTE 0Dh, 0Ah, 0
    msg BYTE "Prime Numbers (1-50):", 0
    space BYTE " ", 0

.CODE
main PROC
    mov edx, OFFSET msg   
    call WriteString
    call Crlf

    mov ecx, 50          
    mov eax, 1          

PRINT_LOOP:
    push eax             
    mov ebx, 2           

CHECK_LOOP:
    cmp ebx, eax         
    jge IS_PRIME         
    mov edx, 0
    div ebx             
    cmp edx, 0
    je NOT_PRIME         
    inc ebx
    jmp CHECK_LOOP

IS_PRIME:
    pop eax              
    mov edx, eax         
    call WriteDec        
    mov edx, OFFSET space
    call WriteString     
    jmp NEXT

NOT_PRIME:
    pop eax              

NEXT:
    inc eax
    cmp eax, 51
    jl PRINT_LOOP

    call Crlf
    exit
main ENDP

END main
