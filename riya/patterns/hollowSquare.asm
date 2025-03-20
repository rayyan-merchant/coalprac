INCLUDE Irvine32.inc

.DATA
    star BYTE "*", 0
    space BYTE " ", 0
   

.CODE
main PROC
    mov ecx, 5    
    mov esi, 1    

ROW_LOOP:
    cmp esi, 1    
    je PRINT_FULL_ROW
    cmp esi, 5    
    je PRINT_FULL_ROW

    mov edx, OFFSET star
    call WriteString

    mov ebx, 3    
PRINT_SPACES:
    cmp ebx, 0
    je PRINT_STAR_END
    mov edx, OFFSET space
    call WriteString
    dec ebx
    jmp PRINT_SPACES

PRINT_STAR_END:
    mov edx, OFFSET star
    call WriteString
    jmp PRINT_NEWLINE

PRINT_FULL_ROW:
    mov ebx, 5    
PRINT_STARS:
    cmp ebx, 0
    je PRINT_NEWLINE
    mov edx, OFFSET star
    call WriteString
    dec ebx
    jmp PRINT_STARS

PRINT_NEWLINE:
    call Crlf

    inc esi       
    cmp esi, 6    
    jl ROW_LOOP

    exit
main ENDP
END main
