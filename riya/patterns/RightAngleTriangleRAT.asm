INCLUDE Irvine32.inc
.data 
star BYTE "*",0
.code 
; *
; **
; ***
; ****
main PROC

mov ecx,1

outer :

mov ebx,ecx
mov edx, OFFSET star

inner:
call WriteString

dec ebx
jnz inner

call Crlf

inc ecx
cmp ecx,5
jne outer

exit
main ENDP
end main
