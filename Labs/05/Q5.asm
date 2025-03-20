/* 
5. Initialize two arrays: 
array1 BYTE 10, 20, 30, 40
array2 BYTE 4 DUP (?)
Copy elements of array1 into array2 in reverse order using either indirect addressing or direct-offset addressing.
Use ESI and EDI Registers. (Hint: INC and DEC of OFFSET). 
*/

INCLUDE irvine32.inc
.DATA
    array1 BYTE 10, 20, 30, 40
    array2 BYTE 4 DUP (?)
    msg BYTE "Reversed array: ", 0

.CODE
main PROC
    mov esi, 3         
    mov edi, 0        

    mov al, [array1 + esi] 
    mov [array2 + edi], al
    dec esi
    inc edi

    mov al, [array1 + esi] 
    mov [array2 + edi], al
    dec esi
    inc edi

    mov al, [array1 + esi] 
    mov [array2 + edi], al
    dec esi
    inc edi

    mov al, [array1 + esi] 
    mov [array2 + edi], al

    ; Print
    mov edx, OFFSET msg
    call WriteString
    call Crlf
    mov esi, 0       
    mov ecx, 4    

print:
    movzx eax, BYTE PTR [array2 + esi]
    call WriteInt
    call Crlf
    inc esi
    loop print

    call DumpRegs
    exit
main ENDP
END main
