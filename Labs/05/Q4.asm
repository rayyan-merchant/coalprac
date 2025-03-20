/* 4. Use following array declarations:
arrayB BYTE 10, 20, 30 arrayW
WORD 150, 250, 350 arrayD
DWORD 600, 1200, 1800 
Now initialize three double word variables SUM1, SUM2, SUM3 and perform following operations (expressed in pseudo-code here):
SUM1 = arrayB[0] + arrayW[0] + arrayD[0]
SUM2 = arrayB[1] + arrayW[1] + arrayD[1]
SUM3 = arrayB[2] + arrayW[2] + arrayD[2]
*/

INCLUDE irvine32.inc
.DATA
    arrayB BYTE 10, 20, 30 
    arrayW WORD 150, 250, 350 
    arrayD DWORD 600, 1200, 1800
    SUM1 DWORD ?
    SUM2 DWORD ?
    SUM3 DWORD ?
    msg1 BYTE "SUM1: ", 0
    msg2 BYTE "SUM2: ", 0
    msg3 BYTE "SUM3: ", 0

.CODE
main PROC
    ; SUM1
    movzx eax, BYTE PTR [arrayB]   
    movzx ebx, WORD PTR [arrayW]   
    mov ecx, DWORD PTR [arrayD]    
    add eax, ebx
    add eax, ecx
    mov SUM1, eax

    ; SUM2
    movzx eax, BYTE PTR [arrayB+1] 
    movzx ebx, WORD PTR [arrayW+2] 
    mov ecx, DWORD PTR [arrayD+4]  
    add eax, ebx
    add eax, ecx
    mov SUM2, eax

    ; SUM3
    movzx eax, BYTE PTR [arrayB+2] 
    movzx ebx, WORD PTR [arrayW+4] 
    mov ecx, DWORD PTR [arrayD+8] 
    add eax, ebx
    add eax, ecx
    mov SUM3, eax

    ; Print SUM1
    mov edx, OFFSET msg1
    call WriteString
    mov eax, SUM1
    call WriteInt
    call Crlf

    ; Print SUM2
    mov edx, OFFSET msg2
    call WriteString
    mov eax, SUM2
    call WriteInt
    call Crlf

    ; Print SUM3
    mov edx, OFFSET msg3
    call WriteString
    mov eax, SUM3
    call WriteInt
    call Crlf

    call DumpRegs
    exit
main ENDP
END main
