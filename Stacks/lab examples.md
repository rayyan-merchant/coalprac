Here are all the coding examples extracted from the PDF:

---

### **Example 1: Stack and Nested Loops**
```assembly
.code
main proc
    mov ecx,5
L1:
    push ecx
    mov ecx, 10
L2:
    inc ebx
    loop L2
    pop ecx
    loop L1
```

---

### **Example 2: Displays the Product of Three Integers Through a Stack**
```assembly
TITLE Reversing a String (Prod.asm)
INCLUDE Irvine32.inc
.data
    multp DWORD 2
.code
main PROC
    mov eax, 1
    mov ecx, 3
L1:
    PUSH multp
    ADD multp, 2
    LOOP L1
    mov ecx, 3
L2:
    POP ebx
    MUL ebx    ;eax value multiply
    LOOP L2
    CALL DumpRegs
    EXIT
main ENDP
END main
```

---

### **Example 3: Find the Largest Number Through a Stack**
```assembly
.code
main PROC
    PUSH 5
    PUSH 7
    PUSH 3
    PUSH 2
    MOV eax, 0    ;eax is the largest
    MOV ecx, 4
L1:
    POP edx
    CMP edx, eax
    JL SET
    MOV eax, edx
SET:
    LOOP L1
    CALL DumpRegs
    EXIT
main ENDP
END main
```

---

### **Example 4: Simple Procedure Call**
```assembly
INCLUDE Irvine32.inc
.data
    var1 DWORD 5
    var2 DWORD 6
.code
main PROC
    call AddTwo
    call writeint
    call crlf
    exit
main ENDP

AddTwo PROC
    mov eax,var1
    mov ebx,var2
    add eax,var2
    ret
AddTwo ENDP
END main
```

---

### **Example 5: Array Sum with Procedures**
```assembly
INCLUDE Irvine32.inc
INTEGER_COUNT = 3
.data
    str1 BYTE "Enter a signed integer: ",0
    str2 BYTE "The sum of the integers is: ",0
    array DWORD INTEGER_COUNT DUP(?)
.code
main PROC
    call Clrscr
    mov esi,OFFSET array
    mov ecx,INTEGER_COUNT
    call PromptForIntegers
    call ArraySum
    call DisplaySum
    exit
main ENDP

PromptForIntegers PROC USES ecx edx esi
    mov edx,OFFSET str1    ; "Enter a signed integer"
L1: 
    call WriteString    ; display string
    call ReadInt    ; read integer into EAX
    call Crlf    ; go to next output line
    mov [esi],eax    ; store in array
    add esi,TYPE DWORD    ; next integer
    loop L1
    ret
PromptForIntegers ENDP

ArraySum PROC USES esi ecx
    mov eax,0    ; set the sum to zero
L1: 
    add eax,[esi]    ; add each integer to sum
    add esi,TYPE DWORD    ; point to next integer
    loop L1    ; repeat for array size
    ret    ; sum is in EAX
ArraySum ENDP

DisplaySum PROC USES edx
    mov edx,OFFSET str2
    call WriteString
    call WriteInt    ; display EAX
    call Crlf
    ret
DisplaySum ENDP
END main
```

---

### **Example 6: Nested Procedure Calls**
```assembly
INCLUDE Irvine32.inc
.data
    var1 DWORD 5
    var2 DWORD 6
.code
main PROC
    call AddTwo
    call dumpregs
    call writeint
    call crlf
    exit
main ENDP

AddTwo PROC
    mov eax,var1
    mov ebx,var2
    add eax,var2
    call AddTwo1
    ret
AddTwo ENDP

AddTwo1 PROC
    mov ecx,var1
    mov edx,var2
    add ecx,var2
    call writeint
    ret
AddTwo1 ENDP
END main
```

---

These examples cover stack operations, procedures, nested loops, and nested procedure calls as discussed in the PDF. Let me know if you'd like further clarification or additional details!
