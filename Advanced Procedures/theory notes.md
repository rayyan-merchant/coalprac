# Lab 10: Advanced Procedures - Short Notes  

## Key Concepts  
### 1. **Stack Frame**  
- A partition of the stack used to manage parameters, return addresses, and local variables.  
- **EBP** (Base Pointer) anchors the stack frame; **ESP** (Stack Pointer) tracks the top of the stack.  
- Created using `ENTER` and destroyed using `LEAVE`.  

---

### 2. **Parameter Passing**  
| Type          | Description                          | Example              |  
|---------------|--------------------------------------|----------------------|  
| **By Value**  | Pushes a copy of the value           | `push var1`          |  
| **By Reference** | Pushes the memory address         | `push OFFSET arr`    |  

- **Arrays** are always passed by reference for efficiency.  

---

### 3. **Local Variables**  
- Declared on the stack below **EBP**.  
- Use `LOCAL` directive for readability:  
  ```assembly  
  MySub PROC  
    LOCAL temp:DWORD, flag:BYTE  
    mov temp, 10  
  MySub ENDP  
  ```  
- Manual allocation:  
  ```assembly  
  sub esp, 8          ; Allocate 8 bytes  
  mov [ebp-4], 10     ; Local var1  
  ```  

---

### 4. **Key Instructions**  
| Instruction | Purpose                              | Example              |  
|-------------|--------------------------------------|----------------------|  
| `ENTER n,0` | Allocates `n` bytes for locals       | `enter 8,0`          |  
| `LEAVE`     | Restores ESP and EBP                 | `leave`              |  
| `LEA`       | Loads effective address              | `lea esi, [ebp-30]` |  
| `RET n`     | Returns and cleans `n` bytes from stack | `ret 8`          |  

---

### 5. **Procedure Directives**  
- **INVOKE**: Simplifies procedure calls by auto-pushing parameters:  
  ```assembly  
  INVOKE AddTwo, 5, 6   ; Replaces push 6; push 5; call AddTwo  
  ```  
- **PROC with Parameters**:  
  ```assembly  
  AddTwo PROC, val1:DWORD, val2:DWORD  
    mov eax, val1  
    add eax, val2  
    ret  
  AddTwo ENDP  
  ```  

---

### 6. **Recursion**  
- Each recursive call creates a new stack frame.  
- Example: Factorial calculation:  
  ```assembly  
  Factorial PROC  
    cmp eax, 0  
    je base_case  
    dec eax  
    call Factorial      ; Recursive call  
    inc eax  
    imul eax, [ebp+8]  ; Multiply result  
  base_case:  
    ret  
  Factorial ENDP  
  ```  

---

### 7. **Memory Models & Conventions**  
| Model  | Description                          |  
|--------|--------------------------------------|  
| **Flat** | Single 4GB segment (32-bit)         |  
| **Small** | 64KB code + 64KB data (16-bit)      |  

| Convention | Parameter Order | Stack Cleanup |  
|------------|------------------|----------------|  
| **STDCALL** | Right-to-left   | Callee         |  
| **C**       | Right-to-left   | Caller         |  

---

## Best Practices  
1. **Stack Balance**: Always clean parameters (e.g., `ret 8` for 2 DWORDs).  
2. **Register Preservation**: Use `pushad/popad` to save/restore registers.  
3. **Local Variables**: Prefer `LOCAL` directive for clarity.  
4. **Parameter Naming**: Use symbolic names (e.g., `x_param EQU [ebp+8]`).  

---

## Example Code Snippets  
### 1. Stack Frame Setup  
```assembly  
AddTwo PROC  
  enter 0, 0  
  mov eax, [ebp+12]   ; Second parameter  
  add eax, [ebp+8]    ; First parameter  
  leave  
  ret 8  
AddTwo ENDP  
```  

### 2. Array Processing (By Reference)  
```assembly  
ArrayFill PROC  
  push ebp  
  mov ebp, esp  
  mov esi, [ebp+12]   ; Array address  
  mov ecx, [ebp+8]    ; Array size  
  ; ... fill array ...  
  pop ebp  
  ret 8  
ArrayFill ENDP  
```  

### 3. Recursive Factorial  
```assembly  
Factorial PROC  
  cmp eax, 0  
  je base_case  
  push eax  
  dec eax  
  call Factorial  
  pop ebx  
  imul eax, ebx  
  ret  
base_case:  
  mov eax, 1  
  ret  
Factorial ENDP  
```  
