Here are **MASM Assembly programs** using **Irvine32** for **Stack & Memory Operations** 🚀  

---

## **1️⃣ Push and Pop Operations in a Stack**
```assembly
INCLUDE Irvine32.inc

.data
    num1 DWORD 10
    num2 DWORD 20
    num3 DWORD 30

.code
main PROC
    mov eax, num1
    push eax      ; Push 10 onto stack

    mov eax, num2
    push eax      ; Push 20 onto stack

    mov eax, num3
    push eax      ; Push 30 onto stack

    ; Pop values back in reverse order
    pop eax
    call WriteDec
    call CrLf

    pop eax
    call WriteDec
    call CrLf

    pop eax
    call WriteDec
    call CrLf

    exit
main ENDP
END main
```
✅ **Logic:** Pushes three numbers onto the stack and pops them in **LIFO** (Last In, First Out) order.  

---

## **2️⃣ Swap Two Variables Using the Stack**
```assembly
INCLUDE Irvine32.inc

.data
    num1 DWORD 15
    num2 DWORD 30

.code
main PROC
    mov eax, num1
    mov ebx, num2

    push eax   ; Push num1
    push ebx   ; Push num2

    pop eax    ; Now eax = num2
    pop ebx    ; Now ebx = num1

    call WriteDec   ; Print new num1 (which was num2)
    call CrLf
    call WriteDec   ; Print new num2 (which was num1)
    call CrLf

    exit
main ENDP
END main
```
✅ **Logic:** Uses the **stack** to swap values without using a **temporary variable**.  

---

## **3️⃣ Implement a Recursive Factorial Function**
```assembly
INCLUDE Irvine32.inc

.data
    num DWORD 5  ; Change this for different factorials
    result DWORD ?

.code
Factorial PROC
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]   ; Get function argument (n)

    cmp eax, 1
    jg recursive_case
    mov eax, 1         ; Base case: factorial(1) = 1
    pop ebp
    ret

recursive_case:
    dec eax
    push eax
    call Factorial  ; Recursive call

    pop ecx
    inc ecx
    mul ecx        ; Multiply result with n

    pop ebp
    ret
Factorial ENDP

main PROC
    mov eax, num
    push eax
    call Factorial
    mov result, eax

    call WriteDec   ; Print factorial result
    call CrLf
    exit
main ENDP
END main
```
✅ **Logic:** Uses **recursion** by pushing parameters onto the stack and multiplying results when returning.  

---

Would you like **more examples** or **explanations**? 🚀
