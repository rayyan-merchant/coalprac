
---

### ✅ **Q1. Sum of All Elements in a 3x3 Matrix**

```asm
INCLUDE Irvine32.inc

.data
matrix DWORD 3*3 DUP(?)  ; 3x3 matrix (row-major order)
sum    DWORD 0
prompt BYTE "Enter element: ", 0

.code
main PROC
    ; Input 9 elements
    mov ecx, 9
    lea edi, matrix

input_loop:
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov [edi], eax
    add edi, 4
    loop input_loop

    ; Sum all elements
    lea esi, matrix
    mov ecx, 9
    xor eax, eax

sum_loop:
    add eax, [esi]
    add esi, 4
    loop sum_loop

    mov sum, eax

    ; Print result
    call Crlf
    mov eax, sum
    call WriteDec
    call Crlf

    exit
main ENDP
END main
```

---

### ✅ **Q2. Find the Maximum Element in a 4x4 Matrix**

```asm
INCLUDE Irvine32.inc

.data
matrix DWORD 16 DUP(?)  ; 4x4 matrix
prompt BYTE "Enter number: ", 0
maxVal DWORD ?

.code
main PROC
    ; Input 16 elements
    lea edi, matrix
    mov ecx, 16

input_loop:
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov [edi], eax
    add edi, 4
    loop input_loop

    ; Find maximum
    lea esi, matrix
    mov eax, [esi]
    mov ecx, 15
    add esi, 4

find_max:
    cmp [esi], eax
    jle skip
    mov eax, [esi]

skip:
    add esi, 4
    loop find_max

    mov maxVal, eax

    call Crlf
    mov eax, maxVal
    call WriteString
    call WriteDec
    call Crlf

    exit
main ENDP
END main
```

---

### ✅ **Q3. Search for a Number in a 5x5 Matrix**

```asm
INCLUDE Irvine32.inc

.data
matrix DWORD 25 DUP(?)
target DWORD ?
prompt BYTE "Enter number: ", 0
foundRow DWORD -1
foundCol DWORD -1

.code
main PROC
    ; Input matrix
    mov ecx, 25
    lea edi, matrix

input_loop:
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov [edi], eax
    add edi, 4
    loop input_loop

    ; Input number to search
    call Crlf
    call WriteString
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov target, eax

    ; Search
    lea esi, matrix
    xor ecx, ecx

search_loop:
    cmp ecx, 25
    je not_found
    mov eax, [esi + ecx*4]
    cmp eax, target
    jne continue
    mov eax, ecx
    mov ebx, 5
    xor edx, edx
    div ebx
    mov foundRow, eax
    mov foundCol, edx
    jmp found

continue:
    inc ecx
    jmp search_loop

not_found:
    call Crlf
    mov edx, OFFSET prompt
    call WriteString
    call Crlf
    jmp exit_prog

found:
    call Crlf
    mov edx, OFFSET prompt
    call WriteString
    mov eax, foundRow
    call WriteDec
    call WriteString
    mov eax, foundCol
    call WriteDec
    call Crlf

exit_prog:
    exit
main ENDP
END main
```

---

### ✅ **Q4. Transpose a 3x3 Matrix**

```asm
INCLUDE Irvine32.inc

.data
matrix DWORD 3*3 DUP(?)
transpose DWORD 3*3 DUP(?)
prompt BYTE "Enter value: ", 0

.code
main PROC
    ; Input matrix
    lea edi, matrix
    mov ecx, 9

input_loop:
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov [edi], eax
    add edi, 4
    loop input_loop

    ; Transpose (row-major)
    mov ecx, 3
    mov esi, 0

outer_loop:
    mov edi, 0
inner_loop:
    mov eax, matrix[esi*12 + edi*4]
    mov transpose[edi*12 + esi*4], eax
    inc edi
    cmp edi, 3
    jl inner_loop

    inc esi
    cmp esi, 3
    jl outer_loop

    ; Print transposed matrix
    call Crlf
    mov ecx, 9
    lea esi, transpose

print_loop:
    mov eax, [esi]
    call WriteDec
    call WriteString
    add esi, 4
    loop print_loop

    call Crlf
    exit
main ENDP
END main
```

---

### ✅ **Q5. Row-Wise Sum of a 4x4 Matrix**

```asm
INCLUDE Irvine32.inc

.data
matrix DWORD 16 DUP(?)
prompt BYTE "Enter element: ", 0

.code
main PROC
    ; Input matrix
    lea edi, matrix
    mov ecx, 16

input_loop:
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov [edi], eax
    add edi, 4
    loop input_loop

    ; Row-wise sum
    mov esi, 0
outer:
    xor eax, eax
    mov ecx, 4

sum_row:
    add eax, matrix[esi*4]
    inc esi
    loop sum_row

    call WriteDec
    call Crlf

    cmp esi, 16
    jl outer

    exit
main ENDP
END main
```

---


Here are the **solutions for Questions 6–10**, involving **sorting and searching in integer arrays** using MASM and the **Irvine32** library.

---

### ✅ **Q6. Sort a 1D Integer Array in Ascending Order (Bubble Sort)**

```asm
INCLUDE Irvine32.inc

.data
arr DWORD 10 DUP(?)
prompt BYTE "Enter number: ", 0

.code
main PROC
    ; Input 10 numbers
    lea edi, arr
    mov ecx, 10

input_loop:
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov [edi], eax
    add edi, 4
    loop input_loop

    ; Bubble Sort
    mov ecx, 9
outer_loop:
    mov esi, 0

inner_loop:
    mov eax, arr[esi*4]
    mov ebx, arr[esi*4 + 4]
    cmp eax, ebx
    jle no_swap

    ; Swap
    mov arr[esi*4], ebx
    mov arr[esi*4 + 4], eax

no_swap:
    inc esi
    cmp esi, ecx
    jl inner_loop

    loop outer_loop

    ; Print sorted array
    call Crlf
    lea esi, arr
    mov ecx, 10
print_loop:
    mov eax, [esi]
    call WriteDec
    call Crlf
    add esi, 4
    loop print_loop

    exit
main ENDP
END main
```

---

### ✅ **Q7. Sort a 2D Array Row-Wise (3x3 Matrix)**

```asm
INCLUDE Irvine32.inc

.data
matrix DWORD 3*3 DUP(?)
prompt BYTE "Enter value: ", 0

.code
main PROC
    ; Input 9 elements
    lea edi, matrix
    mov ecx, 9

input_loop:
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov [edi], eax
    add edi, 4
    loop input_loop

    ; Sort each row (3 rows)
    mov ebx, 0  ; row offset

row_sort:
    ; Bubble sort each row of 3 elements
    mov ecx, 2
outer:
    mov esi, 0
inner:
    mov eax, matrix[ebx + esi*4]
    mov edx, matrix[ebx + esi*4 + 4]
    cmp eax, edx
    jle skip_swap

    ; Swap
    mov matrix[ebx + esi*4], edx
    mov matrix[ebx + esi*4 + 4], eax

skip_swap:
    inc esi
    cmp esi, ecx
    jl inner

    loop outer

    add ebx, 12 ; next row
    cmp ebx, 36
    jl row_sort

    ; Print sorted matrix
    call Crlf
    lea esi, matrix
    mov ecx, 9
print_loop:
    mov eax, [esi]
    call WriteDec
    call Crlf
    add esi, 4
    loop print_loop

    exit
main ENDP
END main
```

---

### ✅ **Q8. Binary Search in a Sorted Array (10 Elements)**

> Make sure the array is sorted before performing binary search.

```asm
INCLUDE Irvine32.inc

.data
arr DWORD 1, 3, 5, 7, 9, 11, 13, 15, 17, 19
target DWORD ?
foundIndex DWORD -1

.code
main PROC
    ; Input number to search
    call WriteString
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov target, eax

    ; Binary Search
    mov esi, 0
    mov edi, 9

binary_loop:
    cmp esi, edi
    jg not_found

    mov eax, esi
    add eax, edi
    shr eax, 1  ; mid = (low + high)/2
    mov ebx, arr[eax*4]

    cmp target, ebx
    je found
    jl go_left

    ; go right
    lea esi, eax
    inc esi
    jmp binary_loop

go_left:
    lea edi, eax
    dec edi
    jmp binary_loop

found:
    mov foundIndex, eax
    call WriteString
    mov eax, foundIndex
    call WriteDec
    call Crlf
    jmp done

not_found:
    call WriteString
    mov edx, OFFSET prompt
    call WriteString
    call Crlf

done:
    exit
main ENDP
END main
```

---

### ✅ **Q9. Count Occurrences of a Number in a 1D Array**

```asm
INCLUDE Irvine32.inc

.data
arr DWORD 10 DUP(?)
count DWORD 0
target DWORD ?
prompt BYTE "Enter number: ", 0

.code
main PROC
    ; Input 10 numbers
    lea edi, arr
    mov ecx, 10

input_loop:
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov [edi], eax
    add edi, 4
    loop input_loop

    ; Input target number
    call WriteString
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov target, eax

    ; Count occurrences
    lea esi, arr
    mov ecx, 10
    xor eax, eax

count_loop:
    mov ebx, [esi]
    cmp ebx, target
    jne skip
    inc count
skip:
    add esi, 4
    loop count_loop

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

### ✅ **Q10. Find Row with Maximum Sum in a 3x4 Matrix**

```asm
INCLUDE Irvine32.inc

.data
matrix DWORD 12 DUP(?)
rowSum DWORD ?
maxSum DWORD ?
maxRow DWORD ?
prompt BYTE "Enter number: ", 0

.code
main PROC
    ; Input 12 elements
    lea edi, matrix
    mov ecx, 12

input_loop:
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov [edi], eax
    add edi, 4
    loop input_loop

    ; Initialize
    mov esi, 0
    mov maxSum, 0
    mov maxRow, 0
    mov ebx, 0  ; row index

row_loop:
    mov ecx, 4
    xor eax, eax

sum_loop:
    add eax, matrix[esi]
    add esi, 4
    loop sum_loop

    mov rowSum, eax
    cmp eax, maxSum
    jle skip_update

    mov maxSum, eax
    mov maxRow, ebx

skip_update:
    inc ebx
    cmp ebx, 3
    jl row_loop

    ; Display row with max sum
    call Crlf
    mov ecx, 4
    mov eax, maxRow
    mov ebx, 4
    mul ebx
    lea esi, matrix
    add esi, eax
    shl eax, 2

print_max_row:
    mov eax, [esi]
    call WriteDec
    call Crlf
    add esi, 4
    loop print_max_row

    exit
main ENDP
END main
```

---

