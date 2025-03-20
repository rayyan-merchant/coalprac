INCLUDE Irvine32.inc
.data
employees DWORD 5
Ids DWORD 5 DUP(?)
names BYTE 5 DUP(20 Dup(?))
birthyear DWORD 5 DUP(?)
annualSalary DWORD 5 DUP(?)
msg1 db 'Enter Employee Id ',0
msg2 db 'Enter Employee Name ',0
msg3 db 'Enter Employee date of birth ',0
msg4 db 'Enter Employee Annual Salary ',0
msg5 db 'Annual salary for all employees ',0
.code
main PROC
mov ecx,employees
mov esi,0
mov edi,0
L1:
mov edx,offset msg1
call WriteString
call ReadDec
mov Ids[esi],eax
mov edx,offset msg2
call WriteString
mov ebx,ecx
mov edx,offset names 
add edx,edi
mov ecx,20
call ReadString
mov ecx,ebx
add edi,20
mov edx,offset msg3
Call WriteString
call ReadDec
mov birthyear[esi],eax
mov edx,offset msg4
Call WriteString
call ReadDec
mov annualSalary[esi],eax
add esi,4 
call crlf
loop L1
mov ecx,employees
mov esi,offset annualSalary 
mov eax,0
L2:
add eax,[esi]
add esi,TYPE annualSalary 
loop L2
mov edx,OFFSET msg5 
Call WriteString
call WriteInt 
exit
main ENDP 
END main
