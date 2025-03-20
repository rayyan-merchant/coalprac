INCLUDE Irvine32.inc

.DATA
    prompt BYTE "Enter the number of terms: ", 0
    result_msg BYTE "Fibonacci Series: ", 0
    newline BYTE 0Dh, 0Ah, 0
    n DWORD ?
    first DWORD 0
    second DWORD 1
    next DWORD ?

.CODE
main PROC
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov n, eax

    mov edx, OFFSET result_msg
    call WriteString
    call Crlf

    mov eax, first
    call WriteDec
    call Crlf

    mov eax, second
    call WriteDec
    call Crlf

    mov ecx, n
    sub ecx, 2

FIB_LOOP:
    cmp ecx, 0
    je DONE
    mov eax, first
    add eax, second
    mov next, eax

    mov eax, next
    call WriteDec
    call Crlf

    mov eax, second
    mov first, eax
    mov eax, next
    mov second, eax

    dec ecx
    jmp FIB_LOOP

DONE:
    exit
main ENDP

END main
