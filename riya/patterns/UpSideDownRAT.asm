INCLUDE Irvine32.inc
.data 
star BYTE "*",0
.code 
; ****
; ***
; **
; *
main PROC
mov ecx,4

outer :
mov ebx, ecx
mov edx, OFFSET star

inner:
call WriteString
dec ebx
jnz inner

call Crlf

loop outer

exit
main ENDP
end main
