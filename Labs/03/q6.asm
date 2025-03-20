INCLUDE Irvine32.inc
.data 
a BYTE 00010001b  ; a = 11h in binary
b BYTE 00010000b  ; b = 10h in binary
c1 BYTE 00110000b ; c1 = 30h in binary
d BYTE 01000000b  ; d = 40h in binary
msg1 BYTE "answer in binary",0
msg2 BYTE "answer in hexadecimal",0
.code 
main PROC
mov al, a
add al, b
mov bl,a
sub bl,b
sub al,bl
add al,c1
add al,d
movzx eax,al
mov edx, OFFSET msg1
call WriteString
call Crlf
call WriteBin
call Crlf
call Crlf
mov edx, OFFSET msg2
call WriteString
call Crlf
call WriteHex
call Crlf ; used for new line

exit
main ENDP
end main
