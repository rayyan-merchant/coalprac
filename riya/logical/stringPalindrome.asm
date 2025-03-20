INCLUDE Irvine32.inc

.DATA
    prompt BYTE "Enter a string: ", 0
    inputStr BYTE 30 DUP(0)  
    length DWORD ?
    newline BYTE 0Dh, 0Ah, 0
    msgYes BYTE "The string is a palindrome.", 0
    msgNo BYTE "The string is NOT a palindrome.", 0

.CODE
main PROC
    mov edx, OFFSET prompt
    call WriteString
    mov edx, OFFSET inputStr
    mov ecx, 30
    call ReadString
    mov length, eax
    dec eax  
    mov ecx, eax
    shr ecx, 1
    mov esi, 0
    mov edi, eax

CHECK_PALINDROME:
    cmp esi, ecx
    jge PALINDROME
    mov al, inputStr[esi]
    mov bl, inputStr[edi]
    cmp al, bl
    jne NOT_PALINDROME
    inc esi
    dec edi
    jmp CHECK_PALINDROME

PALINDROME:
    mov edx, OFFSET msgYes
    call WriteString
    jmp DONE

NOT_PALINDROME:
    mov edx, OFFSET msgNo
    call WriteString

DONE:
    call Crlf
    exit
main ENDP

END main
