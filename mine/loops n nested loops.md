
---

## ✅ **Question 1: Sum of First N Natural Numbers**

```asm
INCLUDE Irvine32.inc

.code
main PROC
    call ReadInt        ; Read N
    mov ecx, eax        ; Use ECX as counter
    mov eax, 0          ; EAX will hold sum

SumLoop:
    add eax, ecx
    loop SumLoop

    call WriteInt
    call Crlf
    exit
main ENDP
END main
```

---

## ✅ **Question 2: Factorial of a Number**

```asm
INCLUDE Irvine32.inc

.code
main PROC
    call ReadInt        ; Read N
    mov ecx, eax        ; ECX = counter
    mov eax, 1          ; EAX = result

FactorialLoop:
    imul eax, ecx
    loop FactorialLoop

    call WriteInt
    call Crlf
    exit
main ENDP
END main
```

---

## ✅ **Question 3: Reverse Print Numbers from N to 1**

```asm
INCLUDE Irvine32.inc

.code
main PROC
    call ReadInt        ; Read N
    mov ecx, eax        ; ECX = N

PrintLoop:
    mov eax, ecx
    call WriteInt
    call Crlf
    loop PrintLoop

    exit
main ENDP
END main
```

---

## ✅ **Question 4: Count Even and Odd Numbers in an Array**

```asm
INCLUDE Irvine32.inc

.data
arr DWORD 10 DUP(?)
evenCount DWORD 0
oddCount  DWORD 0

.code
main PROC
    mov ecx, 10
    mov esi, OFFSET arr

InputLoop:
    call ReadInt
    mov [esi], eax
    add esi, 4
    loop InputLoop

    mov ecx, 10
    mov esi, OFFSET arr

CountLoop:
    mov eax, [esi]
    test eax, 1
    jz IsEven
    inc oddCount
    jmp Next

IsEven:
    inc evenCount

Next:
    add esi, 4
    loop CountLoop

    ; Print counts
    mov edx, OFFSET evenCount
    mov eax, evenCount
    call WriteString
    mov eax, evenCount
    call WriteInt
    call Crlf

    mov eax, oddCount
    call WriteInt
    call Crlf

    exit
main ENDP
END main
```

---

## ✅ **Question 5: Print Multiplication Table (1 to 10)**

```asm
INCLUDE Irvine32.inc

.data
msg BYTE " x ", 0
eq  BYTE " = ", 0

.code
main PROC
    call ReadInt        ; Read number N
    mov ebx, eax        ; Store N in EBX

    mov ecx, 10         ; Loop from 1 to 10
    mov esi, 1

MulLoop:
    mov eax, ebx        ; N
    mov edi, esi        ; i
    imul eax, esi       ; N * i

    mov eax, ebx
    call WriteInt
    mov edx, OFFSET msg
    call WriteString
    mov eax, edi
    call WriteInt
    mov edx, OFFSET eq
    call WriteString
    mov eax, ebx
    imul eax, edi
    call WriteInt
    call Crlf

    inc esi
    loop MulLoop

    exit
main ENDP
END main
```

---

Here are the **MASM + Irvine32 solutions** for **Questions 6 to 10**, using **loops and nested loops**, focused on matrices and arrays.

---

## ✅ **Question 6: Matrix Addition (2x2)**

```asm
INCLUDE Irvine32.inc

.data
matrix1 DWORD 4 DUP(?)
matrix2 DWORD 4 DUP(?)
result  DWORD 4 DUP(?)

.code
main PROC
    ; Input Matrix 1
    mov ecx, 4
    mov esi, OFFSET matrix1
InputM1:
    call ReadInt
    mov [esi], eax
    add esi, 4
    loop InputM1

    ; Input Matrix 2
    mov ecx, 4
    mov esi, OFFSET matrix2
InputM2:
    call ReadInt
    mov [esi], eax
    add esi, 4
    loop InputM2

    ; Add both matrices
    mov ecx, 4
    mov esi, OFFSET matrix1
    mov edi, OFFSET matrix2
    mov ebx, OFFSET result

AddLoop:
    mov eax, [esi]
    add eax, [edi]
    mov [ebx], eax
    add esi, 4
    add edi, 4
    add ebx, 4
    loop AddLoop

    ; Print Result
    mov ecx, 4
    mov esi, OFFSET result
PrintResult:
    mov eax, [esi]
    call WriteInt
    call Crlf
    add esi, 4
    loop PrintResult

    exit
main ENDP
END main
```

---

## ✅ **Question 7: Matrix Transpose (3x3)**

```asm
INCLUDE Irvine32.inc

.data
matrix DWORD 9 DUP(?)
transpose DWORD 9 DUP(?)

.code
main PROC
    ; Input 3x3 matrix
    mov ecx, 9
    mov esi, OFFSET matrix
InputLoop:
    call ReadInt
    mov [esi], eax
    add esi, 4
    loop InputLoop

    ; Transpose matrix: T[i][j] = A[j][i]
    mov ecx, 3            ; row counter
    mov ebx, 0            ; i (row)
OuterLoop:
    mov edx, 0            ; j (column)
InnerLoop:
    mov esi, OFFSET matrix
    mov edi, OFFSET transpose
    ; Compute A[i][j] => index = i * 3 + j
    mov eax, ebx
    imul eax, 3
    add eax, edx
    mov eax, [esi + eax*4]

    ; Compute T[j][i] => index = j * 3 + i
    mov ecx, edx
    imul ecx, 3
    add ecx, ebx
    mov [edi + ecx*4], eax

    inc edx
    cmp edx, 3
    jl InnerLoop

    inc ebx
    cmp ebx, 3
    jl OuterLoop

    ; Print Transposed Matrix
    mov esi, OFFSET transpose
    mov ecx, 9
PrintTranspose:
    mov eax, [esi]
    call WriteInt
    call Crlf
    add esi, 4
    loop PrintTranspose

    exit
main ENDP
END main
```

---

## ✅ **Question 8: Sum of Each Row in a 3x3 Matrix**

```asm
INCLUDE Irvine32.inc

.data
matrix DWORD 9 DUP(?)
.code
main PROC
    ; Input 3x3 matrix
    mov ecx, 9
    mov esi, OFFSET matrix
InputLoop:
    call ReadInt
    mov [esi], eax
    add esi, 4
    loop InputLoop

    ; Calculate sum of each row
    mov ebx, 0         ; row index
RowLoop:
    mov ecx, 3         ; 3 columns per row
    mov eax, 0         ; sum = 0
    mov edi, ebx
    imul edi, 3
    imul edi, 4        ; offset = row * 3 * 4
    mov esi, OFFSET matrix
    add esi, edi

SumCols:
    add eax, [esi]
    add esi, 4
    loop SumCols

    ; Print row sum
    call WriteInt
    call Crlf

    inc ebx
    cmp ebx, 3
    jl RowLoop

    exit
main ENDP
END main
```

---

## ✅ **Question 9: Search for an Element in an Array**

```asm
INCLUDE Irvine32.inc

.data
arr DWORD 10 DUP(?)
foundMsg BYTE "Element found at index: ", 0
notFoundMsg BYTE "Element not found", 0

.code
main PROC
    ; Input array
    mov ecx, 10
    mov esi, OFFSET arr
InputLoop:
    call ReadInt
    mov [esi], eax
    add esi, 4
    loop InputLoop

    ; Read search value
    call ReadInt
    mov ebx, eax        ; search value

    ; Search loop
    mov ecx, 10
    mov esi, OFFSET arr
    mov edi, 0          ; index
    mov edx, -1         ; not found by default

SearchLoop:
    mov eax, [esi]
    cmp eax, ebx
    je Found
    add esi, 4
    inc edi
    loop SearchLoop
    jmp NotFound

Found:
    mov edx, edi        ; found index
    mov edx, OFFSET foundMsg
    call WriteString
    mov eax, edi
    call WriteInt
    call Crlf
    jmp Done

NotFound:
    mov edx, OFFSET notFoundMsg
    call WriteString
    call Crlf

Done:
    exit
main ENDP
END main
```

---

## ✅ **Question 10: Copy All Positive Numbers to a New Array**

```asm
INCLUDE Irvine32.inc

.data
arr DWORD 10 DUP(?)
posArr DWORD 10 DUP(?)
count DWORD 0

.code
main PROC
    ; Input 10 numbers
    mov ecx, 10
    mov esi, OFFSET arr
InputLoop:
    call ReadInt
    mov [esi], eax
    add esi, 4
    loop InputLoop

    ; Copy positive numbers
    mov ecx, 10
    mov esi, OFFSET arr
    mov edi, OFFSET posArr
    mov ebx, 0           ; count

CopyLoop:
    mov eax, [esi]
    cmp eax, 0
    jle Skip
    mov [edi], eax
    add edi, 4
    inc ebx
Skip:
    add esi, 4
    loop CopyLoop

    ; Print positive array
    mov ecx, ebx
    mov esi, OFFSET posArr
PrintLoop:
    mov eax, [esi]
    call WriteInt
    call Crlf
    add esi, 4
    loop PrintLoop

    exit
main ENDP
END main
```

---

