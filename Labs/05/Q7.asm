/* 7. Use following array declarations:
arrayB BYTE 60, 70, 80
arrayW WORD 150, 250, 350
arrayD DWORD 600, 1200, 1800
For each array, add its 1st and last element using scale factors and display the result in a separate register. 
(Hint: Use ESI and TYPE Operator). */

INCLUDE irvine32.inc
.DATA
    arrayB BYTE 60, 70, 80
    arrayW WORD 150, 250, 350
    arrayD DWORD 600, 1200, 1800
    sumB DWORD ?
    sumW DWORD ?
    sumD DWORD ?
    msgB BYTE "Sum of arrayB: ", 0
    msgW BYTE "Sum of arrayW: ", 0
    msgD BYTE "Sum of arrayD: ", 0

.CODE
main PROC
    mov esi, OFFSET arrayB
    movzx eax, BYTE PTR [esi]                           
    movzx ebx, BYTE PTR [esi + (2 * TYPE arrayB)]      
    add eax, ebx
    mov sumB, eax

    mov esi, OFFSET arrayW
    movzx eax, WORD PTR [esi]                         
    movzx ebx, WORD PTR [esi + (2 * TYPE arrayW)]      
    add eax, ebx
    mov sumW, eax

    mov esi, OFFSET arrayD
    mov eax, DWORD PTR [esi]                         
    mov ebx, DWORD PTR [esi + (2 * TYPE arrayD)]       
    add eax, ebx
    mov sumD, eax

    mov edx, OFFSET msgB
    call WriteString
    mov eax, sumB
    call WriteInt
    call Crlf

    mov edx, OFFSET msgW
    call WriteString
    mov eax, sumW
    call WriteInt
    call Crlf

    mov edx, OFFSET msgD
    call WriteString
    mov eax, sumD
    call WriteInt
    call Crlf

    exit
main ENDP
END main
