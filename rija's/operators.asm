#assignment op:
INCLUDE Irvine32.inc
.data
	SecondsInDay = 24*60*60
.code
main PROC
	mov eax,SecondsInDay
	call WriteInt
	call crlf
call DumpRegs
exit
main ENDP
END main
