
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

A DB 5 DUP(?)
MOV BX,OFFSET ARRO
MOV [BX] ,1       
MOV [BX+1] ,2
MOV [BX+2] ,3
MOV [BX+3] ,4
MOV [BX+4] ,5


ret




