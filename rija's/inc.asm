INCLUDE Irvine32.inc
.data
	val1 BYTE 10h
	val2 WORD 8000h
	val3 DWORD 0FFFFh
	val4 WORD 7FFFh
.code
main PROC
	;i increment val2
	mov AX,val2
	call writehex
	call crlf
	inc AX
	call writehex
	call crlf
	call dumpregs
	
	;ii sub val3 from eax
	mov eax,val3
	sub eax,val3
	call writehex
	call crlf

	;iii sub val4 from val2
	mov ax,val2
	sub ax,val4
	call writehex
	call crlf


call dumpregs
exit
main ENDP
END main
