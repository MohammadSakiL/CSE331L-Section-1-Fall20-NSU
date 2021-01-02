.MODEL SMALL
.STACK 100H

.DATA 
    STRING DB ?
    SYS DB 'S'
    VOWEL DB 'S'

    INPUT_USER DB  0AH,0DH, 'ENTER A STRING: ',0DH,0AH,'$'
    OUTPUT_M DB 0AH,0DH, 'TOTAL VOWEL: ',0DH,0AH,'$'
    
.CODE
MAIN PROC
     MOV AX, @DATA
    MOV DS, AX
    
    MOV DX, OFFSET INPUT_USER
    MOV AH, 09
    INT 21H  
    
    LEA SI, STRING    
    
    
    
INPUT: MOV AH, 1
       INT 21H
       
       MOV [SI], AL
       INC SI
       
       CMP AL, 0DH
       JNZ INPUT 
       
       MOV AL, SYS
       MOV [SI], '$'  
       
       MOV SI, OFFSET STRING  
       
       MOV BL, 00
       
       
BACK: 
      MOV AL, [SI]
      CMP AL,'$'
      JZ FINAL
      CMP AL,'A'
      JZ COUNT   
      CMP AL,'E'
      JZ COUNT   
      CMP AL,'I'
      JZ COUNT   
      CMP AL,'O'
      JZ COUNT   
      CMP AL,'U'
      JZ COUNT
      CMP AL,'a'
      JZ COUNT   
      CMP AL,'e'
      JZ COUNT   
      CMP AL,'i'
      JZ COUNT   
      CMP AL,'o'
      JZ COUNT   
      CMP AL,'u'
      JZ COUNT   
      INC SI
      JMP BACK  
       
COUNT: 
     INC BL
     MOV VOWEL, BL
     INC SI
     JMP BACK        
     
      
     
  FINAL:
     LEA DX, OUTPUT_M
     MOV AH, 9
     INT 21H    
     MOV AH, 2
     MOV DL, VOWEL
     INT 21H
     MOV AH, 4CH
     INT 21H   
    

    
        
MAIN ENDP
END MAIN