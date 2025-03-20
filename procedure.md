### **Irvine32 Library Functions Overview**  

#### **Console Operations**  
1. **Clrscr** – Clears the console window and positions the cursor at the top-left corner.  
2. **Crlf** – Writes the end-of-line sequence to the console window.  

#### **Writing to Console**  
3. **WriteBin** – Writes an unsigned 32-bit integer in ASCII binary format.  
4. **WriteChar** – Writes a single character to the console window.  
5. **WriteDec** – Writes an unsigned 32-bit integer in decimal format.  
6. **WriteHex** – Writes a 32-bit integer in hexadecimal format.  
7. **WriteInt** – Writes a signed 32-bit integer in decimal format.  
8. **WriteString (EDX = OFFSET String)** – Writes a null-terminated string to the console.  

#### **Reading from Console**  
9. **ReadChar** – Waits for a single character input from the keyboard.  
10. **ReadDec** – Reads an unsigned 32-bit integer from the keyboard.  
11. **ReadHex** – Reads a 32-bit hexadecimal integer, terminated by the Enter key.  
12. **ReadInt** – Reads a signed 32-bit integer, terminated by the Enter key.  
13. **ReadString (EDX = OFFSET, ECX = SIZEOF)** – Reads a string input, terminated by the Enter key.  

#### **Timing & Randomization**  
14. **Delay (EAX)** – Pauses program execution for a specified time (milliseconds).  
15. **Randomize** – Seeds the random number generator with a unique value.  

#### **Debugging & System Info**  
16. **DumpRegs** – Displays register values (EAX, EBX, ECX, EDX, ESI, EDI, ESP, EIP, and EFLAGS).  
17. **DumpMem (ESI = Starting OFFSET, ECX = Length, EBX = Type)** – Displays a memory block in hexadecimal format.  
18. **getDateTime** – Retrieves the current system date and time.  
19. **GetMaxXY (DX = col, AX = row)** – Gets the number of columns and rows in the console buffer.  
20. **GetTextColor (Background = Upper AL, Foreground = Lower AL)** – Returns the current console text colors.  
21. **Gotoxy (DH = row, DL = col)** – Moves the cursor to the specified position in the console window.  

---

This formatting makes it easier to read and understand. Let me know if you need any modifications! 🚀
