INCLUDE Irvine32.inc
.data
	A WORD 0FF10h
	B WORD 0E10Bh
.code
main PROC
	mov AX , A ;0ff10h
	call writeHex
	call crlf
	mov AX , B ;0e10bh
	call WriteHex
	call crlf
	call DumpRegs
	call crlf
	
	; swap a and b
	mov ax,a
	mov bx,b
	xchg ax,bx
	mov A , ax
	mov B , bx
	;print
	mov ax,a
	call writehex
	call crlf
	mov ax,b
	call writehex
	call crlf
	call dumpregs

exit
main ENDP
END main
