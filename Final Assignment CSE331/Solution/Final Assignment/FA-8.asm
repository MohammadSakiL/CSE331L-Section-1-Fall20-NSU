DATA SEGMENT   
    
        PROMPT_1 DB 0AH,0DH, 'ENTER A STRING: ',0DH,0AH,'$'
        PROMPT_2 DB 0AH,0DH, 'REVERSE ORDER OF YOUR INPUT : ',0DH,0AH,'$'
        PROMPT_3 DB 0AH,0DH, 'YOUR STRING IS STRING: ',0DH,0AH,'$'
        
        STR_1 DB 40 DUP("$")
        STR_2 DB 40 DUP("$")     
        
        PALIN DB 0AH,0DH, 'STRING IS PALINDROM ',0DH,0AH,'$'
        NOT_PALIN DB 0AH,0DH, 'STRING IS NOT PALINDROM ',0DH,0AH,'$' 
      
DATA ENDS

CODE SEGMENT
        ASSUME DS:DATA,CS:CODE
START:

        MOV AX,DATA
        MOV DS,AX

        LEA SI,STR_1


        MOV AH,09H
        LEA DX,PROMPT_1
        INT 21H

        MOV AH,0AH
        MOV DX,SI
        INT 21H

        MOV AH,09H
        LEA DX,PROMPT_3
        INT 21H

        MOV AH,09H
        LEA DX,STR_1+2
        INT 21H

        MOV AH,09H
        LEA DX,PROMPT_2
        INT 21H

        MOV CL,STR_1+1
        ADD CL,1
        ADD SI,2

     L1:
        INC SI

        CMP BYTE PTR[SI],"$"
        JNE L1

        DEC SI

        LEA DI,STR_2

     L2:MOV AL,BYTE PTR[SI]

        MOV BYTE PTR[DI],AL

        DEC SI
        INC DI
        LOOP L2


        MOV AH,09H
        LEA DX,STR_2
        INT 21H        
        
        LEA SI,STR_1
        LEA DI,STR_2


        ADD SI,2

     L3:
        MOV BL,BYTE PTR[DI]


        CMP BYTE PTR[SI],BL
        JNE L4


        INC SI
        INC DI

        MOV BL,BYTE PTR[DI]

        MOV AH,02H
        MOV DL,BL
        INT 21H

    
        CMP BYTE PTR[DI],"$"
        JNE L3



        MOV AH,09H
        LEA DX,PALIN
        INT 21H

        JMP EXIT

     L4:


        MOV AH,09H
        LEA DX,NOT_PALIN
        INT 21H
        
        
      EXIT:

        MOV AH,4CH
        INT 21H

CODE ENDS
END START



