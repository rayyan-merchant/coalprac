

---

### ✅ **Q1. Count the number of set bits in a 32-bit integer using SHR**

```asm
INCLUDE Irvine32.inc

.data
number DWORD 0F35A23Bh
count  DWORD ?

.code
main PROC
    mov eax, number
    xor ecx, ecx          ; Bit count = 0
    mov ebx, 32

count_loop:
    shr eax, 1            ; Shift right, LSB into CF
    jc increment          ; If CF=1, it's a set bit
    jmp skip
increment:
    inc ecx
skip:
    dec ebx
    jnz count_loop

    mov count, ecx
    call Crlf
    mov eax, count
    call WriteDec
    call Crlf

    exit
main ENDP
END main
```

---

### ✅ **Q2. Circularly rotate the bits of a 16-bit number left by 3 using ROL**

```asm
INCLUDE Irvine32.inc

.data
value WORD 0ABCDh

.code
main PROC
    mov ax, value
    rol ax, 3             ; Rotate left by 3 bits
    call Crlf
    movzx eax, ax
    call WriteHex
    call Crlf
    exit
main ENDP
END main
```

---

### ✅ **Q3. Divide a 32-bit number by 8 using SHR and verify with DIV**

```asm
INCLUDE Irvine32.inc

.data
num DWORD 128
result1 DWORD ?
result2 DWORD ?

.code
main PROC
    ; Using SHR
    mov eax, num
    shr eax, 3
    mov result1, eax

    ; Using actual division
    mov eax, num
    xor edx, edx
    mov ebx, 8
    div ebx
    mov result2, eax

    ; Display both results
    call Crlf
    mov eax, result1
    call WriteString
    call WriteDec
    call Crlf

    mov eax, result2
    call WriteDec
    call Crlf

    exit
main ENDP
END main
```

---

### ✅ **Q4. Check if a number is a power of 2 using shift operations**

```asm
INCLUDE Irvine32.inc

.data
num DWORD 64

.code
main PROC
    mov eax, num
    test eax, eax
    jz not_power2         ; 0 is not a power of 2

    mov ebx, eax
    dec ebx
    and ebx, eax
    jz is_power2

not_power2:
    call Crlf
    mov edx, OFFSET msgNot
    call WriteString
    jmp done

is_power2:
    call Crlf
    mov edx, OFFSET msgYes
    call WriteString

done:
    call Crlf
    exit

msgYes BYTE "Number is a power of 2", 0
msgNot BYTE "Number is NOT a power of 2", 0

main ENDP
END main
```

---

### ✅ **Q5. Swap the high and low bytes of a 16-bit number using ROL and SHR**

```asm
INCLUDE Irvine32.inc

.data
val WORD 1234h

.code
main PROC
    mov ax, val
    xchg ah, al        ; Swap the bytes
    movzx eax, ax
    call WriteHex
    call Crlf
    exit
main ENDP
END main
```

---


Here are the **solutions for Questions 6–10**, involving **Multiplication and Division** using MASM and the **Irvine32 library**.

---

### ✅ **Q6. Multiply Two 16-bit Signed Integers and Store the 32-bit Result**

```asm
INCLUDE Irvine32.inc

.data
num1 WORD -15
num2 WORD 10
result DWORD ?

.code
main PROC
    ; Load the 16-bit signed integers into ax and bx
    mov ax, num1
    mov bx, num2
    
    ; Perform signed multiplication (MUL handles unsigned, IMUL for signed)
    imul eax, ax, bx     ; Result is in eax (32-bit result)

    ; Store result
    mov result, eax

    ; Print the result
    call Crlf
    mov eax, result
    call WriteDec
    call Crlf

    exit
main ENDP
END main
```

---

### ✅ **Q7. Divide a 32-bit Unsigned Integer by a 16-bit Value and Show Quotient and Remainder**

```asm
INCLUDE Irvine32.inc

.data
num1 DWORD 12345
num2 WORD 100
quotient DWORD ?
remainder DWORD ?

.code
main PROC
    ; Load the numbers
    mov eax, num1        ; Dividend
    mov ebx, num2        ; Divisor
    xor edx, edx         ; Clear edx (for division)

    ; Perform division
    div bx               ; eax = quotient, edx = remainder

    ; Store results
    mov quotient, eax
    mov remainder, edx

    ; Print the results
    call Crlf
    mov eax, quotient
    call WriteDec
    call WriteString
    mov edx, OFFSET str_quotient
    call WriteString
    call Crlf

    mov eax, remainder
    call WriteDec
    call WriteString
    mov edx, OFFSET str_remainder
    call WriteString
    call Crlf

    exit
main ENDP

.data
str_quotient BYTE " (Quotient)", 0
str_remainder BYTE " (Remainder)", 0

END main
```

---

### ✅ **Q8. Convert Seconds (Input) into Hours, Minutes, and Seconds Using Division**

```asm
INCLUDE Irvine32.inc

.data
seconds DWORD 3665
hours DWORD ?
minutes DWORD ?
remaining_seconds DWORD ?
prompt BYTE "Enter number of seconds: ", 0

.code
main PROC
    ; Ask for input
    mov edx, OFFSET prompt
    call WriteString
    call ReadDec
    mov eax, seconds

    ; Convert to hours
    mov ecx, 3600         ; 1 hour = 3600 seconds
    div ecx
    mov hours, eax        ; Store quotient (hours)
    
    ; Convert to minutes
    mov ecx, 60           ; 1 minute = 60 seconds
    div ecx
    mov minutes, eax      ; Store quotient (minutes)
    mov remaining_seconds, edx ; Remainder = remaining seconds

    ; Display results
    call Crlf
    mov eax, hours
    call WriteDec
    call WriteString
    mov edx, OFFSET str_hours
    call WriteString
    call Crlf

    mov eax, minutes
    call WriteDec
    call WriteString
    mov edx, OFFSET str_minutes
    call WriteString
    call Crlf

    mov eax, remaining_seconds
    call WriteDec
    call WriteString
    mov edx, OFFSET str_seconds
    call WriteString
    call Crlf

    exit
main ENDP

.data
str_hours BYTE " hours", 0
str_minutes BYTE " minutes", 0
str_seconds BYTE " seconds", 0

END main
```

---

### ✅ **Q9. Calculate the Area of a Triangle Using Formula `(base * height) / 2` with Integer Division**

```asm
INCLUDE Irvine32.inc

.data
base DWORD 10
height DWORD 5
area DWORD ?

.code
main PROC
    ; Load base and height
    mov eax, base
    mov ebx, height

    ; Multiply base and height
    imul eax, ebx        ; eax = base * height

    ; Divide by 2 (integer division)
    mov ecx, 2
    div ecx              ; quotient in eax

    ; Store the result (area)
    mov area, eax

    ; Print the result (area)
    call Crlf
    mov eax, area
    call WriteDec
    call Crlf

    exit
main ENDP
END main
```

---

### ✅ **Q10. Find the Product of Elements in an Array of 5 Positive 16-bit Numbers**

```asm
INCLUDE Irvine32.inc

.data
arr WORD 3, 5, 2, 8, 7
product DWORD 1

.code
main PROC
    lea esi, arr
    mov ecx, 5           ; Number of elements
    xor eax, eax         ; Initialize product to 1

multiply_loop:
    movzx ebx, word ptr [esi]  ; Load each array element into ebx
    imul eax, ebx         ; Multiply the product by the element
    add esi, 2            ; Move to the next element (each element is 2 bytes)
    loop multiply_loop

    ; Store result in product
    mov product, eax

    ; Display the result
    call Crlf
    mov eax, product
    call WriteDec
    call Crlf

    exit
main ENDP
END main
```

---


Here are the **solutions for Questions 11–15**, involving **Extended Addition and Subtraction** using MASM and the **Irvine32 library**.

---

### ✅ **Q11. Add Two 64-bit Integers Stored as Double DWORDs Using `ADC`**

```asm
INCLUDE Irvine32.inc

.data
num1Low DWORD 12345678h
num1High DWORD 9ABCDEF0h
num2Low DWORD 87654321h
num2High DWORD 0FEDCBA0h
sumLow DWORD ?
sumHigh DWORD ?

.code
main PROC
    ; Load the first 64-bit number
    mov eax, num1Low
    mov ebx, num1High
    
    ; Add the second 64-bit number
    add eax, num2Low       ; Add lower DWORDs
    adc ebx, num2High      ; Add higher DWORDs with carry

    ; Store the result
    mov sumLow, eax
    mov sumHigh, ebx

    ; Display the result
    call Crlf
    mov eax, sumHigh
    call WriteHex
    mov eax, sumLow
    call WriteHex
    call Crlf

    exit
main ENDP
END main
```

---

### ✅ **Q12. Subtract Two 64-bit Integers Stored as Double DWORDs Using `SBB`**

```asm
INCLUDE Irvine32.inc

.data
num1Low DWORD 87654321h
num1High DWORD 1A2B3C4Dh
num2Low DWORD 12345678h
num2High DWORD 9ABCDEF0h
diffLow DWORD ?
diffHigh DWORD ?

.code
main PROC
    ; Load the first 64-bit number
    mov eax, num1Low
    mov ebx, num1High
    
    ; Subtract the second 64-bit number
    sub eax, num2Low       ; Subtract lower DWORDs
    sbb ebx, num2High      ; Subtract higher DWORDs with borrow

    ; Store the result
    mov diffLow, eax
    mov diffHigh, ebx

    ; Display the result
    call Crlf
    mov eax, diffHigh
    call WriteHex
    mov eax, diffLow
    call WriteHex
    call Crlf

    exit
main ENDP
END main
```

---

### ✅ **Q13. Create a 128-bit Adder (4 DWORDs per Number) Using `ADD` and `ADC`**

```asm
INCLUDE Irvine32.inc

.data
num1Low DWORD 11111111h
num1MidLow DWORD 22222222h
num1MidHigh DWORD 33333333h
num1High DWORD 44444444h
num2Low DWORD 55555555h
num2MidLow DWORD 66666666h
num2MidHigh DWORD 77777777h
num2High DWORD 88888888h
sumLow DWORD ?
sumMidLow DWORD ?
sumMidHigh DWORD ?
sumHigh DWORD ?

.code
main PROC
    ; Load the first 128-bit number
    mov eax, num1Low
    mov ebx, num1MidLow
    mov ecx, num1MidHigh
    mov edx, num1High

    ; Add the second 128-bit number
    add eax, num2Low       ; Add low parts
    adc ebx, num2MidLow    ; Add mid-low parts with carry
    adc ecx, num2MidHigh   ; Add mid-high parts with carry
    adc edx, num2High      ; Add high parts with carry

    ; Store the result
    mov sumLow, eax
    mov sumMidLow, ebx
    mov sumMidHigh, ecx
    mov sumHigh, edx

    ; Display the result
    call Crlf
    mov eax, sumHigh
    call WriteHex
    mov eax, sumMidHigh
    call WriteHex
    mov eax, sumMidLow
    call WriteHex
    mov eax, sumLow
    call WriteHex
    call Crlf

    exit
main ENDP
END main
```

---

### ✅ **Q14. Implement Multi-Precision Increment (e.g., Increment a 96-bit Integer)**

```asm
INCLUDE Irvine32.inc

.data
numLow DWORD 1
numMidLow DWORD 0
numMidHigh DWORD 0
numHigh DWORD 0
resultLow DWORD ?
resultMidLow DWORD ?
resultMidHigh DWORD ?
resultHigh DWORD ?

.code
main PROC
    ; Load the 96-bit number
    mov eax, numLow
    mov ebx, numMidLow
    mov ecx, numMidHigh
    mov edx, numHigh

    ; Increment the 96-bit number
    inc eax               ; Increment the low part
    jnc no_carry          ; If no carry, skip the next increment
    inc ebx               ; Increment the middle low part
    jnc no_midcarry
    inc ecx               ; Increment the middle high part
    jnc no_midhighcarry
    inc edx               ; Increment the high part

no_carry:
no_midcarry:
no_midhighcarry:

    ; Store the result
    mov resultLow, eax
    mov resultMidLow, ebx
    mov resultMidHigh, ecx
    mov resultHigh, edx

    ; Display the result
    call Crlf
    mov eax, resultHigh
    call WriteHex
    mov eax, resultMidHigh
    call WriteHex
    mov eax, resultMidLow
    call WriteHex
    mov eax, resultLow
    call WriteHex
    call Crlf

    exit
main ENDP
END main
```

---

### ✅ **Q15. Add Two Large Unsigned Integers and Handle Overflow Reporting via Carry Flag**

```asm
INCLUDE Irvine32.inc

.data
num1Low DWORD FFFFFFFFh
num1High DWORD FFFFFFFFh
num2Low DWORD 1
num2High DWORD 0
resultLow DWORD ?
resultHigh DWORD ?
overflowMsg BYTE "Overflow occurred!", 0
noOverflowMsg BYTE "No overflow", 0

.code
main PROC
    ; Load the first 64-bit number
    mov eax, num1Low
    mov ebx, num1High

    ; Add the second 64-bit number
    add eax, num2Low       ; Add lower DWORDs
    adc ebx, num2High      ; Add higher DWORDs with carry

    ; Check for overflow (if carry flag is set)
    jc overflow

    ; Store result and show no overflow message
    mov resultLow, eax
    mov resultHigh, ebx
    call Crlf
    mov eax, resultHigh
    call WriteHex
    mov eax, resultLow
    call WriteHex
    call Crlf
    mov edx, OFFSET noOverflowMsg
    call WriteString
    jmp done

overflow:
    ; Overflow occurred, show overflow message
    call Crlf
    mov edx, OFFSET overflowMsg
    call WriteString

done:
    exit
main ENDP
END main
```

---

