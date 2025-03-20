INCLUDE Irvine32.inc
.data 
favcolour BYTE "BLUE",0 
A WORD 12
B WORD 2
C1 WORD 13
D WORD 8
E WORD 14

.code 

main PROC

mov edx, OFFSET favcolour
call WriteString
call Crlf

movzx eax,A
call WriteDec
call Crlf

movzx eax,B
call WriteDec
call Crlf

movzx eax,C1
call WriteDec
call Crlf

movzx eax,D
call WriteDec
call Crlf

movzx eax,E
call WriteDec
call Crlf

exit
main ENDP
end main
