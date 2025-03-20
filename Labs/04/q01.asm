INCLUDE Irvine32.inc
.data 
.code 
main PROC
mov eax,0
mov al, 'R'
shl eax, 8 ; shifting eax left by 8 bits to make space for new character
mov al, 'I'
shl eax, 8
mov al, 'Y'
call WriteHex
call Crlf
exit
main ENDP
end main
