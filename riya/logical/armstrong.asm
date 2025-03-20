INCLUDE Irvine32.inc

.DATA
    prompt BYTE "Enter a number: ", 0
    armstrong_msg BYTE "The number is an Armstrong number.", 0
    not_armstrong_msg BYTE "The number is not an Armstrong number.", 0
    num DWORD ?, temp DWORD ?, sum DWORD 0

.CODE
main PROC
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov num, eax
    mov temp, eax
    mov sum, 0

CHECK_LOOP:
    cmp temp, 0
    je CHECK_RESULT
    mov edx, 0
    mov ebx, 10
    div ebx
    mov ecx, edx
    mov eax, ecx
    mul ecx
    mul ecx
    add sum, eax
    mov eax, temp
    div ebx
    mov temp, eax
    jmp CHECK_LOOP

CHECK_RESULT:
    mov eax, num
    cmp eax, sum
    je IS_ARMSTRONG
    mov edx, OFFSET not_armstrong_msg
    call WriteString
    jmp END_PROGRAM

IS_ARMSTRONG:
    mov edx, OFFSET armstrong_msg
    call WriteString

END_PROGRAM:
    call Crlf
    exit
main ENDP

END main
