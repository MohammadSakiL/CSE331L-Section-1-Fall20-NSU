
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; AL 27H and AL 35H
MOV AL,27H
MOV BL,35H        
ADD AL,BL
DAA

ret




