//Adds numbers 1-100
@i
M=0
@sum
M=0

(loop)
    @i
    M=M+1
    D=M
    @100
    D=D-A
    @void
    D;JGT

    @i
    D=M
    @sum
    M=D+M

    @loop
    0;JMP

(void)
@void
0;JMP
