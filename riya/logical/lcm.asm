INCLUDE Irvine32.inc

.DATA
    prompt1 BYTE "Enter first number: ", 0
    prompt2 BYTE "Enter second number: ", 0
    result_msg BYTE "LCM: ", 0
    num1 DWORD ?, num2 DWORD ?, a DWORD ?, b DWORD ?, lcm DWORD ?

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

    mov eax, num1
    mov ebx, num2
    mov a, eax
    mov b, ebx

GCD_LOOP:
    cmp ebx, 0
    je CALC_LCM
    mov edx, 0
    div ebx
    mov eax, ebx
    mov ebx, edx
    jmp GCD_LOOP

CALC_LCM:
    mov ebx, a
    mul b
    div eax
    mov lcm, eax

    mov edx, OFFSET result_msg
    call WriteString
    mov eax, lcm
    call WriteDec
    call Crlf

    exit
main ENDP

END main
