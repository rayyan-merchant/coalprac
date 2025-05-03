Here's the combined markdown (MD) format for all the provided assembly code examples:

```markdown
# Assembly Code Examples

## Task 1: Move Word-Type Data Using Stack Push/Pop
```assembly
INCLUDE Irvine32.inc
.DATA
    sourceArray WORD 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
    destinationArray WORD 10 DUP(?)
.CODE
main PROC
    mov esi, OFFSET sourceArray
    mov edi, OFFSET destinationArray
    mov ecx, 10
pushLoop:
    mov ax, [esi]
    push ax
    add esi, 2
    loop pushLoop
    mov ecx, 10
popLoop:
    pop ax
    mov [edi], ax
    add edi, 2
    loop popLoop
    CALL DUMPREGS
    exit
main ENDP
END main
```

---

## Task 2: Display Addition of Three Integers Through Stack
```assembly
INCLUDE Irvine32.inc
.DATA
    sum DWORD 0
    msg1 BYTE "Enter first number: ", 0
    msg2 BYTE "Enter second number: ", 0
    msg3 BYTE "Enter third number: ", 0
    msg4 BYTE "The sum is: ", 0
.CODE
main PROC
    call Clrscr

    mov edx, OFFSET msg1
    call WriteString
    call ReadInt
    push eax

    mov edx, OFFSET msg2
    call WriteString
    call ReadInt
    push eax 

    mov edx, OFFSET msg3
    call WriteString
    call ReadInt
    push eax

    pop eax 
    pop ebx 
    add eax, ebx
    pop ecx
    add eax, ecx

    mov sum, eax
    mov edx, OFFSET msg4
    call WriteString
    mov eax, sum
    call WriteInt
    call Crlf

    exit
main ENDP
END main
```

---

## Task 3: Sum of Two Arrays Using Procedures
```assembly
INCLUDE Irvine32.inc
.data
    array1 DWORD 10, 20, 30, 40, 50
    array2 DWORD 5, 15, 25, 35, 45
    sum1 DWORD ?
    sum2 DWORD ?
    totalSum DWORD ?
.code
main PROC
    call SumArray1
    call SumArray2
    call AddSums

    mov eax, totalSum
    call WriteInt
    call Crlf
    exit
main ENDP

SumArray1 PROC
    mov ecx, LENGTHOF array1
    lea esi, array1
    xor eax, eax        
sum_loop1:
    add eax, [esi]
    add esi, 4
    loop sum_loop1
    mov sum1, eax
    ret
SumArray1 ENDP

SumArray2 PROC
    mov ecx, LENGTHOF array2
    lea esi, array2
    xor eax, eax       
sum_loop2:
    add eax, [esi]
    add esi, 4
    loop sum_loop2
    mov sum2, eax
    ret
SumArray2 ENDP

AddSums PROC
    mov eax, sum1
    add eax, sum2
    mov totalSum, eax
    ret
AddSums ENDP
END main
```

---

## Task 4: Print Pattern Using Function Calls
```assembly
INCLUDE Irvine32.inc
.data 
    rows DWORD 5
    star BYTE "*", 0
    space BYTE " ", 0
.code
main PROC
    mov ecx, rows        
    mov ebx, 1           
outer:
    mov edx, rows
    sub edx, ebx        
    call printspaces  
    mov edx, ebx         
    call printstars    
    call Crlf         
    inc ebx
    cmp ebx, rows + 1    
    jl outer
    exit
main ENDP

printspaces PROC
    mov ecx, edx
ps_loop:
    cmp ecx, 0
    jle ps_end
    mov edx, OFFSET space
    call WriteString
    dec ecx
    jmp ps_loop
ps_end:
    ret
printspaces ENDP

printstars PROC
    mov ecx, edx
st_loop:
    cmp ecx, 0
    jle st_end
    mov edx, OFFSET star
    call WriteString
    dec ecx
    jmp st_loop
st_end:
    ret
printstars ENDP
END main
```

---

## Task 5: Sum of Numbers from 1 to n
```assembly
INCLUDE Irvine32.inc
.data
    prompt BYTE "Enter a number: ", 0
    sumMsg BYTE "The sum from 1 to n is: ", 0
    n DWORD ?
    sum DWORD ?
.code
main PROC
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov n, eax         
    call SumToN
    mov edx, OFFSET sumMsg
    call WriteString
    mov eax, sum
    call WriteInt
    call Crlf
    exit
main ENDP

SumToN PROC
    mov ecx, n
    xor eax, eax        
sum_loop:
    add eax, ecx
    loop sum_loop       
    mov sum, eax
    ret
SumToN ENDP
END main
```
```

This markdown format organizes each task with clear headings and syntax highlighting for assembly code. Let me know if you'd like any modifications!
