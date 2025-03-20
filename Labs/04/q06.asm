INCLUDE Irvine32.inc
SecondsInDay EQU 24*60*60
.data 
m1 DWORD SecondsInDay
.code 
main PROC
mov eax, m1
call WriteInt
call Crlf
exit
main ENDP
end main
