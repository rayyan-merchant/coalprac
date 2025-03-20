INCLUDE Irvine32.inc
.data 
varB BYTE +10
varW WORD -150
varD DWORD 600
.code 
main PROC
movzx eax,varB
call WriteInt
call Crlf
movsx eax, varW
call WriteInt
call Crlf
mov eax, varD
call WriteInt
call Crlf
exit
main ENDP
end main
