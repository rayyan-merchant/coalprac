INCLUDE irvine32.inc
.data
	arrayB BYTE 10,20,30 
	arrayW WORD 150,250,350
	arrayD DWORD 600,1200,1800
	sum1 DWORD ?
	sum2 DWORD ?
	sum3 DWORD ?
.code
main PROC
	movzx eax, arrayB[0]
	movzx ebx, arrayW[0]
	mov ecx, arrayD[0]
	add eax,ebx
	add eax,ecx
	mov sum1,eax
	call writeint
	call crlf

	movzx eax, arrayB[1]
	movzx ebx, arrayW[2]
	mov ecx, arrayD[4]
	add eax,ebx
	add eax,ecx
	mov sum2,eax
	call writeint
	call crlf

	movzx eax, arrayB[2]
	movzx ebx, arrayW[4]
	mov ecx, arrayD[8]
	add eax,ebx
	add eax,ecx
	mov sum3,eax
	call writeint
	call crlf

	call dumpregs
	exit

main endp
end main
	
