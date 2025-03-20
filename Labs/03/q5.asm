INCLUDE Irvine32.inc
.data 
a BYTE 11h
b BYTE 10h
c1 BYTE 30h 
d BYTE 40h
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
call WriteHex

exit
main ENDP
end main
