
.MODEL SMALL

.DATA
.CODE
 MAIN PROC
           MOV AX,@DATA
           MOV DX,AX  
           
           MOV AX, 0
           MOV BX, 1
           
           MOV CX, 8
           
           MOV DX , AX
           
           MOV DX, BX
           
       FIBO:
            MOV DX,AX
            ADD DX,BX
            
            MOV AX,BX
            MOV BX,DX 
            
            MOV AH, 2
            MOV DL,BL
            INT 21H
       

           MOV AX,4C00H
           INT 21H

MAIN ENDP
END MAIN



