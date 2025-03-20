INCLUDE Irvine32.inc
.data
    msg1 BYTE "Enter a character: ",0
    msg2 BYTE "Enter a decimal number: ",0
    msg3 BYTE "Enter a hex number: ",0
    msg4 BYTE "Enter a signed number: ",0
    msg5 BYTE "Enter a string: ",0
    buffer BYTE 20 DUP(0)  ; Buffer for ReadString
.code
main PROC
    ; Clear screen
    call Clrscr
    
    ; Newline
    call Crlf
    
    ; Write a character
    mov al, 'A'
    call WriteChar
    call Crlf
    
    ; Write a decimal number
    mov eax, 1234
    call WriteDec
    call Crlf
    
    ; Write a hexadecimal number
    mov eax, 0DEADBEEFh
    call WriteHex
    call Crlf
    
    ; Write a signed integer
    mov eax, -5678
    call WriteInt
    call Crlf
    
    ; Write a string
    mov edx, OFFSET msg1
    call WriteString
    call Crlf
    
    ; Read a character
    call ReadChar
    call WriteChar
    call Crlf
    
    ; Read an unsigned decimal number
    mov edx, OFFSET msg2
    call WriteString
    call ReadDec
    call WriteDec
    call Crlf
    
    ; Read a hexadecimal number
    mov edx, OFFSET msg3
    call WriteString
    call ReadHex
    call WriteHex
    call Crlf
    
    ; Read a signed integer
    mov edx, OFFSET msg4
    call WriteString
    call ReadInt
    call WriteInt
    call Crlf
    
    ; Read a string
    mov edx, OFFSET msg5
    call WriteString
    mov edx, OFFSET buffer
    mov ecx, SIZEOF buffer
    call ReadString
    call WriteString
    call Crlf
    
    ; Delay (pause for 2 seconds)
    mov eax, 2000
    call Delay
    
    ; Randomize seed
    call Randomize
    
    ; Dump registers
    call DumpRegs
    
    ; Get max screen size
    call GetMaxXY
    
    ; Get text color
    call GetTextColor
    
    ; Move cursor position
    mov dh, 5   ; Row 5
    mov dl, 10  ; Column 10
    call Gotoxy
    
    ; Exit
    exit
main ENDP
END main

