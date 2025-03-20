Here are **MASM Assembly programs** using **Irvine32** for **Bubble Sort, Selection Sort, and Insertion Sort** on an array of integers. 🚀  

---

## **1️⃣ Bubble Sort (Ascending Order)**
```assembly
INCLUDE Irvine32.inc

.data
    arr DWORD 5, 3, 8, 1, 9
    size = ($ - arr) / 4

.code
main PROC
    mov ecx, size            ; Outer loop counter

outer_loop:
    dec ecx                  ; Decrement outer loop counter
    cmp ecx, 0
    je done_sorting

    mov esi, 0               ; Index for inner loop

inner_loop:
    mov eax, arr[esi]        ; Load current element
    mov ebx, arr[esi+4]      ; Load next element

    cmp eax, ebx             ; Compare elements
    jle skip_swap            ; If in order, skip swap

    mov arr[esi], ebx        ; Swap
    mov arr[esi+4], eax      

skip_swap:
    add esi, 4               ; Move to next element
    cmp esi, (size-1) * 4    ; End of array?
    jl inner_loop

    jmp outer_loop           ; Repeat outer loop

done_sorting:
    call DumpMem             ; Display sorted array
    exit

main ENDP
END main
```
✅ **Logic:**  
- Repeatedly swaps adjacent elements if they are in the wrong order.  

---

## **2️⃣ Selection Sort**
```assembly
INCLUDE Irvine32.inc

.data
    arr DWORD 5, 3, 8, 1, 9
    size = ($ - arr) / 4

.code
main PROC
    mov ecx, size            ; Outer loop counter
    dec ecx

outer_loop:
    mov esi, ecx             ; Store index of current element
    mov edi, esi

inner_loop:
    dec edi
    cmp edi, 0
    jl swap_min

    mov eax, arr[edi*4]      ; Load current min
    cmp arr[esi*4], eax      ; Compare with next element
    jle inner_loop           ; If smaller, update min

    mov esi, edi             ; Update min index
    jmp inner_loop

swap_min:
    mov eax, arr[ecx*4]
    mov ebx, arr[esi*4]
    mov arr[ecx*4], ebx
    mov arr[esi*4], eax

    loop outer_loop

    call DumpMem
    exit

main ENDP
END main
```
✅ **Logic:**  
- Finds the minimum element and places it in its correct position.  

---

## **3️⃣ Insertion Sort**
```assembly
INCLUDE Irvine32.inc

.data
    arr DWORD 5, 3, 8, 1, 9
    size = ($ - arr) / 4

.code
main PROC
    mov ecx, 1               ; Start from 2nd element

outer_loop:
    cmp ecx, size
    jge done_sorting

    mov eax, arr[ecx*4]      ; Current element
    mov esi, ecx
    dec esi

inner_loop:
    cmp esi, 0
    jl insert

    cmp arr[esi*4], eax
    jle insert

    mov ebx, arr[esi*4]
    mov arr[(esi+1)*4], ebx  ; Shift element
    dec esi
    jmp inner_loop

insert:
    mov arr[(esi+1)*4], eax

    inc ecx
    jmp outer_loop

done_sorting:
    call DumpMem
    exit

main ENDP
END main
```
✅ **Logic:**  
- Picks elements one by one and places them in their correct position in the sorted part of the array.  

---

### 🎯 **Which one do you need more explanations for?** 🚀
