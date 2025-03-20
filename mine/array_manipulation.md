Here are **Assembly language programs** for **Array Manipulation** using **MASM (x86, 32-bit) with Irvine32**:  

---

## **1️⃣ Sort an Array (Bubble Sort)**
```assembly
INCLUDE Irvine32.inc

.data
    arr DWORD 5, 3, 8, 6, 2
    len DWORD LENGTHOF arr

.code
main PROC
    mov ecx, len
    dec ecx                ; Outer loop count = len-1
outer_loop:
    push ecx               ; Save outer loop counter
    mov esi, 0             ; Start at first element
    mov ecx, len
    dec ecx                ; Inner loop count = len-1

inner_loop:
    mov eax, [arr + esi]
    mov ebx, [arr + esi + TYPE arr]
    cmp eax, ebx
    jle no_swap
    mov [arr + esi], ebx   ; Swap elements
    mov [arr + esi + TYPE arr], eax

no_swap:
    add esi, TYPE arr      ; Move to next element
    loop inner_loop

    pop ecx
    loop outer_loop

    mov esi, 0
print_sorted:
    mov eax, [arr + esi]
    call WriteDec
    call CrLf
    add esi, TYPE arr
    cmp esi, len * TYPE arr
    jl print_sorted

    exit
main ENDP
END main
```

---

## **2️⃣ Find Maximum & Minimum in an Array**
```assembly
INCLUDE Irvine32.inc

.data
    arr DWORD 10, 25, 5, 45, 7
    len DWORD LENGTHOF arr
    maxVal DWORD ?
    minVal DWORD ?

.code
main PROC
    mov eax, arr       ; First element as max
    mov maxVal, eax
    mov minVal, eax
    mov ecx, len
    dec ecx            ; Loop len-1 times
    mov esi, TYPE arr  ; Start from second element

find_max_min:
    mov eax, [arr + esi]
    
    cmp eax, maxVal
    jle check_min
    mov maxVal, eax   ; Update max

check_min:
    cmp eax, minVal
    jge next
    mov minVal, eax   ; Update min

next:
    add esi, TYPE arr
    loop find_max_min

    mov eax, maxVal
    call WriteDec      ; Print max
    call CrLf

    mov eax, minVal
    call WriteDec      ; Print min
    call CrLf

    exit
main ENDP
END main
```

---

## **3️⃣ Reverse an Array**
```assembly
INCLUDE Irvine32.inc

.data
    arr DWORD 5, 10, 15, 20, 25
    len DWORD LENGTHOF arr

.code
main PROC
    mov esi, 0
    mov edi, (len-1) * TYPE arr

reverse_loop:
    cmp esi, edi
    jge print_array  ; Stop when pointers meet

    ; Swap arr[esi] and arr[edi]
    mov eax, [arr + esi]
    mov ebx, [arr + edi]
    mov [arr + esi], ebx
    mov [arr + edi], eax

    add esi, TYPE arr
    sub edi, TYPE arr
    jmp reverse_loop

print_array:
    mov esi, 0
print_loop:
    mov eax, [arr + esi]
    call WriteDec
    call CrLf
    add esi, TYPE arr
    cmp esi, len * TYPE arr
    jl print_loop

    exit
main ENDP
END main
```

---

## **4️⃣ Sum of All Elements in an Array**
```assembly
INCLUDE Irvine32.inc

.data
    arr DWORD 5, 10, 15, 20, 25
    len DWORD LENGTHOF arr
    sum DWORD 0

.code
main PROC
    mov ecx, len
    mov esi, 0
    mov eax, 0       ; Sum initialized to 0

sum_loop:
    add eax, [arr + esi]
    add esi, TYPE arr
    loop sum_loop

    call WriteDec    ; Print sum
    call CrLf

    exit
main ENDP
END main
```

---

### 💡 **Need more Assembly programs? Let me know! 🚀**
