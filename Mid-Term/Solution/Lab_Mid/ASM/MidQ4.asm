
.MODEL SMALL
.STACK 100H
.DATA



.CODE 
MAIN PROC
        
 MOV AX, @DATA
 MOV DS, AX
              

 
 MOV CX ,5
 
 MOV AH,2
 MOV DL, 42
 @LOOP:
     INT 21H
     DEC CX
 JNZ @LOOP     
     
 
 
             
 MOV AH, 4CH 
 INT 21H
 MAIN ENDP
END MAIN

