include irvine32.inc

.data
    array dword 8, 5, 1, 2, 6  ; define a dword (32-bit) array
    len   equ 5                ; number of elements

.code
main proc
    mov ecx, lengthof array    ; outer loop counter
    dec ecx

outer_loop:
    mov edx, lengthof array - 1           ; inner loop counter (for j = 0; j < len - i - 1; j++)
    mov esi, 0                 ; esi = index (j = 0)

inner_loop:
    ; load array[j] and array[j+1]
    mov eax, array[esi*4]      
    mov ebx, array[esi*4 + 4]  
    cmp eax, ebx               
    jle no_swap                

    ; swap array[j] and array[j+1]
    mov array[esi*4], ebx      
    mov array[esi*4 + 4], eax  

no_swap:
    inc esi                    ; move to next index (j++)
    dec edx                    ; decrease inner loop counter
    jnz inner_loop              ; repeat if dx > 0

    loop outer_loop             ; repeat outer loop if cx > 0

    ; print sorted array
    mov ecx, lengthof array
    mov esi, offset array

l1:
    mov eax, [esi]
    call writedec
    add esi, type array
    
    loop l1

    exit                        ; exit using irvine32 macro

main endp
end main  
