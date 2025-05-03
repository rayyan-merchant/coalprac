
---

## ✅ **Q1: GCD of Two Numbers**

📌 *Already provided above. Re-included here for completeness.*

### 🔧 `GCD` using Euclidean Algorithm

```asm
INCLUDE Irvine32.inc

.data
prompt1 BYTE "Enter first number: ", 0
prompt2 BYTE "Enter second number: ", 0
resultMsg BYTE "GCD = ", 0

.code
main PROC
    ; Read inputs
    mov edx, OFFSET prompt1
    call WriteString
    call ReadInt
    push eax    ; a

    mov edx, OFFSET prompt2
    call WriteString
    call ReadInt
    push eax    ; b

    call GCD
    add esp, 8  ; Clean up 2 arguments

    mov edx, OFFSET resultMsg
    call WriteString
    call WriteInt
    call Crlf

    exit
main ENDP

GCD PROC
    push ebp
    mov ebp, esp

    mov eax, [ebp+8] ; a
    mov ebx, [ebp+12]; b

GCDLoop:
    cmp ebx, 0
    je Done
    xor edx, edx
    div ebx         ; eax / ebx, remainder in edx
    mov eax, ebx
    mov ebx, edx
    jmp GCDLoop

Done:
    pop ebp
    ret 8
GCD ENDP
```

---

## ✅ **Q2: Maximum in an Array**

```asm
INCLUDE Irvine32.inc

.data
arr DWORD 10 DUP(?)
msg BYTE "Max value = ", 0

.code
main PROC
    ; Input 10 numbers
    mov ecx, 10
    mov esi, OFFSET arr
ReadLoop:
    call ReadInt
    mov [esi], eax
    add esi, 4
    loop ReadLoop

    ; Call FindMax(arr, size)
    push 10
    push OFFSET arr
    call FindMax
    add esp, 8

    ; Print result
    mov edx, OFFSET msg
    call WriteString
    call WriteInt
    call Crlf

    exit
main ENDP

FindMax PROC
    push ebp
    mov ebp, esp

    mov esi, [ebp+8]  ; array pointer
    mov ecx, [ebp+12] ; size

    mov eax, [esi]    ; assume first is max
    add esi, 4
    dec ecx

LoopMax:
    cmp [esi], eax
    jle Skip
    mov eax, [esi]
Skip:
    add esi, 4
    loop LoopMax

    pop ebp
    ret 8
FindMax ENDP
```

---

## ✅ **Q3: Reverse a String In-Place**

```asm
INCLUDE Irvine32.inc

.data
str BYTE 100 DUP(0)
msg BYTE "Enter string: ", 0

.code
main PROC
    mov edx, OFFSET msg
    call WriteString
    mov edx, OFFSET str
    call ReadString

    ; Call ReverseString(addr)
    push OFFSET str
    call ReverseString
    add esp, 4

    ; Output reversed string
    mov edx, OFFSET str
    call WriteString
    call Crlf

    exit
main ENDP

ReverseString PROC
    push ebp
    mov ebp, esp

    mov esi, [ebp+8] ; address of string
    mov edi, esi

    ; Find length
FindLen:
    mov al, [edi]
    cmp al, 0
    je GotLen
    inc edi
    jmp FindLen
GotLen:
    dec edi          ; last char index

RevLoop:
    cmp esi, edi
    jge Done

    ; Swap [esi] <-> [edi]
    mov al, [esi]
    mov bl, [edi]
    mov [esi], bl
    mov [edi], al

    inc esi
    dec edi
    jmp RevLoop

Done:
    pop ebp
    ret 4
ReverseString ENDP
```

---

## ✅ **Q4: Compute Power (base^exp)**

```asm
INCLUDE Irvine32.inc

.data
msg1 BYTE "Enter base: ", 0
msg2 BYTE "Enter exponent: ", 0
resMsg BYTE "Result = ", 0

.code
main PROC
    mov edx, OFFSET msg1
    call WriteString
    call ReadInt
    push eax    ; base

    mov edx, OFFSET msg2
    call WriteString
    call ReadInt
    push eax    ; exponent

    call Power
    add esp, 8

    mov edx, OFFSET resMsg
    call WriteString
    call WriteInt
    call Crlf

    exit
main ENDP

Power PROC
    push ebp
    mov ebp, esp

    mov eax, [ebp+8]  ; base
    mov ecx, [ebp+12] ; exponent

    cmp ecx, 0
    jne Continue
    mov eax, 1
    jmp Done

Continue:
    mov ebx, eax      ; base in ebx
    dec ecx
LoopPow:
    mul ebx
    loop LoopPow

Done:
    pop ebp
    ret 8
Power ENDP
```

---

## ✅ **Q5: Count Vowels in a String**

```asm
INCLUDE Irvine32.inc

.data
inputStr BYTE 100 DUP(0)
msg BYTE "Enter string: ", 0
vowelMsg BYTE "Vowels = ", 0

.code
main PROC
    mov edx, OFFSET msg
    call WriteString
    mov edx, OFFSET inputStr
    call ReadString

    push OFFSET inputStr
    call CountVowels
    add esp, 4

    mov edx, OFFSET vowelMsg
    call WriteString
    call WriteInt
    call Crlf

    exit
main ENDP

CountVowels PROC
    push ebp
    mov ebp, esp

    mov esi, [ebp+8]
    xor ecx, ecx ; count = 0

LoopChar:
    mov al, [esi]
    cmp al, 0
    je Done
    ; Convert to lowercase
    cmp al, 'A'
    jl NotVowel
    cmp al, 'Z'
    jg CheckLower
    add al, 32 ; make lowercase

CheckLower:
    cmp al, 'a'
    jl NotVowel
    cmp al, 'z'
    jg NotVowel

    cmp al, 'a'
    je IncV
    cmp al, 'e'
    je IncV
    cmp al, 'i'
    je IncV
    cmp al, 'o'
    je IncV
    cmp al, 'u'
    je IncV
    jmp NotVowel

IncV:
    inc ecx

NotVowel:
    inc esi
    jmp LoopChar

Done:
    mov eax, ecx
    pop ebp
    ret 4
CountVowels ENDP
```

---

Perfect! Here are the **MASM + Irvine32 solutions for Q6 to Q10** — continuing with procedure-based tasks.

---

## ✅ **Q6: Check if a Number is Prime**

```asm
INCLUDE Irvine32.inc

.data
msg BYTE "Enter number: ", 0
primeMsg BYTE "Number is Prime", 0
notPrimeMsg BYTE "Number is NOT Prime", 0

.code
main PROC
    mov edx, OFFSET msg
    call WriteString
    call ReadInt
    push eax
    call IsPrime
    add esp, 4

    cmp eax, 1
    je Prime
    mov edx, OFFSET notPrimeMsg
    call WriteString
    jmp ExitMain
Prime:
    mov edx, OFFSET primeMsg
    call WriteString
ExitMain:
    call Crlf
    exit
main ENDP

IsPrime PROC
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]  ; number

    cmp eax, 2
    jl NotPrime
    cmp eax, 2
    je Prime

    mov ecx, 2
    mov ebx, eax

CheckLoop:
    mov edx, 0
    div ecx
    cmp edx, 0
    je NotPrime
    inc ecx
    mov eax, ebx
    cmp ecx, eax
    jl CheckLoop

Prime:
    mov eax, 1
    jmp Done
NotPrime:
    mov eax, 0
Done:
    pop ebp
    ret 4
IsPrime ENDP
```

---

## ✅ **Q7: Convert Integer to Binary String**

```asm
INCLUDE Irvine32.inc

.data
msg BYTE "Enter number: ", 0
binStr BYTE 33 DUP(0)
binMsg BYTE "Binary = ", 0

.code
main PROC
    mov edx, OFFSET msg
    call WriteString
    call ReadInt
    push eax
    push OFFSET binStr
    call ToBinary
    add esp, 8

    mov edx, OFFSET binMsg
    call WriteString
    mov edx, OFFSET binStr
    call WriteString
    call Crlf

    exit
main ENDP

ToBinary PROC
    push ebp
    mov ebp, esp

    mov edi, [ebp+8] ; string pointer
    mov eax, [ebp+12] ; number
    mov ecx, 0

    mov esi, edi
    add esi, 32
    mov byte ptr [esi], 0 ; null terminator
    dec esi

ConvertLoop:
    mov edx, 0
    mov ebx, 2
    div ebx
    add dl, '0'
    mov [esi], dl
    dec esi
    inc ecx
    cmp eax, 0
    jne ConvertLoop

    inc esi
    ; Copy result to output buffer
    mov edi, [ebp+8]
CopyLoop:
    mov al, [esi]
    mov [edi], al
    inc esi
    inc edi
    cmp al, 0
    jne CopyLoop

    pop ebp
    ret 8
ToBinary ENDP
```

---

## ✅ **Q8: Swap Two Numbers (Pass by Reference)**

```asm
INCLUDE Irvine32.inc

.data
msg1 BYTE "Enter first number: ", 0
msg2 BYTE "Enter second number: ", 0
swapMsg BYTE "After swap: ", 0

.code
main PROC
    mov edx, OFFSET msg1
    call WriteString
    call ReadInt
    mov ebx, eax

    mov edx, OFFSET msg2
    call WriteString
    call ReadInt
    mov ecx, eax

    ; Push addresses
    push OFFSET ecx
    push OFFSET ebx
    call Swap
    add esp, 8

    mov edx, OFFSET swapMsg
    call WriteString
    call Crlf

    mov eax, ebx
    call WriteInt
    call Crlf

    mov eax, ecx
    call WriteInt
    call Crlf

    exit
main ENDP

Swap PROC
    push ebp
    mov ebp, esp

    mov esi, [ebp+8]
    mov edi, [ebp+12]

    mov eax, [esi]
    mov ebx, [edi]

    mov [esi], ebx
    mov [edi], eax

    pop ebp
    ret 8
Swap ENDP
```

---

## ✅ **Q9: Average of Array Elements**

```asm
INCLUDE Irvine32.inc

.data
arr DWORD 10 DUP(?)
msg BYTE "Average = ", 0

.code
main PROC
    mov ecx, 10
    mov esi, OFFSET arr
ReadLoop:
    call ReadInt
    mov [esi], eax
    add esi, 4
    loop ReadLoop

    push 10
    push OFFSET arr
    call Average
    add esp, 8

    mov edx, OFFSET msg
    call WriteString
    call WriteInt
    call Crlf

    exit
main ENDP

Average PROC
    push ebp
    mov ebp, esp

    mov esi, [ebp+8]
    mov ecx, [ebp+12]
    xor eax, eax

SumLoop:
    add eax, [esi]
    add esi, 4
    loop SumLoop

    mov ebx, [ebp+12]
    xor edx, edx
    div ebx

    pop ebp
    ret 8
Average ENDP
```

---

## ✅ **Q10: Check if String is a Palindrome**

```asm
INCLUDE Irvine32.inc

.data
str BYTE 100 DUP(0)
msg BYTE "Enter string: ", 0
yesMsg BYTE "Palindrome", 0
noMsg BYTE "Not Palindrome", 0

.code
main PROC
    mov edx, OFFSET msg
    call WriteString
    mov edx, OFFSET str
    call ReadString

    push OFFSET str
    call IsPalindrome
    add esp, 4

    cmp eax, 1
    je Yes
    mov edx, OFFSET noMsg
    call WriteString
    jmp Done
Yes:
    mov edx, OFFSET yesMsg
    call WriteString
Done:
    call Crlf
    exit
main ENDP

IsPalindrome PROC
    push ebp
    mov ebp, esp

    mov esi, [ebp+8]
    mov edi, esi
FindEnd:
    cmp byte ptr [edi], 0
    je GotEnd
    inc edi
    jmp FindEnd
GotEnd:
    dec edi ; last char

CheckLoop:
    cmp esi, edi
    jge IsPal

    mov al, [esi]
    mov bl, [edi]
    cmp al, bl
    jne NotPal

    inc esi
    dec edi
    jmp CheckLoop

IsPal:
    mov eax, 1
    jmp Done
NotPal:
    mov eax, 0
Done:
    pop ebp
    ret 4
IsPalindrome ENDP
```

---

