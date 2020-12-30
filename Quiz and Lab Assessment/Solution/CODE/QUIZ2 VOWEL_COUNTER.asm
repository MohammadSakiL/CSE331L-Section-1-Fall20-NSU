.MODEL SMALL
 .STACK 100H

 .DATA
   PROMPT_1  DB  'PLEASE ENTER A STRING : $'
   PROMPT_2  DB  0DH,0AH,'TOTAL NUMBER OF VOWEL IN THE STRING:  $'
   

   STRING        DB  50 DUP (?)   
   C_VOWELS      DB  'AEIOU'
   S_VOWELS      DB  'aeiou'

 .CODE
 MAIN PROC
     MOV AX, @DATA               
     MOV DS, AX
     MOV ES, AX

     LEA DX, PROMPT_1             
     MOV AH, 9
     INT 21H

     LEA DI, STRING               

                    

     XOR DX, DX                   
     LEA SI, STRING             

     OR BX, BX                    
     JE @EXIT                     

     @COUNT:                    
       LODSB                     

       LEA DI, C_VOWELS          
       MOV CX, 5                 

       REPNE SCASB                
       JE @INCREMENT_VOWELS      
                                  

       LEA DI, S_VOWELS           
       MOV CX, 5                  

       REPNE SCASB                
       JE @INCREMENT_VOWELS       
                                  

       JMP @NEXT                  

       @INCREMENT_VOWELS:        
         INC DL                   
         JMP @NEXT                

       @NEXT:                     
         DEC BX                  
         JNE @COUNT              

       @EXIT:                 

     MOV CX, DX                 

     LEA DX, PROMPT_2            
     MOV AH, 9                     
     INT 21H                       

     XOR AX, AX                  
     MOV AL, CL                   
                    


     XOR AX, AX                   
     MOV AL, CH                   

                     

     MOV AH, 4CH                  
     INT 21H
   MAIN ENDP


