# Lab 08: Conditional Processing - Summary Notes

## Key Concepts

### 1. Boolean Instructions
| Instruction | Operation | Effect on Flags |
|------------|-----------|-----------------|
| AND        | Bitwise AND | Clears CF, OF; sets SF, ZF, PF |
| OR         | Bitwise OR  | Clears CF, OF; sets SF, ZF, PF |
| XOR        | Bitwise XOR | Clears CF, OF; sets SF, ZF, PF |
| NOT        | Bitwise NOT | No flags affected |
| TEST       | AND without storing | Clears CF, OF; sets SF, ZF, PF |

### 2. Comparison Instruction (CMP)
- Performs implied subtraction (dest - src)
- Flags affected:
  - **Unsigned**: ZF, CF
  - **Signed**: ZF, SF, OF

### 3. Conditional Jumps

### Jumps Based on Flag Values

| Mnemonic | Description                | Flags / Registers |
|----------|----------------------------|-------------------|
| JZ       | Jump if zero               | ZF = 1            |
| JNZ      | Jump if not zero           | ZF = 0            |
| JC       | Jump if carry              | CF = 1            |
| JNC      | Jump if not carry          | CF = 0            |
| JO       | Jump if overflow           | OF = 1            |
| JNO      | Jump if not overflow       | OF = 0            |
| JS       | Jump if signed             | SF = 1            |
| JNS      | Jump if not signed         | SF = 0            |
| JP       | Jump if parity (even)      | PF = 1            |
| JNP      | Jump if not parity (odd)   | PF = 0            |

### Jumps Based on Equality

| Mnemonic | Description                          |
|----------|--------------------------------------|
| JE       | Jump if equal (leftOp = rightOp)     |
| JNE      | Jump if not equal (leftOp ≠ rightOp) |
| JCXZ     | Jump if CX = 0                       |
| JECXZ    | Jump if ECX = 0                      |




### Jumps Based on Unsigned Comparisons

| Mnemonic | Description                          | Equivalent To |
|----------|--------------------------------------|---------------|
| JA       | Jump if above (leftOp > rightOp)     | JNBE          |
| JNBE     | Jump if not below or equal           | JA            |
| JAE      | Jump if above or equal (leftOp ≥ rightOp) | JNB       |
| JNB      | Jump if not below                    | JAE           |
| JB       | Jump if below (leftOp < rightOp)     | JNAE          |
| JNAE     | Jump if not above or equal           | JB            |
| JBE      | Jump if below or equal (leftOp ≤ rightOp) | JNA       |
| JNA      | Jump if not above                    | JBE           |

### Jumps Based on Signed Comparisons

| Mnemonic | Description                          | Equivalent To |
|----------|--------------------------------------|---------------|
| JG       | Jump if greater (leftOp > rightOp)   | JNLE          |
| JNLE     | Jump if not less than or equal       | JG            |
| JGE      | Jump if greater than or equal (leftOp ≥ rightOp) | JNL       |
| JNL      | Jump if not less                     | JGE           |
| JL       | Jump if less (leftOp < rightOp)      | JNGE          |
| JNGE     | Jump if not greater than or equal    | JL            |
| JLE      | Jump if less than or equal (leftOp ≤ rightOp) | JNG       |
| JNG      | Jump if not greater                  | JLE           |
## Coding Examples

### Example 1: Basic Conditional
```assembly
mov eax, var1
cmp eax, var2
jae L1          ; Jump if var1 >= var2 (unsigned)
mov result, ebx
L1:
```

### Example 2: Finding Minimum Value
```assembly
mov eax, var1
cmp eax, var2
jbe L1          ; Jump if var1 <= var2
mov eax, var2
L1:
cmp eax, var3
jbe L2          ; Jump if current min <= var3
mov eax, var3
L2:
```

### Example 3: While Loop Implementation
```assembly
mov eax, 0      ; Initialize counter
while_loop:
cmp eax, 10
jae end_while   ; Exit if eax >= 10
inc eax         ; Loop body
jmp while_loop
end_while:
```

### Example 4: Compound Condition (AND)
```assembly
cmp al, bl      ; First condition
ja check_second
jmp next
check_second:
cmp bl, cl      ; Second condition
ja both_true
jmp next
both_true:
mov X, 1
next:
```

### Example 5: Compound Condition (OR)
```assembly
cmp al, bl      ; First condition
ja set_true
cmp bl, cl      ; Second condition
jbe next
set_true:
mov X, 1
next:
```

## Key Takeaways

1. **Conditional Processing** in assembly uses:
   - Boolean operations (AND, OR, XOR, NOT, TEST)
   - Comparison instruction (CMP)
   - Conditional jumps based on flag states

2. **Control Structures** are implemented using:
   - Conditional jumps for IF-THEN-ELSE
   - Loops with conditional jumps (WHILE, FOR)
   - Compound conditions with sequential checks

3. **Important Notes**:
   - Signed vs unsigned comparisons use different jump instructions
   - TEST is useful for checking specific bits without modification
   - LOOPZ/LOOPNZ provide additional loop control beyond simple counters

