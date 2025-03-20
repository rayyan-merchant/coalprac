INCLUDE Irvine32.inc

.DATA
    prompt BYTE "Enter a string: ", 0
    inputStr BYTE 30 DUP(0)  
    length DWORD ?
    newline BYTE 0Dh, 0Ah, 0

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

REVERSE_LOOP:
    cmp esi, ecx
    jge PRINT_REVERSED
    mov al, inputStr[esi]
    mov bl, inputStr[edi]
    mov inputStr[esi], bl
    mov inputStr[edi], al
    inc esi
    dec edi
    jmp REVERSE_LOOP

PRINT_REVERSED:
    mov edx, OFFSET inputStr
    call WriteString
    call Crlf

    exit
main ENDP

END main
