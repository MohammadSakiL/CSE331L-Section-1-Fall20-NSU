

  
.MODEL SMALL
.STACK 100H


.DATA

    NUM1 DW 15
    NUM2 DW 40
    LCM DW ?

MAIN PROC 
CODE SEGMENT
    ASSUME DS:DATA CS:CODE
START:
    MOV AX,DATA
    MOV DS,AX
    MOV AX,NUM1
    MOV BX,NUM2
WHILE:
    MOV DX,0
    MOV CX,BX
    DIV BX
    MOV BX,DX
    MOV AX,CX
    CMP BX,0
JNE WHILE
    MOV AX,NUM1
    MOV BX,NUM2
    MUL BX
    DIV CX
    MOV LCM,AX

    MOV AH,4CH
    INT 21H
ENDS
END START






