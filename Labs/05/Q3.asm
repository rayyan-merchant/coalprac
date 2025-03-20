/* 3. Initialize a Byte array consisting of elements 61,43,11,52, 25. Sort the given array in ascending
order directly with the help of registers (you do not need to use a loop here). Use direct-offset
addressing to access the array elements. (Hint: Use new array for sorted elements). What
would be changes in code if declared array was of WORD and DWORD size? */

INCLUDE Irvine32.inc  
.DATA
    arr BYTE 61, 43, 11, 52, 25  
    arr2 BYTE 5 DUP(?)           
    msg BYTE "Sorted array: ",0
    count DWORD 5           

.CODE
main PROC
    mov al, [arr+2]  
    mov [arr2], al    
    mov al, [arr+4] 
    mov [arr2+1], al  
    mov al, [arr+1]   
    mov [arr2+2], al  
    mov al, [arr+3]   
    mov [arr2+3], al  
    mov al, [arr]    
    mov [arr2+4], al  

    mov edx, OFFSET msg  
    call WriteString
    mov ecx, count    
    mov esi, OFFSET arr2 

print:
    movzx eax, BYTE PTR [esi] 
    call WriteDec           
    call Crlf
    inc esi                
    loop print         

    call DumpRegs  
    exit
main ENDP
END main
