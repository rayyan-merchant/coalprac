Here are **MASM Assembly programs** for **Arithmetic & Logical Operations** using **Irvine32**:  

---

## **1️⃣ Find Factorial of a Number**  
```assembly
INCLUDE Irvine32.inc

.data
    num DWORD 5      ; Number to calculate factorial (Change as needed)
    fact DWORD 1     ; Store factorial result

.code
main PROC
    mov eax, num
    mov ecx, eax     ; Set loop counter

factorial_loop:
    cmp ecx, 1
    jle done         ; If ecx <= 1, exit loop

    mul ecx          ; EAX = EAX * ECX
    loop factorial_loop

done:
    mov eax, fact
    call WriteDec
    call CrLf
    exit
main ENDP
END main
```

---

## **2️⃣ Check if a Number is Prime**  
```assembly
INCLUDE Irvine32.inc

.data
    num DWORD 13
    divisor DWORD 2
    isPrime BYTE "Prime", 0
    notPrime BYTE "Not Prime", 0

.code
main PROC
    mov eax, num
    cmp eax, 2
    je prime         ; 2 is prime

    mov ecx, eax
    shr ecx, 1       ; Limit divisor to num/2

check_loop:
    mov edx, 0
    div divisor
    cmp edx, 0
    je not_prime

    inc divisor
    cmp divisor, ecx
    jle check_loop

prime:
    mov edx, offset isPrime
    call WriteString
    jmp done

not_prime:
    mov edx, offset notPrime
    call WriteString

done:
    call CrLf
    exit
main ENDP
END main
```

---

## **3️⃣ Compute Fibonacci Series (First N Terms)**  
```assembly
INCLUDE Irvine32.inc

.data
    n DWORD 10   ; Number of terms
    first DWORD 0
    second DWORD 1
    next DWORD 0

.code
main PROC
    mov ecx, n

    mov eax, first
    call WriteDec
    call CrLf

    mov eax, second
    call WriteDec
    call CrLf

fibonacci_loop:
    mov eax, first
    add eax, second   ; next = first + second
    mov next, eax

    mov eax, next
    call WriteDec
    call CrLf

    mov eax, second
    mov first, eax
    mov eax, next
    mov second, eax

    loop fibonacci_loop

    exit
main ENDP
END main
```

---

## **4️⃣ Greatest Common Divisor (GCD) using Euclidean Algorithm**  
```assembly
INCLUDE Irvine32.inc

.data
    num1 DWORD 36
    num2 DWORD 24

.code
main PROC
    mov eax, num1
    mov ebx, num2

gcd_loop:
    cmp ebx, 0
    je done

    mov edx, 0
    div ebx
    mov eax, ebx
    mov ebx, edx
    jmp gcd_loop

done:
    call WriteDec
    call CrLf
    exit
main ENDP
END main
```

---

## **5️⃣ Power of a Number Using Repeated Multiplication**  
```assembly
INCLUDE Irvine32.inc

.data
    base DWORD 2
    exponent DWORD 5
    result DWORD 1

.code
main PROC
    mov eax, base
    mov ecx, exponent

power_loop:
    cmp ecx, 0
    je done

    mul result
    loop power_loop

done:
    call WriteDec
    call CrLf
    exit
main ENDP
END main
```

---

### ✅ **Let me know if you need modifications or explanations! 🚀**
