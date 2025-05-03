# Lab 11: String Handling Instructions - Comprehensive Notes  

---

## **String Primitive Instructions**  
These instructions process arrays/strings efficiently using **ESI** (source index) and **EDI** (destination index) registers.  

| Instruction          | Description                                | Example Usage                   |  
|----------------------|--------------------------------------------|---------------------------------|  
| **MOVSB/MOVSW/MOVSD** | Copy data from `[ESI]` to `[EDI]`          | `rep movsb` (copy `ECX` bytes)  |  
| **CMPSB/CMPSW/CMPSD** | Compare `[ESI]` and `[EDI]`                | `repe cmpsb` (find mismatch)    |  
| **SCASB/SCASW/SCASD** | Scan memory for `AL/AX/EAX`                | `repne scasb` (find character)  |  
| **STOSB/STOSW/STOSD** | Store `AL/AX/EAX` at `[EDI]`               | `rep stosb` (fill array)         |  
| **LODSB/LODSW/LODSD** | Load `[ESI]` into `AL/AX/EAX`              | `lodsb` (read byte into `AL`)    |  

---

## **Direction Flag & Repeat Prefixes**  

### **Direction Flag**  
| Flag State | Effect on ESI/EDI | Address Sequence |  
|------------|-------------------|-------------------|  
| **CLD** (Clear) | Incremented       | Low → High        |  
| **STD** (Set)   | Decremented       | High → Low        |  

### **Repeat Prefixes**  
| Prefix          | Action                                   |  
|-----------------|------------------------------------------|  
| **REP**         | Repeat while `ECX > 0`                   |  
| **REPE/REPZ**   | Repeat while `ZF=1` and `ECX > 0`        |  
| **REPNE/REPNZ** | Repeat while `ZF=0` and `ECX > 0`        |  

---

## **String Procedures**  

### **Str_compare**  
Compares two strings and sets flags:  
| Relation        | Carry Flag (CF) | Zero Flag (ZF) | Branch Instruction |  
|-----------------|-----------------|----------------|--------------------|  
| `string1 < string2` | 1               | 0              | `JB`               |  
| `string1 == string2`| 0               | 1              | `JE`               |  
| `string1 > string2` | 0               | 0              | `JA`               |  

**Example**:  
```assembly  
INVOKE Str_compare, ADDR string1, ADDR string2  
```  

---

## **Coding Examples**  

### **1. Copying a String (MOVSB)**  
```assembly  
INCLUDE Irvine32.inc  
.data  
    source BYTE "Hello",0  
    target BYTE SIZEOF source DUP(0)  
.code  
main PROC  
    cld                   ; Forward direction  
    mov esi, OFFSET source  
    mov edi, OFFSET target  
    mov ecx, SIZEOF source  
    rep movsb             ; Copy ECX bytes  
    mov edx, OFFSET target  
    call WriteString      ; Output: "Hello"  
    exit  
main ENDP  
END main  
```  

---

### **2. Comparing Doublewords (CMPSD)**  
```assembly  
INCLUDE Irvine32.inc  
.data  
    greater BYTE 'source > target',0  
    lessOrEqual BYTE 'source <= target',0  
    source DWORD 12345678h  
    target DWORD 12345677h  
.code  
main PROC  
    mov esi, OFFSET source  
    mov edi, OFFSET target  
    cmpsd                   ; Compare doublewords  
    ja L1                   ; Jump if source > target  
    mov edx, OFFSET lessOrEqual  
    jmp endd  
L1:  
    mov edx, OFFSET greater  
endd:  
    call WriteString  
    exit  
main ENDP  
END main  
```  

---

### **3. Scanning for a Character (SCASB)**  
```assembly  
.data  
    alpha BYTE "ABCDEFGH",0  
.code  
    mov edi, OFFSET alpha  
    mov al, 'F'             ; Search for 'F'  
    mov ecx, LENGTHOF alpha  
    cld  
    repne scasb             ; Repeat until found  
    jnz not_found  
    dec edi                 ; EDI points to 'F'  
not_found:  
```  

---

### **4. Filling an Array (STOSB)**  
```assembly  
.data  
    Count = 100  
    string1 BYTE Count DUP(?)  
.code  
    mov al, 0FFh            ; Value to store  
    mov edi, OFFSET string1  
    mov ecx, Count  
    cld  
    rep stosb               ; Fill array with 0FFh  
```  

---

### **5. Array Multiplication (LODSD/STOSD)**  
```assembly  
TITLE Multiply an Array (Mult.asm)  
INCLUDE Irvine32.inc  
.data  
    array DWORD 1,2,3,4,5,6,7,8,9,10  
    multiplier DWORD 10  
.code  
main PROC  
    cld  
    mov esi, OFFSET array    ; Source  
    mov edi, esi             ; Destination  
    mov ecx, LENGTHOF array  
L1:  
    lodsd                    ; Load [ESI] into EAX  
    mul multiplier           ; Multiply by 10  
    stosd                    ; Store EAX into [EDI]  
    loop L1  
    exit  
main ENDP  
END main  
```  

---

### **6. String Length (Str_length)**  
```assembly  
INCLUDE Irvine32.inc  
.data  
    string1 BYTE "Hello World",0  
.code  
main PROC  
    INVOKE Str_length, ADDR string1  ; EAX = length  
    call WriteDec                    ; Output: 11  
    exit  
main ENDP  
END main  
```  

---

### **7. String Copy (Str_copy)**  
```assembly  
INCLUDE Irvine32.inc  
.data  
    source BYTE "COAL",0  
    target BYTE 20 DUP(0)  
.code  
main PROC  
    INVOKE Str_copy, ADDR source, ADDR target  
    mov edx, OFFSET target  
    call WriteString      ; Output: "COAL"  
    exit  
main ENDP  
END main  
```  

---

### **8. Trimming Characters (Str_trim)**  
```assembly  
INCLUDE Irvine32.inc  
.data  
    str1 BYTE "Hellooo",0  
.code  
main PROC  
    INVOKE Str_trim, ADDR str1, 'o'  
    mov edx, OFFSET str1  
    call WriteString      ; Output: "Hell"  
    exit  
main ENDP  
END main  
```  

---

### **9. Uppercase Conversion (Str_ucase)**  
```assembly  
INCLUDE Irvine32.inc  
.data  
    text BYTE "Coal",0  
.code  
main PROC  
    INVOKE Str_ucase, ADDR text  ; Converts to "COAL"  
    mov edx, OFFSET text  
    call WriteString  
    exit  
main ENDP  
END main  
```  
Here are all tables from the provided images, organized and formatted clearly:

---

### **Table 1: String Primitive Instructions**  
| Instruction    | Description    |
|---|---|
| MOVSB, MOVSW, MOVSD | Move string data: Copy from ESI to EDI |
| CMPSB, CMPSW, CMPSD | Compare strings: Compare [ESI] and [EDI] |
| SCASB, SCASW, SCASD | Scan string: Compare AL/AX/EAX to [EDI] |
| STOSB, STOSW, STOSD | Store string data: Store AL/AX/EAX at [EDI] |
| LODSB, LODSW, LODSD | Load accumulator from string: Load [ESI] into AL/AX/EAX |

---

### **Table 2: Repeat Prefixes**  
| Prefix    | Action    |
|---|---|
| REP    | Repeat while `ECX > 0`    |
| REPZ, REPE   | Repeat while `ZF = 1` and `ECX > 0`    |
| REPNZ, REPNE | Repeat while `ZF = 0` and `ECX > 0`    |

---

### **Table 3: Direction Flag Effects**  
| Direction Flag | Effect on ESI/EDI | Address Sequence |
|---|---|---|
| **Clear** (CLD) | Incremented | Low → High |
| **Set** (STD) | Decremented | High → Low |

---

### **Table 4: Compare Instructions**  
| Instruction    | Description    |
|---|---|
| CMPSB    | Compare bytes    |
| CMPSW    | Compare words    |
| CMPSD    | Compare doublewords    |

---

### **Table 5: String Comparison Results**  
| Relation    | Carry Flag (CF) | Zero Flag (ZF) | Branch If True |
|---|---|---|---|
| `string1 < string2` | 1 | 0 | `JB` |
| `string1 = string2` | 0 | 1 | `JE` |
| `string1 > string2` | 0 | 0 | `JA` |

---

### **Table 6: MOV Instructions**  
| Instruction    | Description    |
|---|---|
| MOVSB    | Move (copy) bytes    |
| MOVSW    | Move (copy) words    |
| MOVSD    | Move (copy) doublewords    |

---

### **Table 7: String Procedures**  
| Procedure    | Description    |
|---|---|
| `Str_compare` | Compare two strings    |
| `Str_length` | Return string length in EAX    |
| `Str_copy` | Copy source to target    |
| `Str_trim` | Remove trailing characters    |
| `Str_ucase` | Convert string to uppercase    |

---

These tables cover all string handling instructions, flag behaviors, and procedures discussed in the chapter. Let me know if you need further clarification! 😊
---

## **Key Takeaways**  
1. **Efficiency**: String primitives auto-increment/decrement `ESI/EDI`, enabling fast array/string operations.  
2. **Direction Control**: Use `CLD` (forward) or `STD` (backward) to set traversal order.  
3. **Repeat Prefixes**: `REP` loops until `ECX=0`; `REPNE` stops on mismatch (e.g., finding a character).  
4. **String Procedures**: Leverage `Str_compare`, `Str_copy`, etc., for common string tasks.  
