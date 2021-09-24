.MODEL SMALL
.STACK 64
PRINT MACRO ARG
    LEA DX,ARG
    MOV AH,09H
    INT 21H
ENDM

DATA SEGMENT   
    N DB ?
    MSG1 DB 0AH,0DH,"ENTER THE STRING:$"
    MSG2 DB 0AH,0DH,"THE STRING IS PALINDROME$"
    MSG3 DB 0AH,0DH, "THE STRING IS NOT PALINDROME$"
    STR1 DB 20 DUP(?)
    STR2 DB 20 DUP(?)
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA

START:MOV AX,DATA
      MOV DS,AX
      
      LEA SI,STR1
      LEA DI,STR2
      MOV CL,00H
      PRINT MSG1
      
      RDCHAR:MOV AH,01H
      INT 21H
      CMP AL,0DH
      JZ LOOP1
      MOV [SI],AL
      INC SI
      INC CL
      JMP RDCHAR
     
      LOOP1:MOV N,CL
      MOV CL,00H
      DEC SI
      
      UP:CMP CL,N
      JZ CHECK
      MOV AL,[SI]
      MOV [DI],AL
      DEC SI
      INC CL
      INC DI
      JMP UP
      
      CHECK:LEA SI,STR1
      LEA DI,STR2
      MOV CL,00H
      
      UP1:CMP CL,N
      JZ PAL
      MOV AL,[SI]
      CMP AL,[DI]
      JNZ NOTPAL
      INC SI
      INC DI
      INC CL
      JMP UP1
      
      NOTPAL:PRINT MSG3
      JMP EXIT
      
      PAL:PRINT MSG2
      
      EXIT:MOV AH,4CH
      INT 21H
END START
CODE ENDS   
