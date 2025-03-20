INCLUDE Irvine32.inc
.data 
val3 SDWORD -9999
.code 
main PROC
mov eax,val3
call WriteInt
call Crlf

exit
main ENDP
end main
