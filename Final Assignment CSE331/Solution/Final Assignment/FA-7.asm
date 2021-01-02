
.MODEL SMALL
.STACK 100H


.DATA
    PROMPT_1 DB 0AH,0DH, 'ENTER FIRST NUMBER : ',0DH,0AH,'$'
    PROMPT_2 DB 0AH,0DH, 'ENTER SECOND NUMBER: ',0DH,0AH,'$'
    PROMPT_3 DB 0AH,0DH, 'RESULT : ',0DH,0AH,'$'  
    PROMPT_4 DB 0AH,0DH, 'PRINT 1 OR 0: ',0DH,0AH,'$' 
    
    NUM1 DB ?
    NUM2 DB ?
    RESULT DB ? 
    CMP1 DW 15


MAIN PROC 
CODE SEGMENT
ASSUME DS:DATA CS:CODE
START:
    MOV AX,DATA
    MOV DS,AX  
    
    LEA DX,PROMPT_1
    MOV AH,9
    INT 21H    
    
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV NUM1,AL
    
    LEA DX,PROMPT_2
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV NUM2,AL
    
    MUL NUM1
    MOV RESULT,AL
    AAM       
    
    ADD AH,30H
    ADD AL,30H
    MOV BX,AX 
    
    LEA DX,PROMPT_3
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    INT 21H   
    
    MOV AH,2
    MOV DL,BL
    INT 21H   
      
    LEA DX,PROMPT_4
    MOV AH,9
    INT 21H 
    
    CMP BX,CMP1
    
    JL DOWN
    JG UP
    
    
UP:
    MOV DL, '1'
    JMP @DISPLAY
DOWN:
    MOV DL, '0'
    JMP @DISPLAY    

@DISPLAY: 
    MOV AH, 2 
    INT 21H      
    
    
    MOV AH,4CH
    INT 21H
ENDS
END START