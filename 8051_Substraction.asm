MOV DPTR,#1000H
MOVX A,@DPTR
MOV R1,A
INC DPTR
MOVX A,@DPTR
XCH A,R1
MOV R0,#00H
CLR C
SUBB A, R1
JNC Jump
CPL A
INC A
INC R0
Jump:
INC DPTR
MOVX @DPTR,A
INC DPTR
MOV A,R0
MOVX @DPTR,A
HALT:SJMP HALT
END