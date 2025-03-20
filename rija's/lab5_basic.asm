; OFFSET operator returns the offset,memory address of a data label
; PTR operator to override the declared size of an operand
; TYPE returns the size, in bytes of a single element of variable
; LENGTHOF countts the no. of individual elements in a variable that has beeen defined using dup
; SIZEOF returns the no. of bytes an array takes up
; Indexed Operands:An indexed operand adds a constant to a register to generate an effective address.

INCLUDE irvine32.inc
.data
		arrayB BYTE 61,43,11,52,25
		array BYTE 5 DUP(?)
.code
main PROC
	mov array[0],11
	mov array[1],25
	mov array[2],43
	mov array[3],52
	mov array[4],61

	movzx eax,array[0]
	call writedec
	call crlf

	movzx eax,array[1]
	call writedec
	call crlf

	movzx eax,array[2]
	call writedec
	call crlf

	movzx eax,array[3]
	call writedec
	call crlf
	movzx eax,array[4]
	call writedec
	call crlf
	call dumpregs
	exit
main endp
end main

;lab5 q5:
INCLUDE irvine32.inc
.data
	array1 BYTE 10,20,30,40
	array2 BYTE 4 DUP(?)
.code
main PROC
	mov esi,OFFSET array1
	mov edi,OFFSET array2 + 3
	
	mov al , [esi] ;to getvalue put []
	mov [edi],al
	dec edi
	inc esi

	mov al,[esi]
	mov [edi],al
	dec edi
	inc esi

	mov al,[esi]
	mov [edi],al
	dec edi
	inc esi

	mov al,[esi]
	mov [edi],al

	mov esi,OFFSET array2
	mov ecx,4
print_loop:
	mov al,[esi]
	call writedec
	inc esi
	loop print_loop

	call crlf
	call dumpregs
	exit

main endp
end main

;l5 q6
INCLUDE irvine32.inc
.data
	array DWORD 10,20,40,60,80
.code
main PROC
	mov esi,OFFSET array
	mov eax,[esi]
	
	add esi,4
	sub eax,[esi]

	add esi,4
	sub eax,[esi]

	add esi,4
	sub eax,[esi]

	add esi,4
	sub eax,[esi]

	call writedec
	call dumpregs
	exit

main endp
end main

;l5 q7
INCLUDE Irvine32.inc

.data
    arrayB BYTE 60, 70, 80        ; BYTE array
    arrayW WORD 150, 250, 350     ; WORD array
    arrayD DWORD 600, 1200, 1800  ; DWORD array

.code
main PROC
    ; Add first and last element of BYTE array (arrayB)
    mov esi, OFFSET arrayB      ; ESI points to the start of arrayB
    movzx eax, byte ptr [esi]   ; Load first element (arrayB[0]) into EAX
    movzx ebx, byte ptr [esi + 2 * TYPE arrayB] ; Load last element (arrayB[2]) into EBX (using TYPE to calculate offset)
    add eax, ebx                ; Add first and last element of arrayB
    call WriteDec               ; Display the result
    call CrLf                   ; New line

    ; Add first and last element of WORD array (arrayW)
    mov esi, OFFSET arrayW      ; ESI points to the start of arrayW
    movzx eax, word ptr [esi]   ; Load first element (arrayW[0]) into EAX
    movzx ebx, word ptr [esi + 2 * TYPE arrayW] ; Load last element (arrayW[2]) into EBX (using TYPE to calculate offset)
    add eax, ebx                ; Add first and last element of arrayW
    call WriteDec               ; Display the result
    call CrLf                   ; New line

    ; Add first and last element of DWORD array (arrayD)
    mov esi, OFFSET arrayD      
    mov eax, [esi]              
    mov ebx, [esi + 2 * TYPE arrayD] 
    add eax, ebx                
    call WriteDec               
    call CrLf                  

    call DumpRegs               ; Dump the registers for inspection
    exit
main ENDP

END main
