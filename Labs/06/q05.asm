INCLUDE Irvine32.inc
.data
arr BYTE 1,2,3,4,5
.code
main PROC
mov ecx,(LENGTHOF arr)/2 mov esi,0
mov edi,4
L1:
mov al,arr[esi]
mov bl,arr[edi]
mov arr[esi],bl
mov arr[edi],al
inc esi
dec edi
loop L1
mov ecx,LENGTHOF arr mov eax,0
mov esi,offset arr L2:
mov al,[esi] call WriteInt inc esi
loop L2 exit
main ENDP END main
