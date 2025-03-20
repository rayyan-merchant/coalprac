Here are **MASM Assembly programs** using **Irvine32** for **Control Flow & Loops** 🚀  

---

## **1️⃣ Print a Multiplication Table (Example: Table of 5)**
```assembly
INCLUDE Irvine32.inc

.data
    num DWORD 5     ; Change this to print any table
    i DWORD 1
    msg BYTE " x ", 0
    eq BYTE " = ", 0

.code
main PROC
    mov ecx, 10     ; Loop 10 times for table

print_table:
    mov eax, num
    mov ebx, i
    mul ebx         ; EAX = num * i

    mov edx, 0
    mov eax, num
    call WriteDec   ; Print number

    mov edx, OFFSET msg
    call WriteString

    mov eax, i
    call WriteDec   ; Print multiplier

    mov edx, OFFSET eq
    call WriteString

    mov eax, ebx
    call WriteDec   ; Print result

    call CrLf

    inc i
    loop print_table

    exit
main ENDP
END main
```
✅ **Logic:** Loops 10 times, multiplies `num` with `i`, and prints in `5 x 1 = 5` format.  

---

## **2️⃣ Print a Right-Angle Triangle Pattern**
```assembly
INCLUDE Irvine32.inc

.data
    star BYTE '*', 0
    space BYTE ' ', 0
    n DWORD 5  ; Height of triangle

.code
main PROC
    mov ecx, n   ; Outer loop (rows)

row_loop:
    push ecx
    mov ecx, n
    sub ecx, eax ; Number of stars

print_stars:
    mov edx, OFFSET star
    call WriteString
    loop print_stars

    call CrLf
    pop ecx
    dec n
    jnz row_loop

    exit
main ENDP
END main
```
✅ **Logic:** Uses nested loops to print `*` in a triangular shape.  

---

## **3️⃣ Find Sum of First N Natural Numbers**
```assembly
INCLUDE Irvine32.inc

.data
    n DWORD 10    ; Change this value to sum up to any number
    sum DWORD 0

.code
main PROC
    mov ecx, n    ; Set loop counter
    mov eax, 0    ; Accumulator for sum

sum_loop:
    add eax, ecx  ; Add counter to sum
    loop sum_loop

    call WriteDec ; Print sum
    call CrLf
    exit
main ENDP
END main
```
✅ **Logic:** Uses a loop to add numbers from `n` to `1`.  

---

### Let me know if you need **more patterns** or **explanations!** 🚀
