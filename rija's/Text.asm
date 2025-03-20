include irvine32.inc
COMMENT !
;//ADD ODD INDEXES OF ARRAYB WITH EVEN INDEXES OF ARRAYW
.data
	elemW word 50, 20, 90, 101, 450
	elemB byte 10, 24, 67, 90, 100
	elemSave dword 2 dup (?)
.code
	main proc
			mov esi, 0
			mov eax, 0
			mov ebx, 0
			mov ecx, lengthof elemW
			mov edi, 0
			i:
				;elemW[esi] + elemB[esi + 1]
				;esi += 2
				
				cmp esi, 4
				je Outer
				
				movzx eax, elemW[(esi * type elemW)]
				movzx ebx, elemB[(esi * type elemB) + type elemB]
				add eax, ebx
				mov elemSave[edi * type elemSave], eax
				inc edi
				add esi, 2
				call writeint

			loop i

			Outer:


		exit
	main endp
!
COMMENT !
.data
;//PAST PAPER, MUL ADDARRAY
	array1 byte 11, 22, 33
	array2 word 111, 222, 333
	array3 byte 0Eh, 1Fh, 22h
	result dword 3 dup (?)

.code
	main proc
			call AddArray
			call MulArray

		exit
	main endp

	Addarray proc
		mov ecx, 3
		mov esi, 0
		
		i:
			inc [esi + array1]
			inc [(esi * 2) + array2]
			inc [esi + array3]
			
			inc esi
		
		loop i
		
		mov esi, 0
		mov ecx, 3
	
		k:
			movzx eax, [esi + array1]
			movzx ebx, [esi + array2]
			movzx edx, [(esi * 2) + array3]
			add eax, ebx
			add eax, edx
			mov [result + (esi * 4)], eax
			call dumpregs
			inc esi

		loop k
		ret

	Addarray endp
	
	MulArray proc

		mov ecx, 3
		mov esi, 0
		
		i:
			
			dec[esi + array1]
			dec[esi + array1]

			dec [(esi * 2) + array2]
			dec [(esi * 2) + array2]
			
			dec[esi + array3]
			dec[esi + array3]

			inc esi

		loop i
		
		mov esi, 0
		mov ecx, 3
	
		k:
			movzx eax, [esi + array1]
			movzx ebx, [esi + array2]
			movzx edx, [(esi * 2) + array3]
			add eax, ebx
			add eax, edx
			mov [result + (esi * 4)], eax
			call dumpregs
			inc esi

		loop k
		ret

	MulArray endp
!
COMMENT !
;//MID 1 COAL THEORY, SEQUENCE
.data
	first byte 1
	second byte 1
	third byte 1
.code
	main proc
			mov ecx, 8
			movzx eax, first
			call writeint
			call writeint
			call writeint
			i:
				movzx eax, first
				add al, second
				add al, third		;//sum = a + b + c

				movzx ebx, second	;// a = b
				mov first, bl 

				movzx ebx, third	;//b = c
				mov second, bl

				mov third, al		;//c = sum
				call writeint

			loop i
		exit
	main endp
!
COMMENT !
;//ARRAY SORTING, CHANGE AL/BL TO EAX/EBX, and MOVZX TO MOV, FOR DWORD
.data
	;elem byte 'H', 'A', 'C','E', 'B', 'D', 'F', 'G'
	elem dword 9, 5, 1, 2, 3, 4, 6, 8, 7
	sizeElem byte lengthof elem
.code
	main proc
		mov eax, 0
		mov ecx, lengthof elem
		mov ebx, 0
		mov esi, 0

		i:
			mov edi, ecx
			mov ecx, lengthof elem
			dec ecx
			j:
				mov eax, elem[esi * type elem]
				mov ebx, elem[(esi * type elem) + type elem]
				cmp eax, ebx
				jle k
				call swap
				k:

					inc esi
			loop j

			mov ecx, edi
			mov esi, 0

		loop i

		mov ecx, lengthof elem
		mov esi, 0
		call crlf

		displayCharacters:
			mov eax, elem[esi * type elem]
			call writeint
			inc esi
		loop displayCharacters

		exit
	main endp

	swap proc
			xchg eax, ebx
			mov elem[esi * type elem], eax
			mov elem[(esi * type elem) + type elem], ebx
		ret
	swap endp
!
COMMENT !
;/LAB 5,TASK 4, EMPLOYEE QUESTION
.data

		printt byte "Printing(Name, ID, Salary, YOB): ", 0
		resultt byte "Total aSal: ", 0
		entter byte "Enter in Order(Name, ID, Salary, YOB)", 0

		empN byte 5 dup(32 dup(0))
		empI dword 5 dup(0)
		empB dword 5 dup(0)
		empS dword 5 dup(0)
		aSal dword 0
		empCTR byte 0
		empT byte 5


.code
	main proc
		mov esi, 0
		mov edx, offset entter
		call writestring
		call crlf
		mov eax, 0
		mov edx, offset empN

		i:
			mov eax, 0
			mov al, empT
			cmp al, empCTR
			mov eax, 0
			je j

			mov ecx, 32
			call readstring
			call dumpregs

			mov eax, 0
			call readdec
			mov empI[esi * type empI], eax
			mov eax, 0
		
			call readdec
			mov empS[esi * type empS], eax
			mov eax, 0

			call readdec
			mov empB[esi * type empB], eax
			mov eax, 0

			add edx, 32
			inc esi
		
			dec empT
			jmp i

		j: ;gaze into the oblivion
	
		call crlf
		mov edx, offset printt
		call writestring
		call crlf
	
		mov esi, 0
		mov edx, offset empN
		mov eax, 0
		mov ecx, 5
		mov ebx, 0
		call crlf
		
		ii:
		
			call writestring
			call crlf

			mov eax, empI[esi * type empI]
			call writedec
			call crlf

			mov eax, empB[esi * type empB]
			call writedec
			call crlf

			mov eax, empS[esi * type empS]
			call writedec
			call crlf

			add ebx, empS[esi * type empS]
			inc esi
			add edx, 32

		loop ii
	
		call crlf
		mov edx, offset resultt
		call writestring
		mov eax, ebx
		call crlf
		call writedec
		call crlf

		exit
	main endp
!
COMMENT !
;//ARMSTRONG NUMBER
.data
	inputMessage byte "Enter a 4 byte Digit: ", 0
	displayMessage byte "Printing the Array: ", 0
	num dword ?
	broken dword 4 dup (0)
	temp dword 0
.code
	main proc
			mov edx, offset inputMessage
			call writestring

			call readint
			mov num, eax

			mov ecx, 10
			mov eax, num
			mov esi, 0
			
			i:
				cmp eax, 1000
				jl outer1
				sub eax, 1000
				inc broken[esi*4]

			loop i
			
			outer1:
			
			inc esi
			mov ecx, 10
			
			j:
				cmp eax, 100
				jl outer2
				sub eax, 100
				inc broken[esi*4]
			
			loop j
			outer2:

			inc esi
			mov ecx, 10

			k:
				cmp eax, 10
				jl outer3
				sub eax, 10
				inc broken[esi*4]

			loop k
			outer3:
			
			inc esi
			mov broken[esi*4], eax

			mov esi, 0
			call calculatePower
			inc esi
			call calculatePower
			inc esi
			call calculatePower
			inc esi
			call calculatePower
			call displayArray
			
		exit
	main endp
	
	calculatePower proc
			mov eax, broken[esi * 4]
			cmp eax, 1
			jle nope
			mov ecx, 3
			mov temp, eax
			dec temp
			L1:
				mov edx, ecx
				mov ecx, temp
				L2:	
					add eax, broken[esi * 4]
				loop L2
				mov ecx, edx
				mov broken[esi * 4], eax
			loop L1

			nope:
		ret
	calculatePower endp

	displayArray proc
			
			call crlf
			mov edx, offset displayMessage
			call writestring
			call crlf

			mov ecx, 4
			mov esi, 0
			tt:
				mov eax, broken[esi*4]
				call writeint
				inc esi
			loop tt
		ret
	displayArray endp
!
COMMENT !
;//ARROW PATTERN
.data
	star byte '*', 0
	space byte ' ', 0
	hash byte '#', 0
	dollar byte '$', 0
	temp dword 1
.code
	main proc
			mov dh, 1
			mov dl, 38
			call gotoxy
			mov ecx, 4
			i:
				mov ebx, ecx
				mov ecx, temp
				j:
					
					movzx eax, star
					call writechar
				
				loop j
				sub dl, 1
				add dh, 1
				call gotoxy
				mov ecx, ebx
				inc temp
				inc temp

			loop i
			mov eax, temp
			sub eax, 4
			mov temp, eax
			add dl, 2
			call gotoxy

			mov ecx, 3

			ii:
				mov ebx, ecx
				mov ecx, temp
				jj:
					
					movzx eax, star
					call writechar
				
				loop jj
				sub dl, 1
				add dh, 1
				call gotoxy
				mov ecx, ebx
				inc temp
				inc temp
			loop ii

			add dl, 4
			call gotoxy
			mov ecx, 4
			iii:
				mov ebx, ecx
				mov ecx, 3
				jjj:
					movzx eax, hash
					call writechar
				loop jjj
				mov ecx, ebx
				add dh, 1
				call gotoxy
			loop iii

			sub dl, 1
			call gotoxy
			mov ecx, 5
			iiii:
				movzx eax, dollar
				call writechar
			loop iiii
		exit
	main endp
!
COMMENT !
.data
	arr byte 1, 2, 3, 4, 5
.code
	main proc
			mov esi, offset arr
			mov ecx, 5
			mov eax, 0
			L1:
				mov al, [esi]
				call writeint
				call dumpregs
				inc esi


			loop L1
		exit
	main endp
!

comment !
	;move value in eax, and number of times in ebx
	multiply proc
			mov ecx, ebx
			dec ecx				;decrementing ecx once, to go n - 1 times, as 5*4 => 5 + 5 + 5 + 5, but we already have one 5 in eax, so it will become 5+5+5+5+5
			i:
				add eax, eax	
			loop i
		ret
	multiply endp
!

COMMENT !
;//DIAGONAL RANDOM PRINTING, WITH GREEN COLOR
.data
.code
	main proc
			mov eax, 1000
			mov dh, 0
			mov dl, 0
			call gotoxy
			mov ecx, 20
			mov ah, black* 10
			mov al, green*16
			call settextcolor
			call clrscr
			call randomize
			call random32
			i:
				mov eax, 1000
				call randomrange
				call writeint
				add dh, 1
				add dl, 4
				call gotoxy

			loop i

		exit
	main endp
!
COMMENT !
;//check if a string is palindrome or no, NOT WORKING
.data
	displayTrue byte "It is a palindrome"
	displayFalse byte "It is not a palindrome", 0
	s byte 32 dup(?)
	len byte ?
.code
	main proc
			mov eax, 0
			mov edx, offset s
			mov ecx, 32
			call readstring
			mov len, al

			call printString
			movzx eax, len
			mov ebx, 2
			idiv ebx
			mov ecx, eax
			mov esi, 0
			call checkPalindrome

		exit
	main endp
		
	printString proc
			mov edx, offset s
			call writestring
		ret
	printString endp

	checkPalindrome proc
			movzx edi, len
			dec edi
			i:
				movzx eax, s[esi]
				cmp al, s[edi]
				jne isFalse
				inc esi
				dec edi
			loop i
			
			isTrue:
				mov edx, offset displayTrue
				call writestring
				jmp atEnd

			isFalse:
				mov edx, offset displayFalse
				call writestring

			atEnd:
		ret
	checkPalindrome endp
!
COMMENT !
.data
num dword 153
first dword 10
second dword 5
third dword 3
promt byte "the sum is :",0
equal byte "Hence,the number is anagram",0
unequal byte "the number is not an anagram",0

.code
main proc
mov ebx,0

    mov edx,first
    imul edx,edx
    call dumpregs
	imul edx,first
    mov eax ,edx
    add ebx ,edx
    call writedec
    call crlf

    mov edx,second
    imul edx,edx
    imul edx,second
    mov eax ,edx
    add ebx,edx
    call writedec
    call crlf

    mov edx,third
    imul edx,edx
    imul edx,third
    mov eax ,edx
    add ebx,edx
    call writedec
    call crlf

    mov edx,offset promt
    call writestring
    mov eax,ebx
    call writedec
    call crlf


    cmp eax,153
    je ana
     mov edx,offset unequal
     call writestring
	 jmp gone
ana:
     mov edx,offset equal
     call writestring
gone:
    
exit                            
main ENDP
!
.data
	abcd word 2
.code
	main proc
			mov ecx, 6
			mov eax, 6
			imul eax, abcd
			;mov ah, 0
			call writeint
		exit
	main endp


end main