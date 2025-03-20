INCLUDE Irvine32.inc
.data 
val WORD 1000,2000,3000
.code 
main PROC
movzx eax,val
call WriteInt
call Crlf
movzx eax,[val+2]
call WriteInt
call Crlf
movzx eax,[val+4]
call WriteInt
call Crlf
exit
main ENDP
end main
