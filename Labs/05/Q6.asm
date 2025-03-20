/* 6. Subtract an array of 5 doublewords using indirect operands. Save the final result in a variable. */

INCLUDE irvine32.inc
.DATA
    arr DWORD 100, 20, 30, 15, 10
    finalResult DWORD ?
    msg BYTE "Final Result: ", 0

.CODE
main PROC
    mov esi, OFFSET arr   
    mov eax, [esi]       
    add esi, 4          
    mov ecx, 4           

subtract:
    sub eax, [esi]       
    add esi, 4            
    loop subtract  

    mov finalResult, eax  

    ; print
    mov edx, OFFSET msg
    call WriteString
    mov eax, finalResult
    call WriteInt
    call Crlf

    call DumpRegs
    exit
main ENDP
END main
