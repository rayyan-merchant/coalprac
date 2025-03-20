INCLUDE Irvine32.inc

.DATA
    prompt BYTE "Enter a number: ", 0
    result_msg BYTE "Factorial: ", 0
    num DWORD ?

.CODE
main PROC
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov num, eax
    mov ecx, eax 
    mov eax, 1    

FACTORIAL_LOOP:
    cmp ecx, 1
    jle DONE
    mul ecx
    loop FACTORIAL_LOOP

DONE:
    mov edx, OFFSET result_msg
    call WriteString
    call WriteDec
    call Crlf
    exit
main ENDP

END main
