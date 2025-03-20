Here are MASM Assembly programs for **Bitwise & Logical Operations** using **Irvine32**:  

---

## **1️⃣ Check if a Number is Even or Odd using Bitwise AND**  
```assembly
INCLUDE Irvine32.inc

.data
    num DWORD 7   ; Change this value to test different numbers
    evenMsg BYTE "Even", 0
    oddMsg BYTE "Odd", 0

.code
main PROC
    mov eax, num
    and eax, 1          ; Check least significant bit

    cmp eax, 0
    je even

    mov edx, OFFSET oddMsg
    call WriteString
    jmp done

even:
    mov edx, OFFSET evenMsg
    call WriteString

done:
    call CrLf
    exit
main ENDP
END main
```
✅ **Logic:** If `num AND 1 == 0`, it's even; otherwise, it's odd.  

---

## **2️⃣ Count the Number of 1s in Binary Representation**  
```assembly
INCLUDE Irvine32.inc

.data
    num DWORD 29        ; Example: 29 (11101 in binary)
    count DWORD 0

.code
main PROC
    mov eax, num
    mov ecx, 0          ; Initialize count to 0

count_ones:
    test eax, 1         ; Check if LSB is 1
    jz skip_increment
    inc ecx

skip_increment:
    shr eax, 1          ; Shift right
    cmp eax, 0
    jne count_ones

    mov eax, ecx
    call WriteDec
    call CrLf

    exit
main ENDP
END main
```
✅ **Logic:** Right shift each bit and count the number of `1`s.  

---

## **3️⃣ Swap Two Numbers Without Using a Third Variable**  
```assembly
INCLUDE Irvine32.inc

.data
    num1 DWORD 5
    num2 DWORD 10

.code
main PROC
    mov eax, num1
    mov ebx, num2

    xor eax, ebx
    xor ebx, eax
    xor eax, ebx

    mov num1, eax
    mov num2, ebx

    call WriteDec
    call CrLf
    mov eax, num2
    call WriteDec
    call CrLf

    exit
main ENDP
END main
```
✅ **Logic:** Uses XOR swap algorithm to swap without a temporary variable.  

---

### ✅ Let me know if you need modifications or explanations! 🚀
