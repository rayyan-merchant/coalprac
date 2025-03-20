INCLUDE Irvine32.inc
.data 
val1 SWORD 1234
val2 SBYTE -11
.code 
main PROC
movsx eax,val1
call WriteInt
call Crlf
movsx eax,val2
call WriteInt
exit
main ENDP
end main
