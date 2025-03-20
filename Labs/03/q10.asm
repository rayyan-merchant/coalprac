INCLUDE Irvine32.inc
.data 
bArray BYTE 20 DUP (?)
.code 
main PROC

; showing the process without loop till 2nd index

mov al,0
mov bArray,al
movzx eax,bArray[0]
call WriteInt
call Crlf

mov al,1
mov [bArray+1],al
movzx eax,bArray[1]
call WriteInt
call Crlf

; implementing loop from 2nd index till 20th

mov ecx,18 ; 20 - 2 = 18, as 2 are already initialized
mov al,3
mov esi,2

L1:
mov bArray[esi],al
movzx eax,bArray[esi]
call WriteInt

call Crlf
inc esi
inc al
loop L1

exit
main ENDP
end main
