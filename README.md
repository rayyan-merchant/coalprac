### **1. `jnz` Instruction:**

* **`jnz`** stands for **Jump if Not Zero**.
* It's a conditional jump instruction that causes the program to jump to a specified label if the **zero flag (ZF)** is **not set** (meaning the result of the previous operation was not zero).

The general form is:

```asm
jnz label
```

* If the **zero flag** is clear (ZF = 0), then the jump will happen.
* If ZF = 1 (which means the previous operation resulted in zero), the jump is **not taken**, and the program continues sequentially.

For example:

```asm
cmp eax, 0   ; compare eax to 0
jnz label    ; jump to label if eax is not zero
```

### **2. JMP Instructions and Variants:**

The **`jmp`** instruction is an unconditional jump. It will always jump to a specified label or address.

#### Syntax:

```asm
jmp label
```

* The program execution will jump to the label, skipping over any instructions in between.
* This is always an **unconditional jump** — meaning, it will happen **no matter what**.

#### Conditional Jump Instructions:

In addition to `jnz`, there are several other jump instructions that depend on different **flags** set by prior instructions.

Here’s a list of some of the **most common conditional jump instructions**:

* **`je` (Jump if Equal) / `jz` (Jump if Zero):**

  * Jumps if the **Zero Flag (ZF)** is set (the comparison was equal).
  * Example: `cmp eax, ebx; je equal_case;`

* **`jne` (Jump if Not Equal) / `jnz` (Jump if Not Zero):**

  * Jumps if the **Zero Flag (ZF)** is not set (the comparison was not equal).
  * Example: `cmp eax, ebx; jne not_equal_case;`

* **`jg` (Jump if Greater):**

  * Jumps if **ZF = 0** (not zero) and **SF = OF** (signed comparison).
  * Example: `cmp eax, ebx; jg greater_case;`

* **`jl` (Jump if Less):**

  * Jumps if **SF ≠ OF** (signed comparison).
  * Example: `cmp eax, ebx; jl less_case;`

* **`ja` (Jump if Above):**

  * Jumps if the **Carry Flag (CF)** is clear and **Zero Flag (ZF)** is clear (unsigned comparison).
  * Example: `cmp eax, ebx; ja above_case;`

* **`jb` (Jump if Below):**

  * Jumps if the **Carry Flag (CF)** is set (unsigned comparison).
  * Example: `cmp eax, ebx; jb below_case;`

* **`je` (Jump if Equal) / `jz` (Jump if Zero):**

  * Jumps if the **Zero Flag (ZF)** is set (i.e., operands were equal).
  * Example: `cmp eax, ebx; je equal_case;`

#### Conditional Jump Variants:

* **`jz`** and **`je`**: Jump if zero (same condition).
* **`jnz`** and **`jne`**: Jump if not zero (same condition).
* **`jg`** and **`jge`**: Jump if greater or greater or equal (signed comparison).
* **`jl`** and **`jle`**: Jump if less or less or equal (signed comparison).

### **3. How to Ensure a Label is Entered Only If a Condition Is Met**

To ensure that a block of code (a label) is entered only if a certain condition is met, you use **conditional jump instructions**.

Here's an example where a label is only entered if the comparison result is "not equal":

```asm
cmp eax, ebx      ; Compare eax and ebx
jne label_not_equal ; Jump to label_not_equal if eax != ebx
; code here will only run if eax == ebx
label_not_equal:
    ; code here will run only if eax != ebx
```

#### Example for using `jnz`:

```asm
mov eax, 10
cmp eax, 0       ; Compare eax with 0
jnz not_zero     ; Jump to 'not_zero' label if eax != 0 (i.e., eax is not zero)
; code here if eax == 0
not_zero:
; code here if eax != 0
```

This way, you ensure that certain blocks of code are **only executed if a specific condition** is met.

### **Putting It All Together:**

If you wanted to make sure that a block of code executes **only if** a certain condition is met, here’s how you would structure the program:

```asm
mov eax, 5
cmp eax, 0           ; Compare eax to 0
jne not_zero         ; Jump to 'not_zero' if eax is not zero

; Code here runs if eax == 0 (zero condition)
jmp done              ; Unconditional jump to skip 'not_zero' section

not_zero:
; Code here runs if eax != 0

done:
; Rest of the code
```

In this structure:

* **`jne not_zero`** ensures the jump happens only if `eax` is not zero.
* **`jmp done`** skips over the code block under `not_zero` if the condition is false.

---

### In Summary:

* **`jnz`** jumps if the **Zero Flag (ZF)** is **not set** (i.e., the result was non-zero).
* **Unconditional jump (`jmp`)** always jumps to a label.
* **Conditional jumps** (e.g., `jne`, `je`, `jg`) are used to execute code only if specific conditions are met based on the flags set by previous instructions.


