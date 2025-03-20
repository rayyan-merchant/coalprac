Here are **Assembly language programs** for **String Operations** using **MASM (x86, 32-bit) with Irvine32**:  

---

## **1️⃣ Check if a String is a Palindrome**
```assembly
INCLUDE Irvine32.inc

.data
    str BYTE "madam", 0  ; Null-terminated string
    len DWORD LENGTHOF str - 1  ; Exclude null terminator
    isPalindrome BYTE "Palindrome", 0
    notPalindrome BYTE "Not a Palindrome", 0

.code
main PROC
    mov esi, offset str
    mov edi, offset str
    add edi, len - 1   ; Point to last character

check_loop:
    cmp esi, edi
    jge palindrome     ; If pointers meet or cross, it's a palindrome

    mov al, [esi]      
    mov bl, [edi]      
    cmp al, bl
    jne not_a_palindrome

    inc esi
    dec edi
    jmp check_loop

palindrome:
    mov edx, offset isPalindrome
    call WriteString
    jmp done

not_a_palindrome:
    mov edx, offset notPalindrome
    call WriteString

done:
    call CrLf
    exit
main ENDP
END main
```

---

## **2️⃣ Count Vowels and Consonants in a String**
```assembly
INCLUDE Irvine32.inc

.data
    str BYTE "assembly", 0
    len DWORD LENGTHOF str - 1
    vowels DWORD 0
    consonants DWORD 0

.code
main PROC
    mov ecx, len
    mov esi, offset str

count_loop:
    mov al, [esi]
    inc esi

    cmp al, 'A'
    je vowel
    cmp al, 'E'
    je vowel
    cmp al, 'I'
    je vowel
    cmp al, 'O'
    je vowel
    cmp al, 'U'
    je vowel
    cmp al, 'a'
    je vowel
    cmp al, 'e'
    je vowel
    cmp al, 'i'
    je vowel
    cmp al, 'o'
    je vowel
    cmp al, 'u'
    je vowel

    inc consonants
    jmp next

vowel:
    inc vowels

next:
    loop count_loop

    mov eax, vowels
    call WriteDec
    call CrLf

    mov eax, consonants
    call WriteDec
    call CrLf

    exit
main ENDP
END main
```

---

## **3️⃣ Convert a String to Uppercase**
```assembly
INCLUDE Irvine32.inc

.data
    str BYTE "hello world", 0
    len DWORD LENGTHOF str - 1

.code
main PROC
    mov ecx, len
    mov esi, offset str

convert_loop:
    mov al, [esi]
    cmp al, 'a'
    jb next
    cmp al, 'z'
    ja next

    sub al, 32   ; Convert to uppercase
    mov [esi], al

next:
    inc esi
    loop convert_loop

    mov edx, offset str
    call WriteString
    call CrLf

    exit
main ENDP
END main
```

---

## **4️⃣ Find the Length of a String (Without Built-in Functions)**
```assembly
INCLUDE Irvine32.inc

.data
    str BYTE "assembly", 0
    length DWORD 0

.code
main PROC
    mov ecx, 0
    mov esi, offset str

find_length:
    mov al, [esi]
    cmp al, 0
    je done

    inc esi
    inc ecx
    jmp find_length

done:
    mov eax, ecx
    call WriteDec
    call CrLf

    exit
main ENDP
END main
```

---

### 💡 **Want more Assembly programs? Let me know! 🚀**
