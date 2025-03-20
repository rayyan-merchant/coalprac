INCLUDE Irvine32.inc  
.DATA
    result WORD ?  

.CODE
main PROC
    mov ax, 7FF0h  
    
    add al, 10h    
    call DumpRegs ; CF = 1, SF = 0, ZF = 1, OF = 0

    add ah, 1      
    call DumpRegs ; CF = 0, SF = 1, ZF = 0, OF = 1

    add ax, 2      
    call DumpRegs ; CF = 0, SF = 1, ZF = 0, OF = 0

    exit
main ENDP
END main


