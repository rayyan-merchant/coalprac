### **Task 1: Calculate `EAX * 21` Using Shifts (MASM + Irvine32)**  
```asm
.386
.model flat, stdcall
.stack 4096
include Irvine32.inc

.data
    original_x DWORD ?

.code
main PROC
    mov eax, 5        ; Example: EAX = 5
    mov original_x, eax ; Save original value

    ; Calculate EAX * 21
    mov ebx, eax      ; EBX = x
    shl eax, 4        ; EAX = x * 16
    shl ebx, 2        ; EBX = x * 4
    add eax, ebx      ; EAX = 20x
    add eax, original_x ; EAX = 21x

    call DumpRegs     ; Show result
    exit
main ENDP
END main
```

---

### **Task 2: Move `-128` into AX and Sign-Extend to EAX**  
```asm
.386
.model flat, stdcall
.stack 4096
include Irvine32.inc

.code
main PROC
    mov ax, -128      ; AX = FF80h (-128)
    shl eax, 16       ; Clear upper bits
    sar eax, 16       ; Sign-extend EAX

    call DumpRegs     ; Verify EAX = FFFFFF80h
    exit
main ENDP
END main
```

---

### **Task 3: Shift AX's Bits into BX (Without/With SHRD)**  
```asm
.386
.model flat, stdcall
.stack 4096
include Irvine32.inc

.code
main PROC
    ; Without SHRD
    mov ax, 1234h     ; Example AX value
    mov bx, 5678h     ; Example BX value
    mov cx, 16        ; Loop counter

  L1:
    shr ax, 1         ; Shift LSB of AX into CF
    rcr bx, 1         ; Shift CF into MSB of BX
    loop L1

    ; With SHRD
    mov ax, 1234h     ; Reset AX
    mov bx, 5678h     ; Reset BX
    shrd bx, ax, 16   ; Shift all 16 bits

    call DumpRegs     ; Check results
    exit
main ENDP
END main
```

---

### **Task 4: Implement `val1 = (val2 / val3) * (val1 / val2)`**  
```asm
.386
.model flat, stdcall
.stack 4096
include Irvine32.inc

.data
    val1 SDWORD -200
    val2 SDWORD 10
    val3 SDWORD 5

.code
main PROC
    ; Compute val2 / val3
    mov eax, val2
    cdq               ; Sign-extend EAX to EDX:EAX
    idiv val3         ; EAX = val2 / val3
    mov ebx, eax      ; Save result

    ; Compute val1 / val2
    mov eax, val1
    cdq               ; Sign-extend EAX to EDX:EAX
    idiv val2         ; EAX = val1 / val2

    ; Multiply results
    imul ebx          ; EDX:EAX = (val2/val3) * (val1/val2)
    mov val1, eax     ; Update val1

    call DumpRegs     ; Verify val1
    exit
main ENDP
END main
```

---

### **Task 5: Extended_Add Procedure for 64-bit Integers**  
```asm
.386
.model flat, stdcall
.stack 4096
include Irvine32.inc

.data
    num1 QWORD 123456789ABCDEF0h ; Example 64-bit number
    num2 QWORD 0FEDCBA9876543210h ; Example 64-bit number
    result QWORD 0

.code
Extended_Add PROC
    ; Input: ESI = pointer to num1
    ;        EDI = pointer to num2
    ;        EBX = pointer to result
    mov eax, [esi]      ; Lower 32 bits of num1
    add eax, [edi]      ; Add lower 32 bits of num2
    mov [ebx], eax      ; Store lower result

    mov eax, [esi+4]    ; Upper 32 bits of num1
    adc eax, [edi+4]    ; Add upper bits with carry
    mov [ebx+4], eax    ; Store upper result
    ret
Extended_Add ENDP

main PROC
    mov esi, OFFSET num1
    mov edi, OFFSET num2
    mov ebx, OFFSET result
    call Extended_Add

    ; Display result
    mov eax, DWORD PTR [result+4] ; Upper 32 bits
    call WriteHex
    mov eax, DWORD PTR [result]   ; Lower 32 bits
    call WriteHex
    exit
main ENDP
END main
```

---

