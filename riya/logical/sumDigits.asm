INCLUDE Irvine32.inc

.DATA
    prompt BYTE "Enter a number: ", 0
    result_msg BYTE "Sum of digits: ", 0
    num DWORD ?, sum DWORD 0

.CODE
main PROC
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov num, eax
    mov sum, 0

SUM_LOOP:
    cmp num, 0
    je DONE
    mov edx, 0
    mov ebx, 10
    div ebx
    add sum, edx
    mov num, eax
    jmp SUM_LOOP

DONE:
    mov edx, OFFSET result_msg
    call WriteString
    mov eax, sum
    call WriteDec
    call Crlf
    exit
main ENDP

END main
