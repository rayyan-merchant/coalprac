# COAL Lab 09 Notes: Integer Arithmetic  

## **Learning Objectives**  
1. **Shift & Rotate Instructions**  
2. **Multiplication and Division**  
3. **Extended Addition and Subtraction**  

---

## **Shift Instructions**  
### **SHL (Shift Left Logical)**  
- **Syntax**: `SHL destination, count`  
- **Operation**: Shifts bits left; fills LSB with 0, MSB → CF.  
- **Example**:  
  ```asm
  mov bl, 8Fh     ; BL = 10001111b  
  SHL bl, 1       ; CF=1, BL=00011110b (1Eh)  
  ```  
- **Application**: Multiply by \(2^n\).  
  ```asm
  mov dl, 5       ; DL=5 (00000101b)  
  SHL dl, 1       ; DL=10 (00001010b)  
  ```  

### **SHR (Shift Right Logical)**  
- **Syntax**: `SHR destination, count`  
- **Operation**: Shifts bits right; fills MSB with 0, LSB → CF.  
- **Example**:  
  ```asm
  mov al, 0D0h    ; AL=11010000b  
  SHR al, 1       ; AL=01101000b (68h), CF=0  
  ```  
- **Application**: Divide by \(2^n\).  
  ```asm
  mov dl, 32      ; DL=32 (00100000b)  
  SHR dl, 1       ; DL=16 (00010000b)  
  ```  

### **Arithmetic Shifts (SAL/SAR)**  
- **SAL**: Same as SHL.  
- **SAR (Shift Arithmetic Right)**: Preserves sign bit.  
  ```asm
  mov al, 0F0h    ; AL=11110000b (-16)  
  SAR al, 1       ; AL=11111000b (-8), CF=0  
  ```  

---

## **Rotate Instructions**  
### **ROL (Rotate Left)**  
- **Syntax**: `ROL destination, count`  
- **Operation**: MSB → LSB and CF.  
  ```asm
  mov al, 40h     ; AL=01000000b  
  ROL al, 1       ; AL=10000000b, CF=0  
  ```  

### **ROR (Rotate Right)**  
- **Syntax**: `ROR destination, count`  
- **Operation**: LSB → MSB and CF.  
  ```asm
  mov al, 01h     ; AL=00000001b  
  ROR al, 1       ; AL=10000000b, CF=1  
  ```  

### **RCL/RCR (Rotate with Carry)**  
- **RCL (Rotate Carry Left)**: CF → LSB, MSB → CF.  
  ```asm
  clc             ; CF=0  
  mov bl, 88h     ; BL=10001000b  
  RCL bl, 1       ; BL=00010000b, CF=1  
  ```  
- **RCR (Rotate Carry Right)**: CF → MSB, LSB → CF.  

---

## **Shift Double Instructions**  
### **SHLD (Shift Left Double)**  
- **Syntax**: `SHLD dest, source, count`  
- **Example**:  
  ```asm
  mov ax, 0AC36h  
  SHLD a, ax, 4   ; a=BA6Ah (if a=9BA6h initially)  
  ```  

### **SHRD (Shift Right Double)**  
- **Syntax**: `SHRD dest, source, count`  
- **Example**:  
  ```asm
  mov ax, 234Bh  
  mov dx, 7654h  
  SHRD ax, dx, 4  ; ax=4234h  
  ```  

---

## **Multiplication**  
### **MUL (Unsigned)**  
- **Operands**:  
  | Multiplicand | Multiplier | Product    |  
  |--------------|------------|------------|  
  | AL           | reg/mem8   | AX         |  
  | AX           | reg/mem16  | DX:AX      |  
  | EAX          | reg/mem32  | EDX:EAX    |  

- **Example**:  
  ```asm
  mov al, 5h  
  mov bl, 10h  
  mul bl        ; AX=0050h  
  ```  

### **IMUL (Signed)**  
- **Formats**:  
  - One-operand: `IMUL reg/mem`  
  - Two-operand: `IMUL dest, src`  
  - Three-operand: `IMUL dest, src, imm`  
- **Example**:  
  ```asm
  mov al, -4  
  mov bl, 2  
  imul bl       ; AX=FFF8h (-8)  
  ```  

---

## **Division**  
### **DIV (Unsigned)**  
- **Dividend/Divisor**:  
  | Dividend  | Divisor   | Quotient | Remainder |  
  |-----------|-----------|----------|-----------|  
  | AX        | reg/mem8  | AL       | AH        |  
  | DX:AX     | reg/mem16 | AX       | DX        |  
  | EDX:EAX   | reg/mem32 | EAX      | EDX       |  

- **Example**:  
  ```asm
  mov ax, 0083h  
  mov bl, 2  
  div bl        ; AL=41h (65), AH=01h  
  ```  

### **IDIV (Signed)**  
- Requires sign extension using **CBW**, **CWD**, **CDQ**.  
  ```asm
  mov al, -48   ; AL=D0h  
  cbw           ; AX=FFD0h  
  idiv bl       ; AL=-9, AH=-3  
  ```  

---

## **Extended Addition/Subtraction**  
### **ADC (Add with Carry)**  
- **Syntax**: `ADC dest, src`  
  ```asm
  mov dl, 0  
  mov al, 0FFh  
  add al, 0FFh  ; AL=FEh, CF=1  
  adc dl, 0     ; DL=01h (DL:AL=01FEh)  
  ```  

### **SBB (Subtract with Borrow)**  
- **Syntax**: `SBB dest, src`  
  ```asm
  mov edx, 7  
  mov eax, 1  
  sub eax, 2     ; EAX=FFFFFFFFh, CF=1  
  sbb edx, 0     ; EDX=6  
  ```  

---

## **Applications**  
1. **Binary Multiplication**: Use `SHL` and `ADD` to multiply by powers of 2.  
   ```asm
   ; EAX * 21 = EAX*(16+4+1)  
   mov ebx, eax  
   shl eax, 4      ; *16  
   shl ebx, 2      ; *4  
   add eax, ebx  
   add eax, eax    ; *1 (optional: add original value)  
   ```  

2. **Isolating Data Fields**: Use shifts and masks.  
   ```asm
   ; Extract month from DX (bits 5-8):  
   mov ax, dx  
   shr ax, 5  
   and al, 0Fh  
   ```  

---

## **Key Differences**  
| Instruction | Type      | Use Case           |  
|-------------|-----------|--------------------|  
| SHL vs SAL  | Logical vs Arithmetic | SAL = SHL |  
| SHR vs SAR  | Logical vs Arithmetic | SAR preserves sign |  
| MUL vs IMUL | Unsigned vs Signed | IMUL sets OF |  
| DIV vs IDIV | Unsigned vs Signed | IDIV requires sign extension |  

**Flags**:  
- **CF**: Set if overflow occurs in shifts.  
- **OF**: Relevant for signed operations (IMUL).



**COAL Lab 09 Notes: Integer Arithmetic (Including All Coding Examples)**  

---

## **Shift Instructions**  
### **SHL (Shift Left Logical)**  
**Example 1**:  
```asm
mov bl, 8Fh      ; BL = 10001111b  
SHL bl, 1        ; CF=1, BL=00011110b (1Eh)  
```  
**Example 2**:  
```asm
mov al, 10000000b ; AL=10000000b  
SHL al, 2         ; CF=0, AL=00000000b  
```  
**Multiplication via SHL**:  
```asm
mov dl, 5        ; DL=00000101b (5)  
SHL dl, 1        ; DL=00001010b (10)  
```  

### **SHR (Shift Right Logical)**  
**Example 1**:  
```asm
mov al, 0D0h     ; AL=11010000b  
SHR al, 1        ; AL=01101000b (68h), CF=0  
```  
**Example 2**:  
```asm
mov al, 00000010b  
SHR al, 2        ; AL=00000000b, CF=1  
```  
**Division via SHR**:  
```asm
mov dl, 32       ; DL=00100000b (32)  
SHR dl, 1        ; DL=00010000b (16)  
```  

### **SAR (Shift Arithmetic Right)**  
**Example**:  
```asm
mov al, 0F0h     ; AL=11110000b (-16)  
SAR al, 1        ; AL=11111000b (-8), CF=0  
```  
**Sign Division**:  
```asm
mov dl, -128     ; DL=10000000b  
SAR dl, 3        ; DL=11110000b (-16)  
```  

**Shift Operations Table**:  
| Instruction | Initial (Decimal) | Initial (Binary) | Final (Decimal) | Final (Binary) | CF |  
|-------------|-------------------|------------------|------------------|-----------------|----|  
| `SHR AL,1`  | 250               | 11111010        | 125              | 01111010        | 0  |  
| `SHR AL,CL` | 250               | 11111010        | 31               | 00011111        | 0  |  
| `SHL AL,1`  | 23                | 00010111        | 46               | 00101110        | 0  |  
| `SAR AL,1`  | -126              | 10000010        | -63              | 11000001        | 0  |  

---

## **Rotate Instructions**  
### **ROL (Rotate Left)**  
**Example 1**:  
```asm
mov al, 40h      ; AL=01000000b  
ROL al, 1        ; AL=10000000b, CF=0  
ROL al, 1        ; AL=00000001b, CF=1  
ROL al, 1        ; AL=00000010b, CF=0  
```  
**Example 2 (Bit Exchange)**:  
```asm
mov al, 26h      ; AL=00100110b  
ROL al, 4        ; AL=01100010b (62h)  
```  

### **ROR (Rotate Right)**  
**Example**:  
```asm
mov al, 01h      ; AL=00000001b  
ROR al, 1        ; AL=10000000b, CF=1  
ROR al, 1        ; AL=01000000b, CF=0  
```  

### **RCL (Rotate Carry Left)**  
**Example**:  
```asm
clc              ; CF=0  
mov bl, 88h      ; BL=10001000b  
RCL bl, 1        ; BL=00010000b, CF=1  
```  

### **RCR (Rotate Carry Right)**  
**Example**:  
```asm
mov ah, 10h      ; AH=00010000b  
stc              ; CF=1  
RCR ah, 1        ; AH=10001000b, CF=0  
```  

---

## **Shift Double Instructions**  
### **SHLD (Shift Left Double)**  
**Example**:  
```asm
.data  
a WORD 9BA6h  
.code  
mov ax, 0AC36h  
SHLD a, ax, 4    ; a=BA6Ah  
```  

### **SHRD (Shift Right Double)**  
**Example**:  
```asm
mov ax, 234Bh  
mov dx, 7654h  
SHRD ax, dx, 4   ; ax=4234h  
```  

---

## **Multiplication**  
### **MUL (Unsigned)**  
**Example 1**:  
```asm
mov al, 5h  
mov bl, 10h  
MUL bl           ; AX=0050h (80)  
```  
**Example 2**:  
```asm
.data  
val1 WORD 2000h  
val2 WORD 0100h  
.code  
mov ax, val1     ; AX=2000h  
MUL val2         ; DX:AX=00200000h  
```  
**Example 3**:  
```asm
mov eax, 12345h  
mov ebx, 1000h  
MUL ebx          ; EDX:EAX=0000000012345000h  
```  

### **IMUL (Signed)**  
**One-Operand Example**:  
```asm
mov al, -4  
mov bl, 2  
IMUL bl          ; AX=FFF8h (-8)  
```  
**Three-Operand Example**:  
```asm
.data  
word1 SWORD 4  
.code  
IMUL bx, word1, -2   ; BX= -8  
```  

---

## **Division**  
### **DIV (Unsigned)**  
**Example**:  
```asm
mov ax, 0083h    ; Dividend=131  
mov bl, 2        ; Divisor=2  
DIV bl           ; AL=41h (65), AH=01h (1)  
```  
**Extended Example**:  
```asm
mov dx, 0        ; Clear high dividend  
mov ax, 8003h    ; Low dividend=32771  
mov cx, 100h     ; Divisor=256  
DIV cx           ; AX=0080h (128), DX=0003h (3)  
```  

### **IDIV (Signed)**  
**Example**:  
```asm
.data  
byteVal SBYTE -48 ; D0h  
.code  
mov al, byteVal  
cbw              ; AX=FFD0h (-48)  
mov bl, 5  
IDIV bl          ; AL=-9, AH=-3  
```  

---

## **Extended Addition/Subtraction**  
### **ADC (Add with Carry)**  
**Example**:  
```asm
mov dl, 0  
mov al, 0FFh  
ADD al, 0FFh     ; AL=FEh, CF=1  
ADC dl, 0        ; DL=01h (DL:AL=01FEh)  
```  

### **SBB (Subtract with Borrow)**  
**Example**:  
```asm
mov edx, 7  
mov eax, 1  
SUB eax, 2        ; EAX=FFFFFFFFh, CF=1  
SBB edx, 0        ; EDX=6  
```  
