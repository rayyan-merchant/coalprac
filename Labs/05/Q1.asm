/* 1. Declare a 32-bit signed integer val1 and initialize it with the eight thousand. If val1 is incremented
 by 1 using the ADD instruction, what will be the values of the Carry and Sign flags? */

INCLUDE Irvine32.inc  
.DATA
    val1 SDWORD 8000  

.CODE
main PROC
    ADD val1, 1      
    mov eax, val1    
    call DumpRegs    
    exit
main ENDP
END main
