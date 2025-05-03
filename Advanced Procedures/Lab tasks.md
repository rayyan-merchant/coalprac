### Solution 1: 1. Write a program which contains a procedure named ThreeProd that displays the product of three numeric parameters passed through a stack. 
```assembly
INCLUDE Irvine32.inc

.data
    num1 DWORD 3
    num2 DWORD 5
    num3 DWORD 2

.code
main PROC
    push num3
    push num2
    push num1
    call ThreeProd
    exit
main ENDP

ThreeProd PROC
    enter 0, 0
    mov eax, [ebp+16]   ; num1
    imul eax, [ebp+12]  ; num2
    imul eax, [ebp+8]   ; num3
    call WriteInt
    leave
    ret 12
ThreeProd ENDP
END main
```

---

### Solution 2: 2. Write a program which contains a procedure named MinMaxArray that displays the minimum & maximum values in an array. Pass a size-20 array by reference to this procedure
```assembly
INCLUDE Irvine32.inc

.data
    arr DWORD 20 DUP(?) ; Initialize array with 20 elements

.code
main PROC
    push OFFSET arr
    push 20
    call MinMaxArray
    exit
main ENDP

MinMaxArray PROC
    enter 0, 0
    mov esi, [ebp+12]   ; Array address
    mov ecx, [ebp+8]    ; Array size
    mov eax, [esi]      ; Initialize min (eax)
    mov ebx, [esi]      ; Initialize max (ebx)

    L1:
        cmp [esi], eax
        jge not_min
        mov eax, [esi]
    not_min:
        cmp [esi], ebx
        jle not_max
        mov ebx, [esi]
    not_max:
        add esi, 4
        loop L1

    ; Display results
    mov edx, OFFSET str_min
    call WriteString
    call WriteInt
    call Crlf
    mov edx, OFFSET str_max
    call WriteString
    mov eax, ebx
    call WriteInt
    leave
    ret 8
MinMaxArray ENDP

.data
    str_min BYTE "Minimum: ",0
    str_max BYTE "Maximum: ",0
END main
```

---

### Solution 3: 3. Write a program which contains a procedure named LocalSquare . The procedure must declare a local variable. Initialize this variable by taking an input value from the user and then display its square. Use ENTER & LEAVE instructions to allocate and de-allocate the local variable.
```assembly
INCLUDE Irvine32.inc

.code
main PROC
    call LocalSquare
    exit
main ENDP

LocalSquare PROC
    enter 4, 0          ; Allocate 4 bytes for local variable
    call ReadInt        ; Input value
    mov [ebp-4], eax    ; Store in local variable
    imul eax, eax       ; Square
    call WriteInt       ; Display result
    leave
    ret
LocalSquare ENDP
END main
```

---

### Solution 4: 3. Write a program which contains a procedure named LocalSquare . The procedure must declare a local variable. Initialize this variable by taking an input value from the user and then display its square. Use ENTER & LEAVE instructions to allocate and de-allocate the local variable. 
```assembly
INCLUDE Irvine32.inc

.data
    nums DWORD 4 DUP(?)
    allPrime BYTE 1
    prompt BYTE "Enter a number: ",0
    notPrimeMsg BYTE "Not all primes!",0
    largestMsg BYTE "Largest prime: ",0

.code
main PROC
    ; Input 4 numbers
    mov esi, OFFSET nums
    mov ecx, 4
    input_loop:
        mov edx, OFFSET prompt
        call WriteString
        call ReadInt
        mov [esi], eax
        add esi, 4
        loop input_loop

    ; Check primes
    mov esi, OFFSET nums
    mov ecx, 4
    check_loop:
        push [esi]
        call CheckPrime
        cmp eax, 0
        je not_all_prime
        add esi, 4
        loop check_loop

    ; All primes: find largest
    call LargestPrime
    jmp exit_program

    not_all_prime:
        mov edx, OFFSET notPrimeMsg
        call WriteString

    exit_program:
        exit
main ENDP

CheckPrime PROC
    enter 0, 0
    mov eax, [ebp+8]
    cmp eax, 2
    jl not_prime
    je is_prime

    test eax, 1
    jz not_prime

    mov ecx, 3
    sqrt_loop:
        mov edx, ecx
        imul edx, edx
        cmp edx, eax
        jg is_prime
        mov edx, 0
        div ecx
        test edx, edx
        jz not_prime
        add ecx, 2
        jmp sqrt_loop

    is_prime:
        mov eax, 1
        jmp end_check
    not_prime:
        mov allPrime, 0
        mov eax, 0
    end_check:
        leave
        ret 4
CheckPrime ENDP

LargestPrime PROC
    mov eax, [nums]
    mov ebx, [nums+4]
    cmp eax, ebx
    jg L1
    mov eax, ebx
L1:
    mov ebx, [nums+8]
    cmp eax, ebx
    jg L2
    mov eax, ebx
L2:
    mov ebx, [nums+12]
    cmp eax, ebx
    jg L3
    mov eax, ebx
L3:
    mov edx, OFFSET largestMsg
    call WriteString
    call WriteInt
    ret
LargestPrime ENDP
END main
```

---

### Solution 5:  Write a program which contains a procedure named BubbleSort that sorts an array which is passed through a stack using indirect addressing. 
```assembly
INCLUDE Irvine32.inc

.data
    arr WORD 10,4,7,14,299,156,3,19,29,300,20
    len = ($ - arr) / TYPE WORD

.code
main PROC
    push OFFSET arr
    push len
    call BubbleSort
    exit
main ENDP

BubbleSort PROC
    enter 0, 0
    mov esi, [ebp+12]   ; Array address
    mov ecx, [ebp+8]    ; Array length
    dec ecx             ; Outer loop counter (n-1)

    outer_loop:
        push ecx
        mov edi, esi    ; Inner loop pointer
        inner_loop:
            mov ax, [edi]
            cmp ax, [edi+2]
            jle no_swap
            xchg ax, [edi+2]
            mov [edi], ax
        no_swap:
            add edi, 2
            loop inner_loop
        pop ecx
        loop outer_loop

    ; Display sorted array
    mov esi, [ebp+12]
    mov ecx, [ebp+8]
    print_loop:
        movzx eax, WORD PTR [esi]
        call WriteDec
        mov al, ' '
        call WriteChar
        add esi, 2
        loop print_loop

    leave
    ret 8
BubbleSort ENDP
END main
```

---

**Key Features:**  
1. **Stack Parameter Handling**: Parameters accessed via `[ebp+8]`, `[ebp+12]`  
2. **Local Variables**: Managed via `enter`/`leave`  
3. **Prime Check Optimization**: Skips even numbers and checks up to √n  
4. **Bubble Sort**: Uses nested loops and indirect addressing  
5. **Error Handling**: Flags non-prime inputs early  

Test each program with sample inputs to verify correctness.
