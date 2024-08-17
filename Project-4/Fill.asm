//;Fills screen if key pressed, white if not
(start)
@i
M=0

(loop)
    @i
    D=M
    M=M+1
    @8192
    D=D-A
    @start
    D;JEQ

    @KBD
    D=M
    @nopr
    D;JGT

    @i
    D=M
    @SCREEN
    A=D+A
    M=0
    @loop
    0;JMP

    (nopr)
    @i
    D=M
    @SCREEN
    A=D+A
    M=-1

    @loop
    0;JMP
