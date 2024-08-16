//Multiplies numbers stored in Register 0 and Register 1
//and stores output in Register 2
@R2
M=0

(loop)
    @R0
    D=M
    M=M-1
    @end
    D;JEQ

    @R1
    D=M
    @R2
    M=D+M

    @loop
    0;JMP

(end)
@end
0;JMP
