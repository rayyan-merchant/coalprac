INCLUDE Irvine32.inc

.DATA
    prompt1 BYTE "Enter first number: ", 0
    prompt2 BYTE "Enter second number: ", 0
    result_msg BYTE "GCD: ", 0
    num1 DWORD ?
    num2 DWORD ?

.CODE
main PROC
    mov edx, OFFSET prompt1
    call WriteString
    call ReadInt
    mov num1, eax

    mov edx, OFFSET prompt2
    call WriteString
    call ReadInt
    mov num2, eax

GCD_LOOP:
    cmp num2, 0
    je DONE
    mov eax, num1
    mov edx, 0
    div num2
    mov num1, num2
    mov num2, edx
    jmp GCD_LOOP

DONE:
    mov eax, num1
    mov edx, OFFSET result_msg
    call WriteString
    call WriteDec
    call Crlf
    exit
main ENDP

END main
