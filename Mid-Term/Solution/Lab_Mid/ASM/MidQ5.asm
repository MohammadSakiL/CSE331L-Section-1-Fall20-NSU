
.MODEL SMALL
.STACK 100H
.DATA

A DB 1,1,2,2,3,3
B DB 6 DUP(0) 

.CODE 
MAIN PROC
        
 MOV AX, @DATA
 MOV DS, AX
              
 MOV AL  , A[5]   
 MOV B[0], AL 
 
 MOV AL  , A[4]   
 MOV B[1], AL
 
 MOV AL  , A[3]   
 MOV B[2], AL
 
 MOV AL  , A[2]   
 MOV B[3], AL
 
 MOV AL  , A[1]   
 MOV B[4], AL
 
 MOV AL  , A[0]   
 MOV B[5], AL
 
 
             
 MOV AH, 4CH 
 INT 21H
 MAIN ENDP
END MAIN




