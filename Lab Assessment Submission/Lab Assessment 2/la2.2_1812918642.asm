
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
A EQU 1    
B EQU 2
C EQU 3
D EQU 4

MOV AX,A
ADD AX,B
ADD AX,C
ADD AX,D
MOV BX,AX


ret




