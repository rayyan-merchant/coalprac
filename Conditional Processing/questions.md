Here are the **solutions for the first 5 conditional processing questions** using **MASM and the Irvine32 library**.

---

## ✅ **Question 1: Check Even or Odd**

### 🔧 **Code:**

```asm
INCLUDE Irvine32.inc

.data
msgEven BYTE "The number is even.", 0
msgOdd  BYTE "The number is odd.", 0

.code
main PROC
    call ReadInt
    mov ebx, 2
    xor edx, edx
    div ebx

    cmp edx, 0
    je Even

Odd:
    mov edx, OFFSET msgOdd
    call WriteString
    jmp ExitProgram

Even:
    mov edx, OFFSET msgEven
    call WriteString

ExitProgram:
    call Crlf
    exit
main ENDP
END main
```

---

## ✅ **Question 2: Find the Maximum of Three Integers**

### 🔧 **Code:**

```asm
INCLUDE Irvine32.inc

.data
msg BYTE "Maximum is: ", 0

.code
main PROC
    call ReadInt
    mov eax, eax        ; first number
    call ReadInt
    mov ebx, eax        ; second number
    call ReadInt
    mov ecx, eax        ; third number

    ; Compare eax and ebx
    cmp ebx, eax
    jle Skip1
    mov eax, ebx
Skip1:
    cmp ecx, eax
    jle Skip2
    mov eax, ecx
Skip2:
    mov edx, OFFSET msg
    call WriteString
    call WriteInt
    call Crlf
    exit
main ENDP
END main
```

---

## ✅ **Question 3: Positive, Negative, or Zero**

### 🔧 **Code:**

```asm
INCLUDE Irvine32.inc

.data
msgPos BYTE "The number is positive.", 0
msgNeg BYTE "The number is negative.", 0
msgZero BYTE "The number is zero.", 0

.code
main PROC
    call ReadInt

    cmp eax, 0
    je ZeroCase
    jl Negative

Positive:
    mov edx, OFFSET msgPos
    jmp PrintMsg

Negative:
    mov edx, OFFSET msgNeg
    jmp PrintMsg

ZeroCase:
    mov edx, OFFSET msgZero

PrintMsg:
    call WriteString
    call Crlf
    exit
main ENDP
END main
```

---

## ✅ **Question 4: Grade Calculator**

### 🔧 **Code:**

```asm
INCLUDE Irvine32.inc

.data
msgA BYTE "Grade: A", 0
msgB BYTE "Grade: B", 0
msgC BYTE "Grade: C", 0
msgD BYTE "Grade: D", 0
msgF BYTE "Grade: F", 0

.code
main PROC
    call ReadInt

    cmp eax, 90
    jge GradeA
    cmp eax, 80
    jge GradeB
    cmp eax, 70
    jge GradeC
    cmp eax, 60
    jge GradeD

    mov edx, OFFSET msgF
    jmp Show

GradeA:
    mov edx, OFFSET msgA
    jmp Show
GradeB:
    mov edx, OFFSET msgB
    jmp Show
GradeC:
    mov edx, OFFSET msgC
    jmp Show
GradeD:
    mov edx, OFFSET msgD

Show:
    call WriteString
    call Crlf
    exit
main ENDP
END main
```

---

## ✅ **Question 5: Absolute Value**

### 🔧 **Code:**

```asm
INCLUDE Irvine32.inc

.data
msg BYTE "Absolute value: ", 0

.code
main PROC
    call ReadInt
    cmp eax, 0
    jge Display

    neg eax

Display:
    mov edx, OFFSET msg
    call WriteString
    call WriteInt
    call Crlf
    exit
main ENDP
END main
```

---

Great! Here are the **solutions for Questions 6–10** on **Conditional Processing** in MASM using the **Irvine32 library**:

---

## ✅ **Question 6: Leap Year Checker**

### 🔧 **Code:**

```asm
INCLUDE Irvine32.inc

.data
msgYes BYTE "Leap year", 0
msgNo  BYTE "Not a leap year", 0

.code
main PROC
    call ReadInt            ; Input year
    mov ebx, eax            ; Save year in EBX

    ; Check if divisible by 4
    mov eax, ebx
    mov ecx, 4
    xor edx, edx
    div ecx
    cmp edx, 0
    jne NotLeap

    ; If divisible by 100
    mov eax, ebx
    mov ecx, 100
    xor edx, edx
    div ecx
    cmp edx, 0
    jne LeapYear

    ; If divisible by 400
    mov eax, ebx
    mov ecx, 400
    xor edx, edx
    div ecx
    cmp edx, 0
    je LeapYear

NotLeap:
    mov edx, OFFSET msgNo
    jmp Print

LeapYear:
    mov edx, OFFSET msgYes

Print:
    call WriteString
    call Crlf
    exit
main ENDP
END main
```

---

## ✅ **Question 7: Simple Calculator (`+`, `-`, `*`, `/`)**

### 🔧 **Code:**

```asm
INCLUDE Irvine32.inc

.data
msg BYTE "Enter operation (+, -, *, /): ", 0
resultMsg BYTE "Result: ", 0
opChar BYTE ?

.code
main PROC
    call ReadInt        ; First number
    mov ebx, eax

    call ReadInt        ; Second number
    mov ecx, eax

    ; Get operator
    mov edx, OFFSET msg
    call WriteString
    call ReadChar
    mov opChar, al

    mov eax, ebx
    mov edx, 0

    mov al, opChar
    cmp al, '+'
    je Add
    cmp al, '-'
    je Sub
    cmp al, '*'
    je Mul
    cmp al, '/'
    je Div

    jmp Done

Add:
    add eax, ecx
    jmp Show

Sub:
    sub eax, ecx
    jmp Show

Mul:
    imul eax, ecx
    jmp Show

Div:
    xor edx, edx
    mov eax, ebx
    div ecx
    jmp Show

Show:
    mov edx, OFFSET resultMsg
    call WriteString
    call WriteInt
    call Crlf

Done:
    exit
main ENDP
END main
```

---

## ✅ **Question 8: Range Validator (10 to 100)**

### 🔧 **Code:**

```asm
INCLUDE Irvine32.inc

.data
inRange BYTE "Number is within range (10–100)", 0
outRange BYTE "Number is outside range", 0

.code
main PROC
    call ReadInt

    cmp eax, 10
    jl NotInRange
    cmp eax, 100
    jg NotInRange

    mov edx, OFFSET inRange
    jmp Print

NotInRange:
    mov edx, OFFSET outRange

Print:
    call WriteString
    call Crlf
    exit
main ENDP
END main
```

---

## ✅ **Question 9: Min and Max of an Array of 10 Integers**

### 🔧 **Code:**

```asm
INCLUDE Irvine32.inc

.data
arr DWORD 10 DUP(?)
msgMin BYTE "Minimum: ", 0
msgMax BYTE "Maximum: ", 0

.code
main PROC
    ; Input 10 numbers
    mov ecx, 10
    mov edi, OFFSET arr
InputLoop:
    call ReadInt
    mov [edi], eax
    add edi, 4
    loop InputLoop

    ; Initialize min and max
    mov esi, OFFSET arr
    mov eax, [esi]       ; min = eax
    mov ebx, [esi]       ; max = ebx

    mov ecx, 9
    add esi, 4

FindMinMax:
    mov edx, [esi]

    cmp edx, eax         ; Check min
    jl SetMin
    cmp edx, ebx         ; Check max
    jg SetMax
    jmp Next

SetMin:
    mov eax, edx
    jmp CheckMax

SetMax:
    mov ebx, edx

CheckMax:
    ; Both conditions might update
Next:
    add esi, 4
    loop FindMinMax

    ; Print min
    mov edx, OFFSET msgMin
    call WriteString
    mov eax, eax
    call WriteInt
    call Crlf

    ; Print max
    mov edx, OFFSET msgMax
    call WriteString
    mov eax, ebx
    call WriteInt
    call Crlf

    exit
main ENDP
END main
```

---

## ✅ **Question 10: Password Checker**

### 🔧 **Code:**

```asm
INCLUDE Irvine32.inc

.data
correctPwd BYTE "open123", 0
inputPwd BYTE 20 DUP(0)
msgPrompt BYTE "Enter password: ", 0
msgOK BYTE "Access granted", 0
msgFail BYTE "Access denied", 0

.code
main PROC
    mov edx, OFFSET msgPrompt
    call WriteString
    mov edx, OFFSET inputPwd
    mov ecx, 20
    call ReadString

    ; EAX = number of chars
    mov esi, OFFSET inputPwd
    mov edi, OFFSET correctPwd

CompareLoop:
    mov al, [esi]
    mov bl, [edi]
    cmp al, bl
    jne Denied
    cmp al, 0
    je Accepted
    inc esi
    inc edi
    jmp CompareLoop

Accepted:
    mov edx, OFFSET msgOK
    jmp Display

Denied:
    mov edx, OFFSET msgFail

Display:
    call WriteString
    call Crlf
    exit
main ENDP
END main
```

---
