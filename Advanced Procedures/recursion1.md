
---

### ✅ **Q1. Factorial (n!)**

```asm
INCLUDE Irvine32.inc

.code
main PROC
    call ReadInt
    call Factorial
    call WriteInt
    call Crlf
    exit
main ENDP

Factorial PROC
    ; Input: EAX = n
    ; Output: EAX = n!

    push eax
    cmp eax, 0
    je base_case

    dec eax
    call Factorial
    pop ebx
    mul ebx
    ret

base_case:
    pop eax
    mov eax, 1
    ret
Factorial ENDP
```

---

### ✅ **Q2. Fibonacci (nth Term)**

```asm
INCLUDE Irvine32.inc

.code
main PROC
    call ReadInt
    call Fibonacci
    call WriteInt
    call Crlf
    exit
main ENDP

Fibonacci PROC
    ; Input: EAX = n
    ; Output: EAX = Fib(n)

    cmp eax, 0
    je base0
    cmp eax, 1
    je base1

    push eax
    dec eax
    call Fibonacci

    mov ebx, eax     ; Fib(n-1)
    pop eax
    push ebx
    dec eax
    call Fibonacci
    pop ebx
    add eax, ebx
    ret

base0:
    mov eax, 0
    ret
base1:
    mov eax, 1
    ret
Fibonacci ENDP
```

---

### ✅ **Q3. Sum of First N Natural Numbers**

```asm
INCLUDE Irvine32.inc

.code
main PROC
    call ReadInt
    call SumN
    call WriteInt
    call Crlf
    exit
main ENDP

SumN PROC
    ; Input: EAX = n
    ; Output: EAX = 1 + 2 + ... + n

    cmp eax, 0
    je base_case

    push eax
    dec eax
    call SumN
    pop ebx
    add eax, ebx
    ret

base_case:
    mov eax, 0
    ret
SumN ENDP
```

---

### ✅ **Q4. Reverse a String (Recursive Print)**

```asm
INCLUDE Irvine32.inc

.data
input BYTE 100 DUP(0)

.code
main PROC
    mov edx, OFFSET input
    call ReadString
    mov esi, OFFSET input
    call ReverseStr
    call Crlf
    exit
main ENDP

ReverseStr PROC
    ; Input: ESI = address of current char
    ; Prints the string in reverse

    push esi
    mov al, [esi]
    cmp al, 0
    je end_rec
    inc esi
    call ReverseStr
    pop esi
    mov al, [esi]
    call WriteChar
    ret

end_rec:
    pop esi
    ret
ReverseStr ENDP
```

---

### ✅ **Q5. Count Digits of a Number**

```asm
INCLUDE Irvine32.inc

.code
main PROC
    call ReadInt
    call CountDigits
    call WriteInt
    call Crlf
    exit
main ENDP

CountDigits PROC
    ; Input: EAX = number
    ; Output: EAX = number of digits

    cmp eax, 0
    je base_case

    mov edx, 0
    mov ebx, 10
    div ebx
    push eax
    call CountDigits
    pop eax
    inc eax
    ret

base_case:
    mov eax, 0
    ret
CountDigits ENDP
```

---

Here are the **MASM + Irvine32 solutions** for **Q6 to Q10**, focusing on recursion in assembly.

---

### ✅ **Q6. Power Function (x^n)**

```asm
INCLUDE Irvine32.inc

.code
main PROC
    call ReadInt      ; Read x
    push eax
    call ReadInt      ; Read n
    pop ebx
    call Power        ; Calculate x^n
    call WriteInt
    call Crlf
    exit
main ENDP

Power PROC
    ; Input: EAX = x, EBX = n
    ; Output: EAX = x^n
    
    cmp ebx, 0
    je base_case
    
    push ebx
    dec ebx
    call Power         ; Recursive call for x^(n-1)
    pop ebx
    imul eax, [esp]    ; EAX = x * x^(n-1)
    ret

base_case:
    mov eax, 1         ; x^0 = 1
    ret
Power ENDP
```

---

### ✅ **Q7. Find Maximum in Array**

```asm
INCLUDE Irvine32.inc

.data
arr DWORD 10, 2, 33, 44, 5, 6, 78, 9, 0, 1
n DWORD 10

.code
main PROC
    lea esi, arr      ; Array pointer
    mov ecx, n        ; Size of the array
    call MaxInArray   ; Call recursive function to find max
    call WriteInt
    call Crlf
    exit
main ENDP

MaxInArray PROC
    ; Input: ESI = pointer to array, ECX = size of array
    ; Output: EAX = maximum value in array
    
    cmp ecx, 1
    je done            ; Base case: only one element left
    
    push ecx
    push esi
    dec ecx
    lea esi, [esi + 4]
    call MaxInArray    ; Recursive call for next element
    pop esi
    pop ecx
    
    mov ebx, [esi]     ; Load current element into EBX
    cmp eax, ebx       ; Compare max so far with current element
    jge skip
    mov eax, ebx       ; Update max value if needed
skip:
    ret

done:
    mov eax, [esi]     ; Only one element left, return it
    ret
MaxInArray ENDP
```

---

### ✅ **Q8. GCD via Recursion**

```asm
INCLUDE Irvine32.inc

.code
main PROC
    call ReadInt       ; Read first integer
    push eax
    call ReadInt       ; Read second integer
    pop ebx
    call GCD           ; Call recursive GCD function
    call WriteInt
    call Crlf
    exit
main ENDP

GCD PROC
    ; Input: EAX = a, EBX = b
    ; Output: EAX = GCD(a, b)

    cmp ebx, 0
    je done

    push ebx
    mov edx, 0
    div ebx            ; EAX = EAX / EBX, EDX = EAX % EBX
    pop ebx
    mov eax, ebx       ; Set EAX = b
    mov ebx, edx       ; Set EBX = remainder
    call GCD           ; Recursive call
    ret

done:
    ret
GCD ENDP
```

---

### ✅ **Q9. Palindrome Checker (String)**

```asm
INCLUDE Irvine32.inc

.data
input BYTE 100 DUP(0)

.code
main PROC
    mov edx, OFFSET input
    call ReadString
    lea esi, input
    call IsPalindrome
    call WriteString
    call Crlf
    exit
main ENDP

IsPalindrome PROC
    ; Input: ESI = pointer to string
    ; Output: EAX = 1 if palindrome, 0 if not

    mov al, [esi]      ; Get first character
    cmp al, 0          ; Check for null terminator
    je done
    
    push esi
    lea edi, [esi + strlen]
    mov al, [edi]
    cmp al, 0          ; Check if string length is 1
    je done
    
    cmp al, byte ptr [esi]
    jne not_palindrome
    pop esi
    inc esi
    call IsPalindrome
    ret

not_palindrome:
    mov eax, 0         ; Not palindrome
    ret

done:
    mov eax, 1         ; Palindrome
    ret
IsPalindrome ENDP
```

---

### ✅ **Q10. Decimal to Binary (Recursive Print)**

```asm
INCLUDE Irvine32.inc

.code
main PROC
    call ReadInt       ; Read decimal number
    call PrintBinary   ; Print binary
    call Crlf
    exit
main ENDP

PrintBinary PROC
    ; Input: EAX = decimal number to convert
    ; Output: Prints binary representation

    cmp eax, 0
    je done

    push eax
    shr eax, 1         ; Right shift the number
    call PrintBinary   ; Recursive call
    pop eax
    and al, 1          ; Extract the least significant bit
    call WriteChar     ; Print the bit
    ret

done:
    ret
PrintBinary ENDP
```

---

