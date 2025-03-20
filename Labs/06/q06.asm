INCLUDE Irvine32.inc
.data
arr DWORD 8,5,1,2,6 count DWORD ?
.code
main PROC
mov ecx,LENGTHOF arr L1:
mov count,ecx
mov ecx,LENGTHOF arr dec ecx
mov esi,0
L2:
mov eax,arr[esi]mov edi,esi
add edi,TYPE arr mov ebx,arr[edi]
CMP eax,ebx
JG SWAPPING
L3:
add esi,TYPE arr
Loop L2
mov ecx,count
Loop L1
JMP DISPLAY SWAPPING:
mov arr[edi],eax
mov arr[esi],ebx
JMP L3
DISPLAY:
mov ecx,LENGTHOF arr mov esi,0
L4:
mov eax,arr[esi] call WriteInt
mov al,' '
call writechar add esi,TYPE arr Loop L4
exit
main ENDP END main
