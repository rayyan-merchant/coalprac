INCLUDE Irvine32.inc
.data 
new BYTE 500 DUP ("TEST",0)
.code 
main PROC
mov edx, OFFSET new
call WriteString
call Crlf
mov edx, OFFSET [new+5]
call WriteString
call Crlf
exit
main ENDP
end main
