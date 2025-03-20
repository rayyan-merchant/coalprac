INCLUDE Irvine32.inc

.DATA
    prompt BYTE "Enter a number: ", 0
    result_msg BYTE "Reversed number: ", 0
    num DWORD ?, rev DWORD 0

.CODE
main PROC
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov num, eax
    mov rev, 0

REVERSE_LOOP:
    cmp num, 0
    je DONE
    mov edx, 0
    mov ebx, 10
    div ebx
    mov ecx, edx
    mov eax, rev
    mul ebx
    add eax, ecx
    mov rev, eax
    jmp REVERSE_LOOP

DONE:
    mov edx, OFFSET result_msg
    call WriteString
    mov eax, rev
    call WriteDec
    call Crlf
    exit
main ENDP

END main
