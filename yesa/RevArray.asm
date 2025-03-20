INCLUDE Irvine32.inc
.data

source byte 12h,34h,56h,78h

.code
main PROC

mov ecx, lengthof source
mov esi, offset source
mov eax, 0
L3:
	mov al, byte ptr [esi]
	call writehex
	call crlf
	inc esi
	
loop L3

call crlf

mov ecx, lengthof source / 2
mov eax, offset source
mov ebx, offset source
add ebx, lengthof source
dec ebx
; inc eax dec ebx
L1: 
	;swap [eax], [ebx]
	mov dh, [eax]
	mov dl, [ebx]
	mov [eax], dl
	mov [ebx], dh
	inc eax
	dec ebx
loop L1


mov ecx, lengthof source
mov esi, offset source
mov eax, 0
L2:
	mov al, byte ptr [esi]
	call writehex
	call crlf
	inc esi
	
loop L2




exit
main ENDP
END main