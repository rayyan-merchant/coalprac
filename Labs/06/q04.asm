INCLUDE Irvine32.inc
.data
Source BYTE "Hi",0
Target BYTE SIZEOF source DUP(?)
.code 
main PROC
    mov esi,OFFSET Source
    mov edi,OFFSET Target

outer:
    mov al,[esi]
    mov [edi],al
    inc esi
    inc edi
    cmp al,0
    jne outer
    mov edx, OFFSET target
    call WriteString
    call Crlf
    exit
main ENDP
end main
