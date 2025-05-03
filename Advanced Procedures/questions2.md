
---

## ✅ **Q1: Sum of Digits using a Procedure**

```asm
INCLUDE Irvine32.inc

.data
msg BYTE "Enter a number: ", 0
resultMsg BYTE "Sum of digits = ", 0

.code
main PROC
    mov edx, OFFSET msg
    call WriteString
    call ReadInt
    invoke SumDigits, eax
    mov edx, OFFSET resultMsg
    call WriteString
    call WriteInt
    call Crlf
    exit
main ENDP

SumDigits PROC USES eax ecx edx
    ; Parameter: eax
    ; Returns: eax = sum of digits

    push ebp
    mov ebp, esp
    enter 0, 0

    xor ecx, ecx ; sum

sum_loop:
    cmp eax, 0
    je end_sum
    mov edx, 0
    mov ebx, 10
    div ebx
    add ecx, edx
    jmp sum_loop

end_sum:
    mov eax, ecx
    leave
    pop ebp
    ret 4
SumDigits ENDP
```

---

## ✅ **Q2: Count Vowels in a String**

```asm
INCLUDE Irvine32.inc

.data
str BYTE 100 DUP(0)
msg BYTE "Enter a string: ", 0
resMsg BYTE "Vowel count = ", 0

.code
main PROC
    mov edx, OFFSET msg
    call WriteString
    mov edx, OFFSET str
    call ReadString

    invoke CountVowels, ADDR str
    mov edx, OFFSET resMsg
    call WriteString
    call WriteInt
    call Crlf

    exit
main ENDP

CountVowels PROC
    ; Parameter: [esp+4] = address of string
    pushad
    push ebp
    mov ebp, esp
    enter 4, 0

    mov esi, [ebp+8]
    mov ecx, 0

next_char:
    mov al, [esi]
    cmp al, 0
    je done

    ; Check for vowels
    cmp al, 'a'
    je inc_vowel
    cmp al, 'e'
    je inc_vowel
    cmp al, 'i'
    je inc_vowel
    cmp al, 'o'
    je inc_vowel
    cmp al, 'u'
    je inc_vowel
    cmp al, 'A'
    je inc_vowel
    cmp al, 'E'
    je inc_vowel
    cmp al, 'I'
    je inc_vowel
    cmp al, 'O'
    je inc_vowel
    cmp al, 'U'
    je inc_vowel
    jmp skip

inc_vowel:
    inc ecx
skip:
    inc esi
    jmp next_char

done:
    mov eax, ecx
    leave
    pop ebp
    popad
    ret 4
CountVowels ENDP
```

---

## ✅ **Q3: Reverse an Array In-Place**

```asm
INCLUDE Irvine32.inc

.data
arr DWORD 1, 2, 3, 4, 5
msg BYTE "Reversed Array: ", 0

.code
main PROC
    mov edx, OFFSET msg
    call WriteString
    invoke ReverseArray, OFFSET arr, 5

    mov ecx, 5
    mov esi, OFFSET arr
printLoop:
    mov eax, [esi]
    call WriteInt
    call Crlf
    add esi, 4
    loop printLoop

    exit
main ENDP

ReverseArray PROC
    ; Parameters: [ebp+8] = ptr to array, [ebp+12] = count
    push ebp
    mov ebp, esp
    enter 0, 0

    mov esi, [ebp+8]     ; start pointer
    mov ecx, [ebp+12]    
    mov eax, ecx
    dec eax
    shl eax, 2           ; index * 4
    add eax, [ebp+8]
    mov edi, eax         ; end pointer

reverse_loop:
    cmp esi, edi
    jge done

    mov eax, [esi]
    mov ebx, [edi]
    mov [esi], ebx
    mov [edi], eax

    add esi, 4
    sub edi, 4
    jmp reverse_loop

done:
    leave
    pop ebp
    ret 8
ReverseArray ENDP
```

---

## ✅ **Q4: Factorial using Recursion**

```asm
INCLUDE Irvine32.inc

.data
msg BYTE "Enter number: ", 0
factMsg BYTE "Factorial = ", 0

.code
main PROC
    mov edx, OFFSET msg
    call WriteString
    call ReadInt
    invoke Factorial, eax
    mov edx, OFFSET factMsg
    call WriteString
    call WriteInt
    call Crlf
    exit
main ENDP

Factorial PROC
    push ebp
    mov ebp, esp
    enter 0, 0
    mov eax, [ebp+8]

    cmp eax, 1
    jle base_case

    dec eax
    push eax
    call Factorial
    mov ebx, eax
    mov eax, [ebp+8]
    mul ebx
    jmp done

base_case:
    mov eax, 1

done:
    leave
    pop ebp
    ret 4
Factorial ENDP
```

---

## ✅ **Q5: Replace All Spaces with Underscores**

```asm
INCLUDE Irvine32.inc

.data
msg BYTE "Enter a string: ", 0
str BYTE 100 DUP(0)
doneMsg BYTE "Modified string: ", 0

.code
main PROC
    mov edx, OFFSET msg
    call WriteString
    mov edx, OFFSET str
    call ReadString

    invoke ReplaceSpaces, ADDR str

    mov edx, OFFSET doneMsg
    call WriteString
    mov edx, OFFSET str
    call WriteString
    call Crlf

    exit
main ENDP

ReplaceSpaces PROC
    push ebp
    mov ebp, esp
    enter 0, 0

    mov esi, [ebp+8]

replace_loop:
    mov al, [esi]
    cmp al, 0
    je done

    cmp al, ' '
    jne skip
    mov byte ptr [esi], '_'

skip:
    inc esi
    jmp replace_loop

done:
    leave
    pop ebp
    ret 4
ReplaceSpaces ENDP
```

---

Here are the **MASM + Irvine32 solutions for Questions 6 to 10**, all focused on **advanced procedure mechanics** with proper use of `INVOKE`, `PROC` with parameters, `ENTER/LEAVE`, `LOCAL`, `LEA`, `RET n`, `pushad/popad`, and stack frame handling.

---

## ✅ **Q6: GCD Using Euclidean Algorithm**

```asm
INCLUDE Irvine32.inc

.data
msg BYTE "Enter two integers: ", 0
resMsg BYTE "GCD = ", 0

.code
main PROC
    mov edx, OFFSET msg
    call WriteString
    call ReadInt
    mov ebx, eax
    call ReadInt
    invoke GCD, ebx, eax
    mov edx, OFFSET resMsg
    call WriteString
    call WriteInt
    call Crlf
    exit
main ENDP

GCD PROC
    push ebp
    mov ebp, esp
    enter 0, 0
    ; Parameters: [ebp+8] = a, [ebp+12] = b

    mov eax, [ebp+8]
    mov ebx, [ebp+12]

gcd_loop:
    cmp ebx, 0
    je done
    mov edx, 0
    div ebx
    mov eax, ebx
    mov ebx, edx
    jmp gcd_loop

done:
    leave
    pop ebp
    ret 8
GCD ENDP
```

---

## ✅ **Q7: Count Word Occurrences in a Sentence**

```asm
INCLUDE Irvine32.inc

.data
sentence BYTE 100 DUP(0)
word BYTE 20 DUP(0)
msg1 BYTE "Enter sentence: ", 0
msg2 BYTE "Enter word to search: ", 0
foundMsg BYTE "Occurrences = ", 0

.code
main PROC
    mov edx, OFFSET msg1
    call WriteString
    mov edx, OFFSET sentence
    call ReadString

    mov edx, OFFSET msg2
    call WriteString
    mov edx, OFFSET word
    call ReadString

    invoke CountWordOccurrences, ADDR sentence, ADDR word
    mov edx, OFFSET foundMsg
    call WriteString
    call WriteInt
    call Crlf
    exit
main ENDP

CountWordOccurrences PROC
    pushad
    push ebp
    mov ebp, esp
    enter 0, 0

    ; Parameters: [ebp+8] = sentence, [ebp+12] = word
    mov esi, [ebp+8]  ; sentence
    mov edi, [ebp+12] ; word
    xor ecx, ecx      ; count

next_token:
    ; Compare word at current sentence pointer
    push esi
    push edi
    call StrCompare
    cmp eax, 1
    jne skip_inc
    inc ecx
skip_inc:
    pop edi
    pop esi

    ; move to next word (skip until space or null)
    next_char:
        mov al, [esi]
        cmp al, 0
        je end_loop
        cmp al, ' '
        je after_space
        inc esi
        jmp next_char
    after_space:
        inc esi
        jmp next_token

end_loop:
    mov eax, ecx
    leave
    pop ebp
    popad
    ret 8
CountWordOccurrences ENDP

StrCompare PROC
    ; Compares two null-terminated strings
    ; Returns: EAX = 1 if equal, 0 if not

    push ebp
    mov ebp, esp
    push esi
    push edi

    mov esi, [ebp+8]
    mov edi, [ebp+12]

cmp_loop:
    mov al, [esi]
    mov bl, [edi]
    cmp al, bl
    jne not_equal
    cmp al, 0
    je equal
    inc esi
    inc edi
    jmp cmp_loop

equal:
    mov eax, 1
    jmp done
not_equal:
    mov eax, 0
done:
    pop edi
    pop esi
    pop ebp
    ret 8
StrCompare ENDP
```

---

## ✅ **Q8: Find Maximum Element and Index**

```asm
INCLUDE Irvine32.inc

.data
arr DWORD 4, 6, 9, 2, 8, 10, 1
msg BYTE "Max = ", 0
msg2 BYTE "Index = ", 0

maxVal DWORD ?
maxIdx DWORD ?

.code
main PROC
    invoke FindMax, OFFSET arr, LENGTHOF arr, ADDR maxVal, ADDR maxIdx
    mov edx, OFFSET msg
    call WriteString
    mov eax, maxVal
    call WriteInt
    call Crlf

    mov edx, OFFSET msg2
    call WriteString
    mov eax, maxIdx
    call WriteInt
    call Crlf
    exit
main ENDP

FindMax PROC
    ; Parameters: [ebp+8] = array ptr, [ebp+12] = size
    ;             [ebp+16] = ptr to max value, [ebp+20] = ptr to max index

    push ebp
    mov ebp, esp
    enter 0, 0

    mov esi, [ebp+8]
    mov ecx, [ebp+12]
    mov eax, [esi]
    mov edx, 0 ; index

next:
    cmp ecx, 1
    je store_result
    add esi, 4
    inc edx
    cmp eax, [esi]
    jge skip
    mov eax, [esi]
    mov ebx, edx
skip:
    dec ecx
    jmp next

store_result:
    mov edi, [ebp+16]
    mov [edi], eax
    mov edi, [ebp+20]
    mov [edi], ebx

    leave
    pop ebp
    ret 16
FindMax ENDP
```

---

## ✅ **Q9: Validate Balanced Parentheses**

```asm
INCLUDE Irvine32.inc

.data
msg BYTE "Enter string with parentheses: ", 0
input BYTE 100 DUP(0)
validMsg BYTE "Balanced", 0
invalidMsg BYTE "Unbalanced", 0

.code
main PROC
    mov edx, OFFSET msg
    call WriteString
    mov edx, OFFSET input
    call ReadString

    invoke IsBalanced, ADDR input
    cmp eax, 1
    je balanced
    mov edx, OFFSET invalidMsg
    jmp show
balanced:
    mov edx, OFFSET validMsg
show:
    call WriteString
    call Crlf
    exit
main ENDP

IsBalanced PROC
    push ebp
    mov ebp, esp
    enter 4, 0        ; LOCAL counter: [ebp-4]
    mov esi, [ebp+8]
    mov dword ptr [ebp-4], 0

next_char:
    mov al, [esi]
    cmp al, 0
    je check_done

    cmp al, '('
    jne check_close
    inc dword ptr [ebp-4]
    jmp skip

check_close:
    cmp al, ')'
    jne skip
    dec dword ptr [ebp-4]
    cmp dword ptr [ebp-4], -1
    jl not_balanced

skip:
    inc esi
    jmp next_char

check_done:
    cmp dword ptr [ebp-4], 0
    jne not_balanced
    mov eax, 1
    jmp done

not_balanced:
    mov eax, 0

done:
    leave
    pop ebp
    ret 4
IsBalanced ENDP
```

---

## ✅ **Q10: Analyze String: Count Upper, Lower, Digits**

```asm
INCLUDE Irvine32.inc

.data
msg BYTE "Enter a string: ", 0
input BYTE 100 DUP(0)

upMsg BYTE "Uppercase = ", 0
lowMsg BYTE "Lowercase = ", 0
digMsg BYTE "Digits = ", 0

.code
main PROC
    mov edx, OFFSET msg
    call WriteString
    mov edx, OFFSET input
    call ReadString

    invoke AnalyzeString, ADDR input
    exit
main ENDP

AnalyzeString PROC
    pushad
    push ebp
    mov ebp, esp
    enter 12, 0 ; 3 LOCAL variables (3*4=12): upper, lower, digit

    mov dword ptr [ebp-4], 0 ; upper
    mov dword ptr [ebp-8], 0 ; lower
    mov dword ptr [ebp-12], 0 ; digit

    mov esi, [ebp+8]

next:
    mov al, [esi]
    cmp al, 0
    je done

    cmp al, 'A'
    jb check_lower
    cmp al, 'Z'
    ja check_lower
    inc dword ptr [ebp-4]
    jmp inc_esi

check_lower:
    cmp al, 'a'
    jb check_digit
    cmp al, 'z'
    ja check_digit
    inc dword ptr [ebp-8]
    jmp inc_esi

check_digit:
    cmp al, '0'
    jb inc_esi
    cmp al, '9'
    ja inc_esi
    inc dword ptr [ebp-12]

inc_esi:
    inc esi
    jmp next

done:
    mov edx, OFFSET upMsg
    call WriteString
    mov eax, [ebp-4]
    call WriteInt
    call Crlf

    mov edx, OFFSET lowMsg
    call WriteString
    mov eax, [ebp-8]
    call WriteInt
    call Crlf

    mov edx, OFFSET digMsg
    call WriteString
    mov eax, [ebp-12]
    call WriteInt
    call Crlf

    leave
    pop ebp
    popad
    ret 4
AnalyzeString ENDP
```

---

