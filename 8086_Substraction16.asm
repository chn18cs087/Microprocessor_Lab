
MOV AX,[1000H]
MOV BX,[1002H]
MOV CL,00H
SUB AX,BX 
MOV [1004H], AX
JNB jump
INC CL
jump:
MOV [1006H], CL
HLT