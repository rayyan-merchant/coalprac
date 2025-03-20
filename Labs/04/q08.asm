INCLUDE Irvine32.inc
.data 
val1 BYTE 10h
val2 WORD 8000h
val3 DWORD 0FFFFh
val4 WORD 7FFFh
.code 
main PROC
inc val2
movzx eax,val2
call WriteHex
call Crlf

mov eax, 12345678h
sub eax, val3
mov eax,val3
call WriteHex
call Crlf

mov ax,val2
sub ax,val4
mov val2,ax
movzx eax,val2
call WriteHex
call Crlf

call Crlf
exit
main ENDP
end main
