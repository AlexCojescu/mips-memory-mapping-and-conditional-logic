# MIPS Architecture: Pseudoinstruction Decomposition, Data Alignment & Bitwise Sifting

This module explores memory segmentation, pseudoinstruction expansion rules, and bitwise logic operations in MIPS32 assembly. It showcases how high-level programmatic workflows—such as string formatting arrays, array addresses, conditional branching matrices, and integer parity filters—translate into raw machine code states inside simulated hardware environments.

## 📂 Repository Architecture

The codebase features three specialized assembly modules along with an analytical architectural trace log:

### 1. Architectural Memory Mapping (`fib.s`)
A foundational mathematical engine used to explore memory layout configurations.
* **Telemetry Diagnostics:** Serves as the primary trace template for mapping execution bounds across isolated program memory fields.
* **Sequence Loop:** Computes numeric values by updating register indices incrementally while using standard decrement loops to control iterations.

### 2. Multi-Branch Boundary Evaluation (`compare.s`)
An interactive input-matching program executing comparative logic with minimal primitives.
* **Reduced Instruction Contractions:** Implements relational evaluations ($<$, $\le$, $>$, $\ge$) using an optimal hardware-level subset limited to Set-Less-Than (`slt`) and Branch-On-Equal (`beq`) operations.
* **Hardware Slicing:** Demonstrates variable mapping rules by swapping code branches to flip comparison directions, verifying how the compiler handles bounds testing.

### 3. Bit-Shift Parity Sifter (`sumAll.s`)
An advanced math pipeline performing running accumulations based on odd or even bitwise verification.
* **Arithmetic Shift Traps:** Replaces high-overhead division and modulo operations by checking the Least Significant Bit (LSB) using directional bit shifts.
* **Sifting Sequence:** Drops the integer down by shifting right arithmetically (`sra`), shifts it back up logically (`sll`), and runs value-matching tests to instantly identify odd/even states:
  ```assembly
  sra $t1, $t0, 1     # Shift right (drop LSB)
  sll $t1, $t1, 1     # Shift left (restore structure with trailing 0)
  beq $t0, $t1, is_even
