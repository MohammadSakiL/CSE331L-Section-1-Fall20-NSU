
.MODEL SMALL
.STACK 100H

.DATA
PROMPT_1  DB  "ENTER A NUMBER1 : $"
PROMPT_2  DB  "ENTER A NUMBER2 : $"
PROMPT_3  DB  "SMALLEST ONE : $" 


.CODE
MAIN PROC
   MOV AX, @DATA                 
   MOV DS, AX

   LEA DX, PROMPT_1                
   MOV AH, 9
   INT 21H

   MOV AH,1
   INT 21H
   
   MOV BL, AL
   
   MOV AH, 2
   MOV DL, 0DH
   INT 21H
   
   MOV DL,0AH
   INT 21H
   
   MOV DL,0AH
   INT 21H      
   
   LEA DX, PROMPT_2                
   MOV AH, 9
   INT 21H
   
   MOV AH, 1
   INT 21H
   
   MOV BH, AL
   MOV AH,2
   MOV DL,0DH
   INT 21H
   MOV DL,0AH
   INT 21H  
   
   LEA DX, PROMPT_3
   MOV AH, 9
   INT 21H
   
   CMP BL,BH
   
   
   JNBE @ELSE                   
    MOV DL, BL                  
    JMP @DISPLAY                

   @ELSE:                    
     MOV DL, BH               

   @DISPLAY:                 
     MOV AH, 2                 
     INT 21H
   
     MOV AH, 4CH                 
     INT 21H
   MAIN ENDP
 END MAIN



