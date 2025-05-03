
---

### ✅ **Q11. Reverse a Number**

```asm
INCLUDE Irvine32.inc

.code
main PROC
    call ReadInt       ; Read the number
    call ReverseNumber ; Reverse the number
    call WriteInt
    call Crlf
    exit
main ENDP

ReverseNumber PROC
    ; Input: EAX = number
    ; Output: EAX = reversed number
    
    cmp eax, 0
    je done
    
    push eax
    mov edx, 0
    div 10            ; Divide by 10
    call ReverseNumber
    pop eax
    imul eax, eax, 10 ; Multiply reversed part by 10
    add eax, edx      ; Add current digit
    ret

done:
    ret
ReverseNumber ENDP
```

---

### ✅ **Q12. Binary Search**

```asm
INCLUDE Irvine32.inc

.data
arr DWORD 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21 ; Sorted array
size DWORD 11                                     ; Size of the array

.code
main PROC
    call ReadInt           ; Read the target value
    lea esi, arr           ; Load array address into ESI
    mov ecx, size          ; Size of the array
    call BinarySearch      ; Call binary search function
    call WriteInt
    call Crlf
    exit
main ENDP

BinarySearch PROC
    ; Input: ESI = address of array, ECX = size, EAX = target value
    ; Output: EAX = index of the target (or -1 if not found)
    
    cmp ecx, 0
    je not_found
    
    push ecx
    mov edx, ecx
    shr edx, 1            ; Find the middle index (ECX / 2)
    lea edi, [esi + edx*4] ; Get address of middle element
    mov eax, [edi]        ; Load the middle element into EAX
    cmp eax, [esp+4]      ; Compare with the target value
    je found

    ; If target is smaller, search the left half
    jl search_left
    ; If target is larger, search the right half
    jg search_right

search_left:
    pop ecx
    mov ecx, edx          ; Set ECX to half the array size
    call BinarySearch
    ret

search_right:
    pop ecx
    lea esi, [edi + 4]    ; Move ESI to right half
    sub ecx, edx          ; Set ECX to remaining half size
    call BinarySearch
    ret

found:
    pop ecx
    sub eax, esi          ; Return the index
    ret

not_found:
    mov eax, -1           ; Return -1 if not found
    ret
BinarySearch ENDP
```

---

### ✅ **Q13. Tower of Hanoi**

```asm
INCLUDE Irvine32.inc

.code
main PROC
    call ReadInt           ; Read number of disks
    call Hanoi              ; Solve the Tower of Hanoi
    call Crlf
    exit
main ENDP

Hanoi PROC
    ; Input: EAX = number of disks, EBX = source peg, ECX = target peg, EDX = auxiliary peg
    ; Output: Prints moves
    
    cmp eax, 1
    je base_case
    
    push eax
    dec eax
    call Hanoi             ; Move n-1 disks from source to auxiliary
    pop eax

    ; Move the nth disk from source to target
    call WriteString
    call Crlf

    push eax
    dec eax
    call Hanoi             ; Move n-1 disks from auxiliary to target
    pop eax

    ret

base_case:
    ; Base case: Move one disk directly
    call WriteString
    call Crlf
    ret
Hanoi ENDP
```

---

### ✅ **Q14. Permutations of a String**

```asm
INCLUDE Irvine32.inc

.data
input BYTE "ABC", 0    ; Example string for permutations

.code
main PROC
    lea esi, input
    call Permute
    call Crlf
    exit
main ENDP

Permute PROC
    ; Input: ESI = pointer to string
    ; Output: Prints all permutations of the string

    mov al, [esi]        ; Get first character of the string
    cmp al, 0
    je done

    push esi
    inc esi
    call Permute         ; Recursively permute the rest of the string
    pop esi

    mov al, [esi]
    call WriteChar       ; Print the current character

    ret

done:
    ret
Permute ENDP
```

---

### ✅ **Q15. Sum of Digits**

```asm
INCLUDE Irvine32.inc

.code
main PROC
    call ReadInt           ; Read the number
    call SumDigits         ; Call recursive sum of digits function
    call WriteInt
    call Crlf
    exit
main ENDP

SumDigits PROC
    ; Input: EAX = number
    ; Output: EAX = sum of digits of the number
    
    cmp eax, 0
    je done

    mov edx, 0
    div 10                ; Divide by 10 to get the last digit
    add eax, edx          ; Add the last digit to sum
    call SumDigits
    ret

done:
    ret
SumDigits ENDP
```

---

Here are the **MASM + Irvine32** solutions for **Q16 to Q20** recursion-based problems:

---

### ✅ **Q16. Length of a String (Recursive)**

```asm
INCLUDE Irvine32.inc

.data
input BYTE "Hello, World!", 0    ; Example string

.code
main PROC
    lea esi, input               ; Load address of string
    call StrLength               ; Call recursive function to find length
    call WriteInt
    call Crlf
    exit
main ENDP

StrLength PROC
    ; Input: ESI = pointer to string
    ; Output: EAX = length of the string
    
    mov al, [esi]                ; Load current character
    cmp al, 0                    ; Check for null terminator
    je done                      ; If end of string, return
    
    inc esi                      ; Move to next character
    call StrLength               ; Recursive call
    ret

done:
    mov eax, 0                   ; Return length 0
    ret
StrLength ENDP
```

---

### ✅ **Q17. Calculate the Power Set of a Set**

```asm
INCLUDE Irvine32.inc

.data
set BYTE "ABC", 0    ; Example set

.code
main PROC
    lea esi, set
    call PowerSet               ; Call function to generate power set
    call Crlf
    exit
main ENDP

PowerSet PROC
    ; Input: ESI = pointer to set (string)
    ; Output: Prints all subsets of the set

    mov al, [esi]                ; Get the current element
    cmp al, 0                    ; Check if end of set
    je done

    ; Include the current element in the subset
    call WriteChar
    call PowerSet

    ; Exclude the current element and recurse
    inc esi
    call PowerSet

    ret

done:
    ret
PowerSet ENDP
```

---

### ✅ **Q18. Check if a Number is Prime**

```asm
INCLUDE Irvine32.inc

.code
main PROC
    call ReadInt           ; Read number
    call IsPrime           ; Call recursive function to check prime
    call WriteInt
    call Crlf
    exit
main ENDP

IsPrime PROC
    ; Input: EAX = number
    ; Output: EAX = 1 if prime, 0 if not prime

    cmp eax, 2
    jl not_prime            ; If number < 2, not prime
    cmp eax, 2
    je prime                ; 2 is prime
    
    ; Start checking from 2
    mov ebx, 2
    call CheckDivisibility  ; Check divisibility for numbers 2 to sqrt(N)
    ret

CheckDivisibility PROC
    ; Input: EAX = number, EBX = divisor
    ; Output: EAX = 1 if prime, 0 if divisible by a number
    
    mov edx, 0
    div ebx
    cmp edx, 0
    je not_prime
    
    inc ebx
    cmp ebx, eax            ; Compare divisor to number
    jge prime               ; If divisor is greater than number, prime
    call CheckDivisibility
    ret

not_prime:
    mov eax, 0
    ret

prime:
    mov eax, 1
    ret
IsPrime ENDP
```

---

### ✅ **Q19. Convert a String to Integer**

```asm
INCLUDE Irvine32.inc

.data
input BYTE "12345", 0   ; Example string

.code
main PROC
    lea esi, input        ; Load address of string
    call StrToInt         ; Call recursive function to convert string to integer
    call WriteInt
    call Crlf
    exit
main ENDP

StrToInt PROC
    ; Input: ESI = pointer to string
    ; Output: EAX = integer representation of the string
    
    mov al, [esi]          ; Load current character
    cmp al, 0              ; Check for null terminator
    je done
    sub al, '0'            ; Convert ASCII to integer
    mov ebx, 10
    imul eax, eax, ebx     ; Multiply result by 10
    add eax, al            ; Add current digit to result
    inc esi                ; Move to next character
    call StrToInt          ; Recurse
    ret

done:
    ret
StrToInt ENDP
```

---

### ✅ **Q20. Count Vowels in a String**

```asm
INCLUDE Irvine32.inc

.data
input BYTE "This is an example string", 0   ; Example string

.code
main PROC
    lea esi, input        ; Load address of string
    call CountVowels      ; Call recursive function to count vowels
    call WriteInt
    call Crlf
    exit
main ENDP

CountVowels PROC
    ; Input: ESI = pointer to string
    ; Output: EAX = number of vowels in the string

    mov al, [esi]         ; Load current character
    cmp al, 0             ; Check for null terminator
    je done

    ; Check if the current character is a vowel
    mov bl, al
    cmp bl, 'A'
    je increment
    cmp bl, 'E'
    je increment
    cmp bl, 'I'
    je increment
    cmp bl, 'O'
    je increment
    cmp bl, 'U'
    je increment

    ; If not a vowel, recurse with next character
    inc esi
    call CountVowels
    ret

increment:
    inc esi
    call CountVowels
    inc eax                ; Increment vowel count
    ret

done:
    ret
CountVowels ENDP
```

---

