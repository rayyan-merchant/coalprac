INCLUDE Irvine32.inc
.data
star BYTE "*",0
space BYTE " ",0
.code 
main PROC
mov ecx, 5
mov esi, 1
L1:
mov eax,5
sub eax,esi
mov ebx,0

L2:
cmp ebx,eax
jge printstars
mov edx, OFFSET space
call WriteString
inc ebx
jmp L2

printstars:
mov eax,esi
shl eax,1
dec eax
mov ebx,0

L3:
cmp ebx,eax
jge newline
mov edx, OFFSET star
call WriteString
inc ebx
jmp L3

newline:
call Crlf

inc esi
cmp esi, 6
jl L1
    
exit
main ENDP
end main
