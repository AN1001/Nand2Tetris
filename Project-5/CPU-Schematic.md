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
  - The 3 ```d``` bits where the ALU output should be stored D register, A register or M (written to memory)
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

if C instruction then
  - Check if ALU output should be sent to the A-register
  - This is in the data section of the C-instruction
