INCLUDE Irvine32.inc
.data 
star BYTE "*",0
.code 
; ****
; ****
; ****
; ****
main PROC
mov ecx,4
outer :
mov ax,4
inner:
mov edx, OFFSET star
call WriteString

dec ax
jnz inner

call Crlf

loop outer

exit
main ENDP
end main
