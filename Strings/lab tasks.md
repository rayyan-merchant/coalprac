
---

### **1. Scan_String Procedure**  
Finds the index of the first occurrence of `#` in `Str1`:  
```assembly
INCLUDE Irvine32.inc

.data
    Str1 BYTE '127&j~3#^&*#*#45^',0
    index DWORD ?

.code
main PROC
    call Scan_String
    mov index, eax    ; Result stored in EAX
    exit
main ENDP

Scan_String PROC
    mov edi, OFFSET Str1    ; EDI points to string
    mov al, '#'             ; Character to find
    mov ecx, LENGTHOF Str1  ; Max iterations
    cld                     ; Forward direction
    repne scasb             ; Scan until '#' found
    jnz not_found           ; Jump if not found
    sub edi, OFFSET Str1    ; Calculate index
    dec edi                 ; Adjust for REPNE increment
    mov eax, edi
    ret
not_found:
    mov eax, -1             ; Return -1 if not found
    ret
Scan_String ENDP
END main
```

---

### **2. Modified Scan_String with Parameters**  
Accepts string offset and character via stack:  
```assembly
Scan_String PROC
    push ebp
    mov ebp, esp
    mov edi, [ebp+8]        ; Offset of string
    mov al, [ebp+12]        ; Character to search
    mov ecx, 0              ; Find length first
find_length:
    cmp BYTE PTR [edi+ecx], 0
    je length_found
    inc ecx
    jmp find_length
length_found:
    cld
    repne scasb
    jnz not_found
    sub edi, [ebp+8]        ; Calculate index
    dec edi
    mov eax, edi
    jmp done
not_found:
    mov eax, -1
done:
    pop ebp
    ret 8                   ; Clean stack (2 DWORD args)
Scan_String ENDP
```

---

### **3. IsCompare Procedure**  
Compares two strings and returns result in EAX:  
```assembly
IsCompare PROC
    push ebp
    mov ebp, esp
    mov esi, [ebp+8]        ; String1 offset
    mov edi, [ebp+12]       ; String2 offset
compare_loop:
    cmpsb                   ; Compare bytes
    jne mismatch
    cmp BYTE PTR [esi-1], 0 ; Check if end of string
    jne compare_loop
    mov eax, 0              ; Strings are equal
    jmp done
mismatch:
    mov al, [esi-1]
    cmp al, [edi-1]
    jb less
    mov eax, 1              ; String1 > String2
    jmp done
less:
    mov eax, -1             ; String1 < String2
done:
    pop ebp
    ret 8
IsCompare ENDP
```

---

### **4. Str_Reverse Procedure**  
Reverses a null-terminated string:  
```assembly
Str_Reverse PROC
    push ebp
    mov ebp, esp
    mov esi, [ebp+8]        ; String offset
    ; Find string length
    mov edi, esi
    mov ecx, 0
find_length:
    cmp BYTE PTR [edi], 0
    je length_found
    inc edi
    inc ecx
    jmp find_length
length_found:
    dec edi                 ; EDI points to last character
reverse_loop:
    cmp esi, edi
    jge done
    mov al, [esi]           ; Swap characters
    mov bl, [edi]
    mov [esi], bl
    mov [edi], al
    inc esi
    dec edi
    jmp reverse_loop
done:
    pop ebp
    ret 4
Str_Reverse ENDP
```

---

### **5. Load and Multiply Array**  
Multiplies each element by a given value:  
```assembly
LoadMultiply PROC
    push ebp
    mov ebp, esp
    mov esi, [ebp+8]        ; Array offset
    mov ebx, [ebp+12]       ; Multiplier (byte)
    mov ecx, [ebp+16]       ; Number of elements
    cld
process_loop:
    lodsd                   ; Load element into EAX
    imul eax, ebx           ; Multiply by byte (sign-extended)
    stosd                   ; Store result back
    loop process_loop
    pop ebp
    ret 12                  ; Clean stack (3 DWORD args)
LoadMultiply ENDP
```

---

**Usage Notes:**  
- **Stack Parameters**: Procedures use the stack for arguments (e.g., `push OFFSET str1` before calling).  
- **Direction Flag**: `CLD` ensures forward string processing.  
- **Return Values**: Results returned in `EAX` (e.g., index, comparison result).  
- **String Handling**: Leverages `SCASB`, `CMPSB`, and `STOSB` for efficient operations.  
