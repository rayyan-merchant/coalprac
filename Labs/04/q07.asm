INCLUDE Irvine32.inc
.data 
A WORD 0FF10h
B WORD 0E10Bh
.code 
main PROC
mov ax, A
xchg ax, B

mov A,ax

movzx eax,A
call WriteHex
call Crlf

movzx eax,B
call WriteHex
call Crlf
exit
main ENDP
end main
