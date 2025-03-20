INCLUDE Irvine32.inc
.data 
val1 DWORD 25h
val2 BYTE 36o
val3 WORD 20d

.code 
main PROC

; 1. EAX = 89 + 75Fh - 46o - 28 +1101b
mov eax,89
add eax, 75Fh
sub eax, 46o
sub eax, 28
add eax, 1101b
call WriteInt
call Crlf

;2. EAX = Val1 + Val2 - 654h + Val3
mov eax, val1
movzx ebx,val2
add eax, ebx
sub eax, 654h
movzx ebx, val3
add eax,ebx
call WriteInt
call Crlf
exit
main ENDP
end main
