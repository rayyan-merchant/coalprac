INCLUDE Irvine32.inc

.DATA
    prompt BYTE "Enter a number: ", 0
    palindrome_msg BYTE "The number is a palindrome.", 0
    not_palindrome_msg BYTE "The number is not a palindrome.", 0
    num DWORD ?, rev DWORD 0, temp DWORD ?

.CODE
main PROC
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov num, eax
    mov temp, eax
    mov rev, 0

REVERSE_LOOP:
    cmp temp, 0
    je CHECK_PALINDROME
    mov edx, 0
    mov ebx, 10
    div ebx
    mov ecx, edx
    mov eax, rev
    mul ebx
    add eax, ecx
    mov rev, eax
    mov eax, temp
    div ebx
    mov temp, eax
    jmp REVERSE_LOOP

CHECK_PALINDROME:
    mov eax, num
    cmp eax, rev
    je IS_PALINDROME
    mov edx, OFFSET not_palindrome_msg
    call WriteString
    jmp END_PROGRAM

IS_PALINDROME:
    mov edx, OFFSET palindrome_msg
    call WriteString

END_PROGRAM:
    call Crlf
    exit
main ENDP

END main
