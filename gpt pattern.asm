;====================================================
; MASM Pattern Printing Example Using Irvine32.inc
; This program demonstrates many classic patterns.
;====================================================

INCLUDE Irvine32.inc

.data
; Title messages for each pattern
msg1  BYTE "1. Right-Angled Triangle:", 13,10,0
msg2  BYTE "2. Inverted Right-Angled Triangle:", 13,10,0
msg3  BYTE "3. Pyramid Pattern:", 13,10,0
msg4  BYTE "4. Inverted Pyramid Pattern:", 13,10,0
msg5  BYTE "5. Incremental Numbers:", 13,10,0
msg6  BYTE "6. Repeated Numbers:", 13,10,0
msg7  BYTE "7. Number Pyramid:", 13,10,0
msg8  BYTE "8. Binary Pattern:", 13,10,0
msg9  BYTE "9. Diamond Shape:", 13,10,0
msg10 BYTE "10. Hollow Diamond:", 13,10,0
msg11 BYTE "11. Butterfly Pattern:", 13,10,0
msg12 BYTE "12. Alphabet Pyramid:", 13,10,0
msg13 BYTE "13. ASCII Character Triangle:", 13,10,0
msg14 BYTE "14. Zigzag Character Pattern:", 13,10,0
msg15 BYTE "15. Pascal's Triangle:", 13,10,0
msg16 BYTE "16. Floyd's Triangle:", 13,10,0
msg17 BYTE "17. Hollow Square:", 13,10,0
msg18 BYTE "18. Hollow Triangle:", 13,10,0

pauseMsg BYTE "Press any key to continue...", 13,10,0

newline BYTE 13,10,0

;----------------------------------------------------
; Main program
;----------------------------------------------------
.code
main PROC
    ; 1. Right-Angled Triangle Pattern
    mov edx, OFFSET msg1
    call WriteString
    call RightAngledTriangle
    call PauseForPattern

    ; 2. Inverted Right-Angled Triangle Pattern
    mov edx, OFFSET msg2
    call WriteString
    call InvertedRightAngledTriangle
    call PauseForPattern

    ; 3. Pyramid Pattern
    mov edx, OFFSET msg3
    call WriteString
    call PyramidPattern
    call PauseForPattern

    ; 4. Inverted Pyramid Pattern
    mov edx, OFFSET msg4
    call WriteString
    call InvertedPyramidPattern
    call PauseForPattern

    ; 5. Incremental Numbers Pattern
    mov edx, OFFSET msg5
    call WriteString
    call IncrementalNumbers
    call PauseForPattern

    ; 6. Repeated Numbers Pattern
    mov edx, OFFSET msg6
    call WriteString
    call RepeatedNumbers
    call PauseForPattern

    ; 7. Number Pyramid Pattern
    mov edx, OFFSET msg7
    call WriteString
    call NumberPyramid
    call PauseForPattern

    ; 8. Binary Pattern
    mov edx, OFFSET msg8
    call WriteString
    call BinaryPattern
    call PauseForPattern

    ; 9. Diamond Shape Pattern
    mov edx, OFFSET msg9
    call WriteString
    call DiamondShape
    call PauseForPattern

    ; 10. Hollow Diamond Pattern
    mov edx, OFFSET msg10
    call WriteString
    call HollowDiamond
    call PauseForPattern

    ; 11. Butterfly Pattern
    mov edx, OFFSET msg11
    call WriteString
    call ButterflyPattern
    call PauseForPattern

    ; 12. Alphabet Pyramid Pattern
    mov edx, OFFSET msg12
    call WriteString
    call AlphabetPyramid
    call PauseForPattern

    ; 13. ASCII Character Triangle Pattern
    mov edx, OFFSET msg13
    call WriteString
    call AsciiCharTriangle
    call PauseForPattern

    ; 14. Zigzag Character Pattern
    mov edx, OFFSET msg14
    call WriteString
    call ZigzagPattern
    call PauseForPattern

    ; 15. Pascal's Triangle (using precomputed rows)
    mov edx, OFFSET msg15
    call WriteString
    call PascalsTriangle
    call PauseForPattern

    ; 16. Floyd's Triangle Pattern
    mov edx, OFFSET msg16
    call WriteString
    call FloydsTriangle
    call PauseForPattern

    ; 17. Hollow Square Pattern
    mov edx, OFFSET msg17
    call WriteString
    call HollowSquare
    call PauseForPattern

    ; 18. Hollow Triangle Pattern
    mov edx, OFFSET msg18
    call WriteString
    call HollowTriangle
    call PauseForPattern

    exit
main ENDP

;----------------------------------------------------
; Pause routine: waits for a key press then outputs a newline.
PauseForPattern PROC
    mov edx, OFFSET pauseMsg
    call WriteString
    call ReadChar
    call Crlf
    ret
PauseForPattern ENDP

;----------------------------------------------------
; Helper Procedures: PrintStars and PrintSpaces
;----------------------------------------------------
; PrintStars: prints (in EDX) '*' characters.
PrintStars PROC
    cmp edx, 0
    jle PrintStarsEnd
PrintStarsLoop:
    mov al, '*'
    call WriteChar
    dec edx
    cmp edx, 0
    jne PrintStarsLoop
PrintStarsEnd:
    ret
PrintStars ENDP

; PrintSpaces: prints (in EAX) ' ' characters.
PrintSpaces PROC
    cmp eax, 0
    jle PrintSpacesEnd
PrintSpacesLoop:
    mov al, ' '
    call WriteChar
    dec eax
    cmp eax, 0
    jne PrintSpacesLoop
PrintSpacesEnd:
    ret
PrintSpaces ENDP

;----------------------------------------------------
; 1. Right-Angled Triangle Pattern (stars)
; Example (5 rows):
; *
; **
; ***
; ****
; *****
;----------------------------------------------------
RightAngledTriangle PROC
    mov ecx, 5       ; number of rows
    mov ebx, 1       ; starting star count
RightAngledLoop:
    mov edx, ebx     ; set count for stars
    call PrintStars
    call Crlf
    inc ebx
    loop RightAngledLoop
    ret
RightAngledTriangle ENDP

;----------------------------------------------------
; 2. Inverted Right-Angled Triangle Pattern (stars)
; Example (5 rows):
; *****
; ****
; ***
; **
; *
;----------------------------------------------------
InvertedRightAngledTriangle PROC
    mov ecx, 5       ; number of rows
    mov ebx, 5       ; starting star count
InvertedRightAngledLoop:
    mov edx, ebx
    call PrintStars
    call Crlf
    dec ebx
    loop InvertedRightAngledLoop
    ret
InvertedRightAngledTriangle ENDP

;----------------------------------------------------
; 3. Pyramid Pattern (stars)
; Example:
;     *
;    ***
;   *****
;  *******
; *********
;----------------------------------------------------
PyramidPattern PROC
    mov ecx, 5       ; number of rows
    mov esi, 1       ; starting number of stars
PyramidLoop:
    ; Print leading spaces = (rows - current row)
    mov eax, 5
    sub eax, ecx
    push eax
    call PrintSpaces
    pop eax
    ; Print stars (ESI holds stars count)
    mov edx, esi
    call PrintStars
    call Crlf
    add esi, 2       ; next row increases stars by 2
    loop PyramidLoop
    ret
PyramidPattern ENDP

;----------------------------------------------------
; 4. Inverted Pyramid Pattern (stars)
; Example:
; *********
;  ******* 
;   *****  
;    ***   
;     *    
;----------------------------------------------------
InvertedPyramidPattern PROC
    mov ecx, 5       ; number of rows
    mov esi, 9       ; starting stars (for 5 rows: 2*5-1 = 9)
InvertedPyramidLoop:
    ; Print leading spaces = (current row - 1)
    mov eax, 5
    sub eax, ecx
    push eax
    call PrintSpaces
    pop eax
    mov edx, esi
    call PrintStars
    call Crlf
    sub esi, 2      ; decrease stars by 2 each row
    loop InvertedPyramidLoop
    ret
InvertedPyramidPattern ENDP

;----------------------------------------------------
; 5. Incremental Numbers Pattern
; Example:
; 1
; 12
; 123
; 1234
; 12345
;----------------------------------------------------
IncrementalNumbers PROC
    mov ecx, 5       ; number of rows
    mov ebx, 1       ; current row number
IncNumLoop:
    mov edx, 1       ; number to start printing from
PrintIncLoop:
    push edx
    mov eax, edx
    call WriteDec
    pop edx
    inc edx
    cmp edx, ebx+1
    jl PrintIncLoop
    call Crlf
    inc ebx
    loop IncNumLoop
    ret
IncrementalNumbers ENDP

;----------------------------------------------------
; 6. Repeated Numbers Pattern
; Example:
; 1
; 22
; 333
; 4444
; 55555
;----------------------------------------------------
RepeatedNumbers PROC
    mov ecx, 5       ; number of rows
    mov ebx, 1       ; current number
RepeatLoop:
    mov edx, 1
PrintRepeatLoop:
    push edx
    mov eax, ebx
    call WriteDec
    pop edx
    inc edx
    cmp edx, ebx+1
    jl PrintRepeatLoop
    call Crlf
    inc ebx
    loop RepeatLoop
    ret
RepeatedNumbers ENDP

;----------------------------------------------------
; 7. Number Pyramid Pattern
; Example:
;     1
;    121
;   12321
;  1234321
; 123454321
;----------------------------------------------------
NumberPyramid PROC
    mov ecx, 5       ; rows
    mov ebx, 1       ; row counter
NumPyramidLoop:
    ; Print leading spaces: (rows - current row)
    mov eax, 5
    sub eax, ebx
    push eax
    call PrintSpaces
    pop eax
    ; Print ascending numbers from 1 to row number
    mov edx, 1
PrintAsc:
    push edx
    mov eax, edx
    call WriteDec
    pop edx
    inc edx
    cmp edx, ebx+1
    jl PrintAsc
    ; Print descending numbers from (row-1) downto 1
    mov edx, ebx
    dec edx
PrintDesc:
    cmp edx, 0
    jle AfterDesc
    push edx
    mov eax, edx
    call WriteDec
    pop edx
    dec edx
    jmp PrintDesc
AfterDesc:
    call Crlf
    inc ebx
    loop NumberPyramidLoop
    ret
NumberPyramid ENDP

;----------------------------------------------------
; 8. Binary Pattern
; Example:
; 1
; 01
; 101
; 0101
; 10101
;----------------------------------------------------
BinaryPattern PROC
    mov ecx, 5       ; rows
    mov ebx, 1       ; current row number
BinaryLoop:
    ; Determine starting digit: if row is odd, start with '1', else '0'
    mov eax, ebx
    and eax, 1
    mov esi, eax    ; starting digit stored in ESI (0 or 1)
    ; Print row: alternate digit for each column
    mov edi, 1      ; column counter
BinaryInner:
    ; Compute current digit: toggle every column
    mov eax, edi
    dec eax       ; (column-1)
    and eax, 1    ; 0 or 1
    xor eax, esi  ; toggle if necessary
    add eax, '0'
    mov dl, al
    call WriteChar
    inc edi
    cmp edi, ebx+1
    jl BinaryInner
    call Crlf
    inc ebx
    loop BinaryLoop
    ret
BinaryPattern ENDP

;----------------------------------------------------
; 9. Diamond Shape Pattern
; (A combination of Pyramid and Inverted Pyramid)
;----------------------------------------------------
DiamondShape PROC
    ; Top half (5 rows pyramid)
    mov ecx, 5
    mov esi, 1       ; stars count starting at 1
DiamondTop:
    mov eax, 5
    sub eax, ecx
    push eax
    call PrintSpaces
    pop eax
    mov edx, esi
    call PrintStars
    call Crlf
    add esi, 2
    loop DiamondTop

    ; Bottom half (4 rows, mirror top without middle line)
    mov ecx, 4
    mov esi, 7      ; stars count starting at 7
DiamondBottom:
    mov eax, 4
    sub eax, ecx   ; leading spaces increases
    push eax
    call PrintSpaces
    pop eax
    mov edx, esi
    call PrintStars
    call Crlf
    sub esi, 2
    loop DiamondBottom
    ret
DiamondShape ENDP

;----------------------------------------------------
; 10. Hollow Diamond Pattern
;----------------------------------------------------
HollowDiamond PROC
    ; Top half (5 rows)
    mov ecx, 5
    mov ebx, 1     ; current row
HollowDiamondTop:
    mov eax, 5
    sub eax, ebx
    push eax
    call PrintSpaces
    pop eax
    cmp ebx, 1
    je HD_Top_Single
    ; Print star, inner spaces, star
    mov al, '*'
    call WriteChar
    mov eax, ebx
    shl eax, 1
    sub eax, 3   ; inner spaces = 2*row - 3
    push eax
    call PrintSpaces
    pop eax
    mov al, '*'
    call WriteChar
    jmp HD_Top_End
HD_Top_Single:
    mov al, '*'
    call WriteChar
HD_Top_End:
    call Crlf
    inc ebx
    loop HollowDiamondTop

    ; Bottom half (4 rows)
    mov ecx, 4
    mov ebx, 4   ; starting row for bottom half
HollowDiamondBottom:
    mov eax, 5
    sub eax, ebx
    push eax
    call PrintSpaces
    pop eax
    mov al, '*'
    call WriteChar
    mov eax, ebx
    shl eax, 1
    sub eax, 1   ; inner spaces = 2*row - 1
    push eax
    call PrintSpaces
    pop eax
    mov al, '*'
    call WriteChar
    call Crlf
    dec ebx
    loop HollowDiamondBottom
    ret
HollowDiamond ENDP

;----------------------------------------------------
; 11. Butterfly Pattern
;----------------------------------------------------
ButterflyPattern PROC
    ; Top half (5 rows)
    mov ecx, 5
    mov ebx, 1
ButterflyTop:
    ; Left stars
    mov edx, ebx
    call PrintStars
    ; Spaces = 2*(5 - ebx)
    mov eax, 5
    sub eax, ebx
    shl eax, 1
    push eax
    call PrintSpaces
    pop eax
    ; Right stars
    mov edx, ebx
    call PrintStars
    call Crlf
    inc ebx
    loop ButterflyTop

    ; Bottom half (5 rows)
    mov ecx, 5
    mov ebx, 5
ButterflyBottom:
    mov edx, ebx
    call PrintStars
    mov eax, 5
    sub eax, ebx
    shl eax, 1
    push eax
    call PrintSpaces
    pop eax
    mov edx, ebx
    call PrintStars
    call Crlf
    dec ebx
    loop ButterflyBottom
    ret
ButterflyPattern ENDP

;----------------------------------------------------
; 12. Alphabet Pyramid Pattern
; Example:
;     A
;    ABA
;   ABCBA
;  ABCDCBA
; ABCDEDCBA
;----------------------------------------------------
AlphabetPyramid PROC
    mov ecx, 5
    mov ebx, 1
AlphabetLoop:
    ; Print leading spaces
    mov eax, 5
    sub eax, ebx
    push eax
    call PrintSpaces
    pop eax
    ; Print ascending alphabets
    mov edx, 0     ; offset for letter
AlphaAsc:
    mov al, 'A'
    add al, dl
    call WriteChar
    inc dl
    cmp dl, ebx
    jl AlphaAsc
    dec dl       ; prepare for descending part
AlphaDesc:
    dec dl
    cmp dl, -1
    jle AlphaEnd
    mov al, 'A'
    add al, dl
    call WriteChar
    jmp AlphaDesc
AlphaEnd:
    call Crlf
    inc ebx
    loop AlphabetLoop
    ret
AlphabetPyramid ENDP

;----------------------------------------------------
; 13. ASCII Character Triangle Pattern
; Example:
; A
; AB
; ABC
; ABCD
; ABCDE
;----------------------------------------------------
AsciiCharTriangle PROC
    mov ecx, 5
    mov ebx, 1
AsciiLoop:
    mov edx, 0
AsciiInner:
    mov al, 'A'
    add al, dl
    call WriteChar
    inc dl
    cmp dl, ebx
    jl AsciiInner
    call Crlf
    inc ebx
    loop AsciiLoop
    ret
AsciiCharTriangle ENDP

;----------------------------------------------------
; 14. Zigzag Character Pattern
; Example:
; A B C D E
;  B C D E
;   C D E
;    D E
;     E
;----------------------------------------------------
ZigzagPattern PROC
    mov ecx, 5
    mov ebx, 0
ZigzagLoop:
    ; Print leading spaces = ebx
    mov eax, ebx
    push eax
    call PrintSpaces
    pop eax
    ; Print letters starting from 'A'+ebx up to 'E'
    mov edx, ebx
ZigzagInner:
    mov al, 'A'
    add al, dl
    call WriteChar
    mov al, ' '   ; space separator
    call WriteChar
    inc dl
    cmp dl, 5
    jl ZigzagInner
    call Crlf
    inc ebx
    loop ZigzagLoop
    ret
ZigzagPattern ENDP

;----------------------------------------------------
; 15. Pascal's Triangle (precomputed rows for 5 rows)
;----------------------------------------------------
PascalsTriangle PROC
    mov edx, OFFSET newline
    call WriteString

    mov edx, OFFSET "    1"
    call WriteString
    call Crlf
    mov edx, OFFSET "   1 1"
    call WriteString
    call Crlf
    mov edx, OFFSET "  1 2 1"
    call WriteString
    call Crlf
    mov edx, OFFSET " 1 3 3 1"
    call WriteString
    call Crlf
    mov edx, OFFSET "1 4 6 4 1"
    call WriteString
    call Crlf
    ret
PascalsTriangle ENDP

;----------------------------------------------------
; 16. Floyd's Triangle Pattern
; Example:
; 1
; 2 3
; 4 5 6
; 7 8 9 10
; 11 12 13 14 15
;----------------------------------------------------
FloydsTriangle PROC
    mov ecx, 5      ; number of rows
    mov eax, 1      ; starting number
    mov esi, 1      ; current row
FloydRow:
    mov ebx, 0      ; inner counter
FloydInner:
    inc ebx
    push eax
    call WriteDec
    mov al, ' '
    call WriteChar
    pop eax
    inc eax
    cmp ebx, esi
    jl FloydInner
    call Crlf
    inc esi
    loop FloydRow
    ret
FloydsTriangle ENDP

;----------------------------------------------------
; 17. Hollow Square Pattern (5x5)
; Example:
; *****
; *   *
; *   *
; *   *
; *****
;----------------------------------------------------
HollowSquare PROC
    mov ecx, 5       ; total rows
    mov edi, 5       ; width
HollowSquareLoop:
    ; For first and last row, print full stars.
    cmp ecx, 5
    je HS_FullRow
    cmp ecx, 1
    je HS_FullRow
    ; Otherwise, print star, (width-2) spaces, star.
    mov al, '*'
    call WriteChar
    mov eax, 3      ; 5 - 2 = 3 spaces
    call PrintSpaces
    mov al, '*'
    call WriteChar
    jmp HS_EndRow
HS_FullRow:
    mov edx, 5
    call PrintStars
HS_EndRow:
    call Crlf
    dec ecx
    cmp ecx, 0
    jne HollowSquareLoop
    ret
HollowSquare ENDP

;----------------------------------------------------
; 18. Hollow Triangle Pattern
; Example:
;    *
;   * *
;  *   *
; *     *
; *********
;----------------------------------------------------
HollowTriangle PROC
    mov ecx, 5       ; number of rows
    mov ebx, 1       ; current row
HollowTriangleLoop:
    cmp ebx, 1
    je HT_FirstRow
    cmp ebx, 5
    je HT_LastRow
    ; For intermediate rows: print star, inner spaces, star.
    ; Print leading spaces: (rows - current row)
    mov eax, 5
    sub eax, ebx
    push eax
    call PrintSpaces
    pop eax
    mov al, '*'
    call WriteChar
    ; Inner spaces = (2*current row - 3)
    mov eax, ebx
    shl eax, 1
    sub eax, 3
    call PrintSpaces
    mov al, '*'
    call WriteChar
    jmp HT_RowEnd
HT_FirstRow:
    ; First row: print leading spaces then star.
    mov eax, 5
    sub eax, ebx
    push eax
    call PrintSpaces
    pop eax
    mov al, '*'
    call WriteChar
    jmp HT_RowEnd
HT_LastRow:
    ; Last row: print (2*rows -1) stars.
    mov edx, 9    ; (2*5 -1) = 9
    call PrintStars
HT_RowEnd:
    call Crlf
    inc ebx
    loop HollowTriangleLoop
    ret
HollowTriangle ENDP

;----------------------------------------------------
END main
