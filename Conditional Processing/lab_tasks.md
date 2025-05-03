

```markdown
# Lab 08: Conditional Processing Solutions

## Task 1: Compare Four Integers
```assembly
include irvine32.inc
.data
    nums DWORD 4 DUP(?)
    prompt BYTE "Enter a number: ", 0
    msg1 BYTE "Nums are equal", 0
    msg2 BYTE "Nums aren't equal", 0

.code
main PROC
    mov ecx, 0
    mov ebx, 4
    mov edx, offset prompt
    mov esi, offset nums

input_loop:
    call writestring
    call readint
    mov [esi], eax
    add esi, 4
    inc ecx
    cmp ecx, ebx
    jl input_loop

    mov esi, offset nums
    mov eax, [esi]     
    mov ecx, 3      
    add esi, 4    
compare_loop:
    cmp eax, [esi]
    jne not_equal
    add esi, 4
    loop compare_loop

    mov edx, offset msg1
    call writestring
    jmp end_code

not_equal:
    mov edx, offset msg2
    call writestring

end_code:
    exit
main ENDP
END main
```

---

## Task 2: Find First Non-Zero Value in Array
```assembly
include irvine32.inc
.data
    intArr SWORD 0,0,0,150,120,35,-12,66,4,0
    msg1 BYTE "Non Zero Value found:  ", 0
    msg2 BYTE "No non zero values in array.", 0

.code
main PROC
    mov esi, offset intArr
    mov ecx, lengthof intArr
    
check_nums:
    mov ax, [esi]
    cmp ax, 0
    jg found
    add esi, 2
    loop check_nums
    jmp end_code

found:
    mov edx, offset msg1
    movsx eax, ax
    call writestring
    call writeint
    
end_code:
    exit
main endp
end main
```

---

## Task 3: Implement Compound AND Condition
```assembly
include irvine32.inc
.data
    var DWORD 5
    x DWORD ?

.code
main PROC
    mov edx, var
    inc edx
    mov ecx, 10 ; lengthof array from task 2 used
    
    cmp var, ecx
    jge else_block
    
    cmp ecx, edx
    jl else_block
    
    mov x, 0
    jmp end_code
    
else_block:
    mov x, 1
    
end_code:
    mov eax, x
    call writedec
main endp
end main
```

---

## Task 4: While Loop with Conditional Printing
```assembly
include irvine32.inc
.data
    var DWORD 0
    msg1 BYTE "Hello", 0
    msg2 BYTE "World", 0

.code
main PROC
while_loop:
    mov eax, var
    cmp eax, 5
    jge else_block
        
    mov edx, offset msg1
    call writestring
    inc eax
    mov var, eax
    cmp eax, 10
    jle while_loop
        
else_block:
    mov edx, offset msg2
    call writestring
    inc eax
    mov var, eax
    cmp eax, 10
    jle while_loop
    
end_code:
main endp
end main
```

---

## Task 5: Sequential Search in Array
```assembly
include irvine32.inc
.data
    arr WORD 10, 4, 7, 14, 299, 156, 3, 19, 29, 300, 20
    num WORD ?
    prompt BYTE "Enter a number: ", 0
    msg1 BYTE "Found.", 0
    msg2 BYTE "Not Found", 0

.code
main PROC
    mov edx, offset prompt
    call writestring
    call readint
    mov ecx, lengthof arr
    mov esi, offset arr
    
search_loop:
    movzx ebx, word ptr [esi] 
    cmp ax, bx
    je found
    add esi, 2
    loop search_loop
    
    mov edx, offset msg2
    call writestring
    jmp end_code
    
found:
    mov edx, offset msg1
    call writestring
    
end_code:
    exit
main endp
end main
```

---

## Task 6: Bubble Sort Implementation
```assembly
include irvine32.inc
.data
    arr WORD 10, 4, 7, 14, 299, 156, 3, 19, 29, 300, 20
    prompt BYTE "Sorted array: ", 0
    curr_num WORD 0
    outer_count WORD 0

.code
main PROC
    mov esi, offset arr
    mov ecx, lengthof arr - 1
    
outer_loop:
    mov ax, [esi]
    mov curr_num, esi
    dec ecx
    mov outer_count, ecx
    add esi, 2
        
inner_loop:
    cmp ax, [esi]
    jl swap
    add esi, 2
    loop inner_loop
            
swap:
    mov dx, [esi]
    mov [esi], ax
    mov [esi-2], dx
    loop inner_loop
        
    mov esi, curr_num
    mov ecx, outer_count
    loop outer_loop
    
    mov esi, offset arr
    mov ecx, lengthof arr
    mov edx, offset prompt
    call writestring
    
print_loop:
    mov eax, [esi]
    add esi, 2
    call writedec
    loop print_loop
    
end_code:
    exit
main endp
end main
```

---

## Task 7: Print Weekday Based on Number
```assembly
include irvine32.inc
.data
    prompt BYTE "Enter a number (1-7): ", 0
    invalid BYTE "Invalid number! Enter between 1 and 7.", 0
    weekdays BYTE "Monday",0,"Tuesday",0,"Wednesday",0,"Thursday",0,"Friday",0,"Saturday",0,"Sunday",0

.code
main PROC
    mov edx, offset prompt
    call writestring
    call readint              

    cmp eax, 1
    jl invalid_input     
    cmp eax, 7
    jg invalid_input      

    dec eax                 
    mov ecx, eax          

    mov esi, offset weekdays

find_weekday:
    cmp ecx, 0
    je print_weekday
    
next_string:
    mov al, [esi]
    inc esi
    cmp al, 0
    jne next_string
    dec ecx
    jmp find_weekday

print_weekday:
    mov edx, esi
    call writestring
    jmp end_program

invalid_input:
    mov edx, offset invalid
    call writestring

end_program:
    exit
main ENDP
END main
```

---

## Task 8: Check Alphabet Character
```assembly
include irvine32.inc
.data
    prompt BYTE "Enter a character: ", 0
    msg1 BYTE "It is a character.", 0
    msg2 BYTE "It is not a character.", 0

.code
main PROC
    mov edx, offset prompt
    call writestring
    call readchar
    call writechar
    call crlf
    
    cmp al, 65
    jl not_an_alphabet
    
    cmp al, 95
    jle is_an_alphabet
    
    cmp al, 97
    jl not_an_alphabet
    
    cmp al, 122
    jg not_an_alphabet
    
is_an_alphabet:
    mov edx, offset msg1
    call writestring
    jmp end_code

not_an_alphabet:
    mov edx, offset msg2
    call writestring
    
end_code:
    exit
main endp
end main
```

This markdown document organizes all solutions with clear headings and syntax highlighting for each assembly program. Let me know if you need any modifications!
