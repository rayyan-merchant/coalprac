INCLUDE Irvine32.inc
.data 
wArray WORD 10h,20h,30h
.code 
main PROC
movzx eax,wArray
call WriteHex
call Crlf
movzx eax, [wArray+2]
call WriteHex
call Crlf
movzx eax, [wArray+4]
call WriteHex
call Crlf

exit
main ENDP
end main
