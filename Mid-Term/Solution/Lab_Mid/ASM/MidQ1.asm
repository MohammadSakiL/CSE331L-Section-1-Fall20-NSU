.MODEL SMALL
.STACK 100H

.DATA
 PROMPT_1 DB "ENTER INTEGER 1: $"
 PROMPT_2 DB "ENTER INTEGER 2: $"  
 PROMPT_3 DB "MUL OF THE INTEGER: $"   
 
 VALUE_1 DB ?
 VALUE_2 DB ?
 RESULT DB  ?
 
 .CODE
 MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, PROMPT_1
    MOV AH, 9
    INT 21H      
    
    
    MOV AH, 1
    INT 21H  
    
    SUB AL,30H
    MOV VALUE_1, AL
                     
                     
    LEA DX, PROMPT_2
    MOV AH, 9
    INT 21H      
    
    
    MOV AH, 1
    INT 21H  
    
    SUB AL,30H
    MOV VALUE_2, AL 
    
    MUL VALUE_1
    MOV RESULT,AL
    AAM
    
    ADD AH,30H
    ADD AL,30H
    
    MOV BX,AX
    
    LEA DX, PROMPT_3
    MOV AH, 9
    INT 21H 
    
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    
     
    MOV AH, 4CH  
    INT 21H
 MAIN ENDP
END MAIN 