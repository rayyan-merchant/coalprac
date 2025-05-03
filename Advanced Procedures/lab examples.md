# Lab 10: Advanced Procedures - Short Notes  

## Key Concepts  
### 1. **Stack Frame Structure**  
- Used to manage parameters, return addresses, and local variables.  
- **EBP** (Base Pointer) anchors the stack frame.  
- Parameters are accessed via `[ebp + offset]`.  

### 2. **Parameter Passing**  
| Type          | Description                          | Example              |  
|---------------|--------------------------------------|----------------------|  
| **By Value**  | Pushes a copy of the value           | `push var1`          |  
| **By Reference** | Pushes the memory address         | `push OFFSET arr`    |  

### 3. **Key Instructions**  
| Instruction | Purpose                              | Example              |  
|-------------|--------------------------------------|----------------------|  
| `ENTER n,0` | Allocates `n` bytes for local variables | `enter 8,0`       |  
| `LEAVE`     | Releases stack frame                 | `leave`              |  
| `LEA`       | Loads effective address              | `lea esi, [ebp-30]` |  
| `LOCAL`     | Declares local variables             | `LOCAL temp:DWORD`   |  

---

## Coding Examples  

### **Example 1: AddTwo (By Value)**  
```assembly  
.data  
var1 DWORD 5  
var2 DWORD 6  

.code  
push var2  
push var1  
call AddTwo  

AddTwo PROC  
    push ebp  
    mov ebp, esp  
    mov eax, [ebp+12]   ; var2  
    add eax, [ebp+8]    ; var1  
    pop ebp  
    ret 8               ; Clean 2 parameters  
AddTwo ENDP  
```  

### **Example 2: Explicit Stack Parameters**  
```assembly  
y_param EQU [ebp+12]  
x_param EQU [ebp+8]  

AddTwo PROC  
    push ebp  
    mov ebp, esp  
    mov eax, y_param    ; var2  
    add eax, x_param    ; var1  
    pop ebp  
    ret  
AddTwo ENDP  
```  

### **Example 3: ArrayFill (By Reference)**  
```assembly  
.data  
arr WORD 10 DUP(?)  

.code  
push OFFSET arr  
push 10  
call ArrayFill  

ArrayFill PROC  
    push ebp  
    mov ebp, esp  
    mov esi, [ebp+12]   ; Array address  
    mov ecx, [ebp+8]    ; Count  
    ; ... fill array ...  
    pop ebp  
    ret 8  
ArrayFill ENDP  
```  

### **Example 4: LEA for Local Buffer**  
```assembly  
makeArray PROC  
    push ebp  
    mov ebp, esp  
    sub esp, 32         ; Allocate 32 bytes  
    lea esi, [ebp-30]   ; Local buffer address  
    ; ... fill buffer ...  
    add esp, 32         ; Clean locals  
    pop ebp  
    ret  
makeArray ENDP  
```  

### **Example 5: Manual Local Variables**  
```assembly  
MySub PROC  
    push ebp  
    mov ebp, esp  
    sub esp, 8          ; Allocate 8 bytes  
    mov [ebp-4], 10     ; Local var1  
    mov [ebp-8], 20     ; Local var2  
    mov esp, ebp        ; Clean locals  
    pop ebp  
    ret  
MySub ENDP  
```  

### **Example 6: ENTER/LEAVE Usage**  
```assembly  
AddTwo PROC  
    enter 0, 0          ; Setup stack frame  
    mov eax, [ebp+12]   ; var2  
    add eax, [ebp+8]    ; var1  
    leave               ; Clean stack frame  
    ret  
AddTwo ENDP  
```  

### **Example 7: LOCAL Directive**  
```assembly  
LocalProc PROC  
    LOCAL temp:DWORD  
    mov temp, 5         ; Initialize local variable  
    mov eax, temp  
    ret  
LocalProc ENDP  
```  

---

## Best Practices  
1. **Stack Balance**: Always clean parameters (e.g., `ret 8` for 2 DWORD parameters).  
2. **Register Preservation**: Use `pushad/popad` to save/restore registers in procedures.  
3. **Local Variables**: Use `LOCAL` for readability or manual allocation with `sub esp`.  
4. **Parameter Naming**: Define symbolic names (e.g., `x_param EQU [ebp+8]`) for clarity.  

These notes and examples cover stack frame management, parameter passing, and advanced procedure techniques in x86 assembly.
