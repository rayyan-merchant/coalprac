
---

### ✅ **Q1. Copy and Uppercase a String**

```asm
INCLUDE Irvine32.inc

.data
    source  BYTE 100 DUP(?)
    dest    BYTE 100 DUP(?)

.code
main PROC
    ; Input string
    mov edx, OFFSET source
    call ReadString

    ; Use ESI/EDI and MOVSB to copy string
    lea esi, source
    lea edi, dest

copy_loop:
    lodsb                   ; Load byte from [esi] to AL
    stosb                   ; Store AL to [edi]
    cmp al, 0               ; Check for null terminator
    jne copy_loop

    ; Convert copied string to uppercase
    lea edx, dest
    call Str_ucase

    ; Display result
    call Crlf
    mov edx, OFFSET dest
    call WriteString
    call Crlf

    exit
main ENDP
END main
```

---

### ✅ **Q2. Compare Two Strings Case-Insensitively**

```asm
INCLUDE Irvine32.inc

.data
    str1    BYTE 100 DUP(?)
    str2    BYTE 100 DUP(?)
    msgEq   BYTE "Strings are equal", 0
    msgNeq  BYTE "Strings are NOT equal", 0

.code
main PROC
    ; Read first string
    mov edx, OFFSET str1
    call ReadString

    ; Read second string
    mov edx, OFFSET str2
    call ReadString

    ; Convert both to uppercase
    lea edx, str1
    call Str_ucase

    lea edx, str2
    call Str_ucase

    ; Compare
    lea esi, str1
    lea edi, str2
    call Str_compare

    cmp eax, 0
    je equal
    mov edx, OFFSET msgNeq
    jmp display

equal:
    mov edx, OFFSET msgEq

display:
    call Crlf
    call WriteString
    call Crlf

    exit
main ENDP
END main
```

---

### ✅ **Q3. Remove All Spaces from a String**

```asm
INCLUDE Irvine32.inc

.data
    original BYTE 100 DUP(?)
    cleaned  BYTE 100 DUP(0)

.code
main PROC
    ; Read string
    mov edx, OFFSET original
    call ReadString

    ; Set source and destination
    lea esi, original
    lea edi, cleaned

remove_spaces:
    lodsb
    cmp al, 0
    je done
    cmp al, ' '
    je remove_spaces         ; Skip spaces
    stosb
    jmp remove_spaces

done:
    mov al, 0
    stosb                    ; Null-terminate cleaned string

    ; Output
    call Crlf
    mov edx, OFFSET cleaned
    call WriteString
    call Crlf

    exit
main ENDP
END main
```

---

### ✅ **Q4. Replace All Occurrences of a Character**

```asm
INCLUDE Irvine32.inc

.data
    text     BYTE 100 DUP(?)
    findChar BYTE ?
    replChar BYTE ?
    prompt1  BYTE "Enter character to replace: ", 0
    prompt2  BYTE "Enter replacement character: ", 0

.code
main PROC
    ; Read string
    mov edx, OFFSET text
    call ReadString

    ; Get character to find
    mov edx, OFFSET prompt1
    call WriteString
    call ReadChar
    mov findChar, al
    call Crlf

    ; Get replacement character
    mov edx, OFFSET prompt2
    call WriteString
    call ReadChar
    mov replChar, al
    call Crlf

    ; Replace loop
    lea esi, text

replace_loop:
    mov al, [esi]
    cmp al, 0
    je done
    cmp al, findChar
    jne skip
    mov al, replChar
    mov [esi], al

skip:
    inc esi
    jmp replace_loop

done:
    call Crlf
    mov edx, OFFSET text
    call WriteString
    call Crlf

    exit
main ENDP
END main
```

---

### ✅ **Q5. Palindrome Checker**

```asm
INCLUDE Irvine32.inc

.data
    input    BYTE 100 DUP(?)
    reversed BYTE 100 DUP(?)
    msgYes   BYTE "Palindrome", 0
    msgNo    BYTE "Not a palindrome", 0

.code
main PROC
    mov edx, OFFSET input
    call ReadString

    ; Get string length
    lea edx, input
    call Str_length
    mov ecx, eax            ; Save length in ECX

    lea esi, input
    lea edi, reversed
    add esi, ecx            ; Point to last character
    dec esi

reverse_loop:
    mov al, [esi]
    mov [edi], al
    dec esi
    inc edi
    loop reverse_loop

    mov byte ptr [edi], 0   ; Null-terminate

    ; Compare original and reversed
    lea esi, input
    lea edi, reversed
    call Str_compare

    cmp eax, 0
    je is_palindrome

    mov edx, OFFSET msgNo
    jmp show_result

is_palindrome:
    mov edx, OFFSET msgYes

show_result:
    call Crlf
    call WriteString
    call Crlf
    exit
main ENDP
END main
```

---

---

### ✅ **Q6. Merge Two Strings Alternately**

```asm
INCLUDE Irvine32.inc

.data
    str1     BYTE 100 DUP(?)
    str2     BYTE 100 DUP(?)
    merged   BYTE 200 DUP(0)
    len1     DWORD ?
    len2     DWORD ?

.code
main PROC
    ; Read first string
    mov edx, OFFSET str1
    call ReadString

    ; Read second string
    mov edx, OFFSET str2
    call ReadString

    ; Get lengths
    lea edx, str1
    call Str_length
    mov len1, eax

    lea edx, str2
    call Str_length
    mov len2, eax

    lea esi, str1
    lea edi, str2
    lea ebx, merged

    xor ecx, ecx

merge_loop:
    cmp ecx, len1
    jae skip1
    mov al, [esi + ecx]
    mov [ebx], al
    inc ebx

skip1:
    cmp ecx, len2
    jae skip2
    mov al, [edi + ecx]
    mov [ebx], al
    inc ebx

skip2:
    inc ecx
    cmp ecx, 100
    jb merge_loop

    mov byte ptr [ebx], 0

    ; Output merged string
    call Crlf
    mov edx, OFFSET merged
    call WriteString
    call Crlf

    exit
main ENDP
END main
```

---

### ✅ **Q7. Find and Count Word Occurrences**

```asm
INCLUDE Irvine32.inc

.data
    text     BYTE "this is a test. this test is simple.", 0
    word     BYTE "test", 0
    count    DWORD 0
    temp     BYTE 100 DUP(0)
    lenT     DWORD ?
    lenW     DWORD ?

.code
main PROC
    lea edx, text
    call Str_length
    mov lenT, eax

    lea edx, word
    call Str_length
    mov lenW, eax

    lea esi, text
    lea edi, temp

next_substring:
    mov ecx, lenW
    push esi
    push edi

copy_sub:
    lodsb
    stosb
    loop copy_sub

    mov byte ptr [edi], 0

    pop edi
    pop esi

    lea esi, temp
    lea edi, word
    call Str_compare
    cmp eax, 0
    jne skip
    inc count

skip:
    lea esi, esi
    inc esi
    cmp byte ptr [esi + lenW - 1], 0
    jne next_substring

    ; Print count
    call Crlf
    mov eax, count
    call WriteDec
    call Crlf

    exit
main ENDP
END main
```

---

### ✅ **Q8. Remove Duplicate Characters**

```asm
INCLUDE Irvine32.inc

.data
    original BYTE 100 DUP(?)
    result   BYTE 100 DUP(0)
    seen     BYTE 256 DUP(0)  ; ASCII table size

.code
main PROC
    ; Read string
    mov edx, OFFSET original
    call ReadString

    lea esi, original
    lea edi, result

check_loop:
    lodsb
    cmp al, 0
    je done
    movzx ebx, al
    cmp seen[ebx], 1
    je skip
    mov seen[ebx], 1
    stosb

skip:
    jmp check_loop

done:
    mov al, 0
    stosb

    call Crlf
    mov edx, OFFSET result
    call WriteString
    call Crlf

    exit
main ENDP
END main
```

---

### ✅ **Q9. Encrypt a String Using Caesar Cipher**

```asm
INCLUDE Irvine32.inc

.data
    plain   BYTE 100 DUP(?)
    shift   BYTE ?
    encrypted BYTE 100 DUP(0)

.code
main PROC
    ; Read string
    mov edx, OFFSET plain
    call ReadString

    ; Read shift
    call Crlf
    call ReadInt
    movzx ecx, ax
    mov shift, cl

    lea esi, plain
    lea edi, encrypted

encrypt_loop:
    lodsb
    cmp al, 0
    je done
    cmp al, 'A'
    jb not_letter
    cmp al, 'Z'
    jbe upper
    cmp al, 'a'
    jb not_letter
    cmp al, 'z'
    ja not_letter

    ; Lowercase
    sub al, 'a'
    add al, shift
    and al, 0x1F
    add al, 'a'
    stosb
    jmp encrypt_loop

upper:
    sub al, 'A'
    add al, shift
    and al, 0x1F
    add al, 'A'
    stosb
    jmp encrypt_loop

not_letter:
    stosb
    jmp encrypt_loop

done:
    mov al, 0
    stosb

    call Crlf
    mov edx, OFFSET encrypted
    call WriteString
    call Crlf

    exit
main ENDP
END main
```

---

### ✅ **Q10. Reverse Each Word in a Sentence**

```asm
INCLUDE Irvine32.inc

.data
    sentence BYTE 100 DUP(?)
    reversed BYTE 100 DUP(?)
    temp     BYTE 100 DUP(?)

.code
main PROC
    mov edx, OFFSET sentence
    call ReadString

    lea esi, sentence
    lea edi, reversed

next_word:
    cmp byte ptr [esi], 0
    je done

    lea ebx, temp
    xor ecx, ecx

    ; Copy word to temp
copy_word:
    mov al, [esi]
    cmp al, ' '
    je end_word
    cmp al, 0
    je end_word
    mov [ebx + ecx], al
    inc ecx
    inc esi
    jmp copy_word

end_word:
    mov byte ptr [ebx + ecx], 0

    ; Reverse word
    mov eax, ecx
    dec eax
    xor edx, edx

reverse_word:
    mov al, [temp + eax]
    mov [edi + edx], al
    inc edx
    dec eax
    jns reverse_word

    ; Add space or null
    mov al, [esi]
    cmp al, 0
    je add_null
    mov al, ' '
    mov [edi + edx], al
    inc edx
    inc esi
    jmp next_word

add_null:
    mov byte ptr [edi + edx], 0

    call Crlf
    mov edx, OFFSET reversed
    call WriteString
    call Crlf

    exit
main ENDP
END main
```

---
