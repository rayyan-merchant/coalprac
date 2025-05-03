
---

## ✅ **Question 1: Reverse a String using Stack**

### 🔧 **Sample Code:**

```asm
INCLUDE Irvine32.inc

.data
inputStr BYTE 100 DUP(0)
prompt BYTE "Enter a string: ",0
msg BYTE "Reversed string: ",0

.code
main PROC
    ; Prompt and read string
    mov edx, OFFSET prompt
    call WriteString
    mov edx, OFFSET inputStr
    mov ecx, 100
    call ReadString

    ; EAX = number of characters read
    mov ecx, eax
    mov esi, OFFSET inputStr

PushLoop:
    mov al, [esi]
    push eax
    inc esi
    loop PushLoop

    ; Output reversed string
    mov edx, OFFSET msg
    call WriteString

    mov ecx, eax
PopLoop:
    pop eax
    call WriteChar
    loop PopLoop

    call Crlf
    exit
main ENDP
END main
```

---

## ✅ **Question 2: Evaluate Postfix Expression**

### 🔧 **Sample Code:**

```asm
INCLUDE Irvine32.inc

.data
expr BYTE "53+2*",0
msg BYTE "Result: ",0

.code
main PROC
    mov esi, OFFSET expr

NextChar:
    mov al, [esi]
    cmp al, 0
    je Done

    ; If digit
    cmp al, '0'
    jl NotDigit
    cmp al, '9'
    jg NotDigit

    sub al, '0'
    movzx eax, al
    push eax
    jmp Continue

NotDigit:
    ; Operator
    pop ebx    ; Operand 2
    pop eax    ; Operand 1

    cmp al, '+'
    je DoAdd
    cmp al, '-'
    je DoSub
    cmp al, '*'
    je DoMul
    cmp al, '/'
    je DoDiv
    jmp Continue

DoAdd:
    add eax, ebx
    jmp PushResult
DoSub:
    sub eax, ebx
    jmp PushResult
DoMul:
    imul eax, ebx
    jmp PushResult
DoDiv:
    xor edx, edx
    div ebx

PushResult:
    push eax

Continue:
    inc esi
    jmp NextChar

Done:
    pop eax
    mov edx, OFFSET msg
    call WriteString
    call WriteInt
    call Crlf

    exit
main ENDP
END main
```

---

## ✅ **Question 3: Palindrome Checker**

### 🔧 **Sample Code:**

```asm
INCLUDE Irvine32.inc

.data
inputStr BYTE 100 DUP(0)
msg1 BYTE "Enter a string: ",0
msgYes BYTE "Palindrome",0
msgNo  BYTE "Not a palindrome",0

.code
main PROC
    mov edx, OFFSET msg1
    call WriteString
    mov edx, OFFSET inputStr
    mov ecx, 100
    call ReadString

    mov ecx, eax        ; Length
    mov esi, OFFSET inputStr
    mov edi, ecx
    shr ecx, 1          ; half length

    ; Push first half
PushLoop:
    mov al, [esi]
    push eax
    inc esi
    loop PushLoop

    test edi, 1         ; If odd, skip middle char
    jz Continue
    inc esi

Continue:
    mov ecx, edi
    shr ecx, 1
    xor ebx, ebx        ; flag: 0 = match, 1 = mismatch

CompareLoop:
    pop eax
    mov dl, [esi]
    cmp al, dl
    jne NotPalindrome
    inc esi
    loop CompareLoop

    mov edx, OFFSET msgYes
    jmp Print

NotPalindrome:
    mov edx, OFFSET msgNo

Print:
    call WriteString
    call Crlf
    exit
main ENDP
END main
```

---

## ✅ **Question 4: Integer to Binary (Using Stack)**

### 🔧 **Sample Code:**

```asm
INCLUDE Irvine32.inc

.data
msg BYTE "Enter a number (0–255): ",0
binMsg BYTE "Binary: ",0

.code
main PROC
    mov edx, OFFSET msg
    call WriteString
    call ReadInt
    mov ecx, eax
    cmp ecx, 0
    je ZeroCase

    mov eax, ecx
    mov ebx, 2

BinLoop:
    xor edx, edx
    div ebx
    push edx
    cmp eax, 0
    jne BinLoop

    mov edx, OFFSET binMsg
    call WriteString

PrintBin:
    pop eax
    add al, '0'
    call WriteChar
    cmp esp, OFFSET main
    ja PrintBin
    call Crlf
    jmp Done

ZeroCase:
    mov al, '0'
    call WriteChar
    call Crlf

Done:
    exit
main ENDP
END main
```

---

## ✅ **Question 5: Function Call Simulation (Manual Stack Frame)**

### 🔧 **Sample Code:**

```asm
INCLUDE Irvine32.inc

.data
msg1 BYTE "Simulating function call",0
msg2 BYTE "Returned from function",0

.code
main PROC
    ; Simulate function call
    mov edx, OFFSET msg1
    call WriteString
    call Crlf

    ; Push simulated return address
    push OFFSET ReturnHere

    ; Push parameters
    push 5         ; param1
    push 10        ; param2

    ; Jump to function
    jmp SimulatedFunction

ReturnHere:
    mov edx, OFFSET msg2
    call WriteString
    call Crlf
    exit
main ENDP

SimulatedFunction PROC
    ; Pop parameters
    pop ebx        ; param2
    pop eax        ; param1
    add eax, ebx   ; eax = param1 + param2
    call WriteInt
    call Crlf

    ; Return to main
    pop edx
    jmp edx
SimulatedFunction ENDP

END main
```

---

Great! Below are **5 more stack-based assembly language coding questions** using **MASM and Irvine32**, along with **complete sample solutions**.

---

## ✅ **Question 6: Push and Pop Integers**

**Task:** Push 5 integers onto the stack and then pop them back in reverse order, displaying each value.

### 🔧 Sample Code:

```asm
INCLUDE Irvine32.inc

.data
nums DWORD 10, 20, 30, 40, 50

.code
main PROC
    ; Push numbers onto stack
    mov eax, nums
    push DWORD PTR [eax]       ; 10
    push DWORD PTR [eax+4]     ; 20
    push DWORD PTR [eax+8]     ; 30
    push DWORD PTR [eax+12]    ; 40
    push DWORD PTR [eax+16]    ; 50

    ; Pop and display
    pop eax
    call WriteInt
    call Crlf

    pop eax
    call WriteInt
    call Crlf

    pop eax
    call WriteInt
    call Crlf

    pop eax
    call WriteInt
    call Crlf

    pop eax
    call WriteInt
    call Crlf

    exit
main ENDP
END main
```

---

## ✅ **Question 7: Sum of Numbers using Stack**

**Task:** Read 5 numbers from the user, push onto stack, then pop and compute sum.

### 🔧 Sample Code:

```asm
INCLUDE Irvine32.inc

.data
count DWORD 5
sum DWORD 0

.code
main PROC
    mov ecx, count
ReadLoop:
    call ReadInt
    push eax
    loop ReadLoop

    mov ecx, count
    xor eax, eax       ; Clear eax (sum)
SumLoop:
    pop ebx
    add eax, ebx
    loop SumLoop

    mov sum, eax
    call WriteString
    call Crlf
    mov eax, sum
    call WriteInt

    exit
main ENDP
END main
```

---

## ✅ **Question 8: Stack Overflow Demonstration**

**Task:** Demonstrate what happens when you push too much onto the stack (e.g., simulate pushing 10,000 times).

### 🔧 Sample Code (with care):

```asm
INCLUDE Irvine32.inc

.data
msg1 BYTE "Pushing values into the stack...",0
msg2 BYTE "Done.",0

.code
main PROC
    call WriteString
    mov edx, OFFSET msg1
    call WriteString
    call Crlf

    mov ecx, 10000
OverflowLoop:
    push ecx
    loop OverflowLoop   ; May crash on some systems due to stack overflow

    mov edx, OFFSET msg2
    call WriteString

    exit
main ENDP
END main
```

🛑 **Warning**: This is educational only. On many systems, pushing that many values will crash or corrupt memory.

---

## ✅ **Question 9: Convert Decimal to Hexadecimal using Stack**

**Task:** Input a decimal number, convert to hex using division, and display using stack.

### 🔧 Sample Code:

```asm
INCLUDE Irvine32.inc

.data
hexDigits BYTE "0123456789ABCDEF"

.code
main PROC
    call ReadInt
    mov ebx, 16
    cmp eax, 0
    je Done

    ; Conversion
ConvertLoop:
    xor edx, edx
    div ebx
    push edx
    cmp eax, 0
    jne ConvertLoop

    ; Output
WriteLoop:
    pop edx
    mov al, hexDigits[edx]
    call WriteChar
    cmp esp, OFFSET main ; crude way to check if stack empty
    ja WriteLoop

Done:
    call Crlf
    exit
main ENDP
END main
```

---

## ✅ **Question 10: Factorial using Stack (Iterative)**

**Task:** Calculate factorial iteratively using stack.

### 🔧 Sample Code:

```asm
INCLUDE Irvine32.inc

.data
result DWORD 1

.code
main PROC
    call ReadInt        ; EAX = n
    mov ecx, eax

PushLoop:
    push ecx
    loop PushLoop

    mov eax, 1
FactorialLoop:
    pop ebx
    mul ebx
    cmp esp, OFFSET main
    ja FactorialLoop

    call WriteInt
    call Crlf
    exit
main ENDP
END main
```

---

