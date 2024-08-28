## My notes on how the (HACK) CPU operates

### C-instruction
```bash
111[a][c1][c2][c3][c4][c5][c6][d1][d2][d3][j1][j2][j3]
```
  - First bit defines C-instruction
  - Next 2 bits are null (unused)
  - ```a``` bit defines whether ALU should perform calculations using M register or A register
  - The 6 ```c``` bits define the computations that the ALU should perform (zx, ng, zy, ny, f, no)
    - (zx) zero x
    - (nx) negate x
    - (zy) zero y
    - (ny) negate y
    - (f) should computer x&y or x+y
    - (no) negate output
  - The 3 ```d``` bits where the ALU output should be stored A register, D register or M (written to memory)
  - The 3 ```j``` bits specify jump conditions: Jump if ALU ouput is negative, Equal to zero, Positive

Alltogether a typical C-instruction may look like this:
```bash
111 0 101110 010 000
```
Spaces for clarity only

### CPU Design
Get type of instruction (from first bit)
  - A-instruction
  - C-instruction

If C instruction then
  - Check if ALU output should be sent to the A-register
  - This is in the data section of the C-instruction (d1 more specifically)

What goes into A register?
  - If [d2] then ALU output should go into A register and if C-instruction
  - Else if A-instruction then the whole instruction itself

What to load into ALU?
  - The ALU takes 2 inputs x and y
  - y will be A or M as decided by the [a] bit
  - D always

What goes into D register?
  - If C-instruction and [d2]
  - Then load ALU output into D register

Compute ALU:
  - Takes in inputs (x, y, instruction)
  - Set output of ALU to outM
  - Set Address M to 0..14 of A register
  - if C instruction and bit [d3] active (write to memory) then set writeM = true

### Program Counter (PC)
let A be ALU output is zero and Jump if equal to zero is true (JEQ [j1])

let B be ALU output is negative and Jump if negative is true (JNG [j2])

let C be ALU output is positve and Jump if positive is true (JGT [j3])

Jump if (A or B or C) which means to load PC with memory address at A register only if C-instruction
Only increment if not loading, and reset if reset pin active
