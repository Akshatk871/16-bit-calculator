.MODEL SMALL
.STACK 100H
.DATA

;The string to be printed
MENU DB ,0AH,0DH,'1. Addition ',0AH,0DH,'2. Subtraction',0AH,0DH,'3. Multiplication',0AH, 0DH,'4. Division',0AH, 0DH,'5. Logical AND', 0DH, 0AH, '6. Logical OR', 0DH, 0AH
            DB '7. Logical XOR', 0DH, 0AH, '8. Logical NOT', 0DH, 0AH, '9. Decimal to Binary', 0DH, 0AH
            DB 'A. Decimal to Octal', 0DH, 0AH, 'B. Decimal to Octal', 0DH, 0AH, 'Enter your Choice: $' 
CHOICE DW 0
OPRND1 DW 0
OPRND2 DW 0 
RESULT DW 0
DECIMAL DW 0   

MES1 DB ,0AH,0DH, 'Enter the first number: $'
MES2 DB ,0AH,0DH, 'Enter the second number: $'  
MES3 DB ,0AH,0DH, 'Result: $'

.CODE
MAIN PROC FAR
MOV AX,@DATA
MOV DS,AX

; load address of the string
LEA DX,MENU

;output the string
;loaded in dx
MOV AH,09H
INT 21H
     
MOV AH, 1               ;single character input
INT 021H                ;take input
MOV CHOICE, AX              ;the input from keyboard is stored in AL, we temporarily
                            ;store it in BL

MOV AX, CHOICE

CMP AL, '1'
JE ADDITION

CMP AL, '2'
JE SUBTRACTION 

CMP AL, '3'
JE MULTIPLICATION

CMP AL, '4'
JE DIVISION

CMP AL, '5'
JE lOGICALAND

CMP AL, '6'
JE LOGICALOR

CMP AL, '7'
JE LOGICALXOR

CMP AL, '8'
JE LOGICALNOT

CMP AL, '9'
JE TOBINARY



CMP AL, 'A'
JE TOOCTAL 

CMP AL, 'B'
JE TOHEXA

ADDITION: 
    LEA DX, MES1
    MOV AH, 09H
    INT 21H
    MOV AH, 1               
    INT 021H 
    SUB AX, 48               
    MOV OPRND1, AX
    
    LEA DX, MES2
    MOV AH, 09H
    INT 21H
    MOV AH,1
    INT 21H    
    SUB AX, 48
    MOV OPRND2, AX
    
    MOV AX, OPRND1
    MOV BX, OPRND2
                   
                   
    ADD AX,BX 
    ADD AX, 48
    MOV RESULT, AX 
    JMP PRINTRES  
    JMP EXIT
       
SUBTRACTION:
    LEA DX, MES2
    MOV AH, 09H
    INT 21H
    MOV AH, 1               
    INT 021H 
    SUB AX, 48               
    MOV OPRND1, AX
    
    LEA DX, MES2
    MOV AH, 09H
    INT 21H
    MOV AH,1
    INT 21H 
    SUB AX, 48
    MOV OPRND2, AX
    
    MOV AX, OPRND1
    MOV BX, OPRND2
    
    SUB AX,BX
    ADD AX, 48
    MOV RESULT, AX   
    
    JMP PRINTRES  
    JMP EXIT

MULTIPLICATION:
    LEA DX, MES1
    MOV AH, 09H
    INT 21H
    MOV AH, 1               
    INT 021H 
    SUB AX,48               
    MOV OPRND1, AX
    
    LEA DX, MES2
    MOV AH, 09H
    INT 21H
    MOV AH,1
    INT 21H 
    SUB AX,48
    MOV OPRND2, AX
    
    MOV AX, OPRND1
    MOV BX, OPRND2 
    
    MUL BX 
    ADD AX, 48
    MOV RESULT, AX
    JMP PRINTRES  
    JMP EXIT

DIVISION:
    LEA DX, MES1
    MOV AH, 09H
    INT 21H
    MOV AH, 1               
    INT 021H 
    SUB AX, 48               
    MOV OPRND1, AX
    
    LEA DX, MES2
    MOV AH, 09H
    INT 21H
    MOV AH,1
    INT 21H
    SUB AX, 48
    MOV OPRND2, AX
    
    MOV AX, OPRND1
    MOV BX, OPRND2
    
    DIV BX
    ADD AX, 48
    MOV RESULT, AX 
    
    JMP PRINTRES  
    JMP EXIT
LOGICALAND:
    LEA DX, MES1
    MOV AH, 09H
    INT 21H
    MOV AH, 1               
    INT 021H 
    SUB AX,48               
    MOV OPRND1, AX
    
    LEA DX, MES2
    MOV AH, 09H
    INT 21H
    MOV AH,1
    INT 21H 
    SUB AX,48
    MOV OPRND2, AX
    
    MOV AX, OPRND1
    MOV BX, OPRND2  
    AND AX,BX 
    ADD AX, 48
    MOV RESULT, AX
    
    JMP PRINTRES
    JMP EXIT
    
LOGICALOR:
    LEA DX, MES1
    MOV AH, 09H
    INT 21H
    MOV AH, 1               
    INT 021H 
    SUB AX, 48               
    MOV OPRND1, AX
    
    LEA DX, MES2
    MOV AH, 09H
    INT 21H
    MOV AH,1
    INT 21H 
    SUB AX, 48
    MOV OPRND2, AX
    
    MOV AX, OPRND1
    MOV BX, OPRND2  
    OR AX,BX 
    ADD AX, 48
    MOV RESULT, AX  
    
    
    JMP PRINTRES
    JMP EXIT

LOGICALXOR:
    LEA DX, MES1
    MOV AH, 09H
    INT 21H
    MOV AH, 1               
    INT 021H 
    SUB AX, 48               
    MOV OPRND1, AX
    
    LEA DX, MES2
    MOV AH, 09H
    INT 21H
    MOV AH,1
    INT 21H
    SUB AX, 48
    MOV OPRND2, AX
    
    MOV AX, OPRND1
    MOV BX, OPRND2  
    XOR AX,BX    
    ADD AX, 48
    MOV RESULT, AX
    
    JMP PRINTRES
    JMP EXIT            

LOGICALNOT:
    LEA DX, MES1
    MOV AH, 09H
    INT 21H
    MOV AH, 1               
    INT 021H 
    SUB AX, 48               
    MOV OPRND1, AX
    
    MOV AX, OPRND1
    NOT AX  
    ADD AX, 48
    MOV RESULT, AX
    
    JMP PRINTRES
    JMP EXIT    
TOBINARY:
    LEA DX, MES1
    MOV AH, 09H
    INT 21H
    MOV AH, 1               
    INT 021H
    SUB AX, 48
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    MOV BX, 2
    XOR CX, CX
  
    L7:
      XOR DX, DX
      DIV BX
      PUSH DX
      INC CX
      OR AX, AX
      JNE L7
  
    L8:
      POP DX
      ADD DL, '0'
      MOV AH, 2
      INT 21H
      LOOP L8
  
    POP DX
    POP CX
    POP BX
    POP AX 
    JMP EXIT
   
;TODECIMAL:
;    LEA DX, MES1
;    MOV AH, 09H
;    INT 21H
;    MOV AH, 1               
;    INT 021H
;    SUB AX, 48
;    ;    PUSH AX
;    ;PUSH BX
;    ;PUSH CX
;    ;PUSH DX
;    ;XOR AX, AX
;    ;XOR CX, CX
;    ;
;    ;L1:
;    ;  XOR DX, DX
;    ;  MOV BX, 10
;    ;  MUL BX
;    ;  MOV BX, 0
;    ;  MOV BL, DL
;    ;  ADD AX, BX
;    ;  SHR AX, 1
;    ;  ADD CX, 1
;    ;  TEST AX, AX
;    ;  JNZ L1
;    ;
;    ;L2:
;    ;  MOV AH, 0
;    ;  DIV CX
;    ;  PUSH DX
;    ;  XOR DX, DX
;    ;  DEC CX
;    ;  OR CX, CX
;    ;  JNZ L2
;    ;
;    ;L3:
;    ;  POP DX
;    ;  ADD DL, '0'
;    ;  MOV AH, 2
;    ;  INT 21H
;    ;  LOOP L3
;    ;
;    ;POP DX
;    ;POP CX
;    ;POP BX
;    ;POP AX
;    MOV BX, AX
;  MOV AX, 0
;  
;  L1:
;    SHL AX, 1
;    RCL BX, 1
;    AND BX, 0000000000000001B
;    ADD AX, BX
;    LOOP L1
;  
;  MOV DECIMAL, AX
;  
;  MOV AX, DECIMAL
;  MOV BH, 0
;  MOV BL, 10
;
;  
;
;    PUSH AX
;    PUSH BX
;    PUSH CX
;    PUSH DX
;    MOV BX, 10
;    XOR CX, CX
;  
;    L2:
;      XOR DX, DX
;      DIV BX
;      ADD DL, '0'
;      PUSH DX
;      INC CX
;      OR AX, AX
;      JNE L2
;  
;    L3:
;      POP DX
;      MOV AH, 2
;      INT 21H
;      LOOP L3
;  
;    POP DX
;    POP CX
;    POP BX
;    POP AX  
;    JMP EXIT
;
TOOCTAL:
    
    LEA DX, MES1
    MOV AH, 09H
    INT 21H
    MOV AH, 1               
    INT 021H
    SUB AX, 48
    MOV CX, 0 
    MOV DX, 0 
    LABEL1:;

        CMP AX, 0
         JE PRINT1
  
;INITIALIZE BX TO 8 
    MOV BX, 8
  
;DIVIDE IT BY 8;

    DIV BX
  
;PUSH IT IN THE STACK
    PUSH DX
  
;INCREMENT THE COUNT
    INC CX
  
;SET DX TO 0
    XOR DX, DX
    JMP LABEL1
PRINT1:
  
;CHECK IF COUNT
;IS GREATER THAN ZERO
    CMP CX, 0 
    JE EXIT
  
;POP THE TOP OF STACK
    POP DX
  
;ADD 48 SO THAT IT
;REPRESENTS THE ASCII
;VALUE OF DIGITS
    ADD DX, 48
  
;INTERRUPT TO PRINT A
;CHARACTER
    MOV AH, 02H
    INT 21H
  
;DECREASE THE COUNT
    DEC CX
       JMP PRINT1   

TOHEXA:
    LEA DX, MES1
    MOV AH, 09H
    INT 21H
    MOV AH, 1               
    INT 021H 
    SUB AX, 48   
    
    MOV CX, 0
    MOV DX, 0 
LABEL2:

     CMP AX, 0 
     JE PRINT2
  
;INITIALIZE BX TO 16 
    MOV BX, 16
  
;DIVIDE IT BY 16
;TO CONVERT IT TO HEXADECIMAL
    DIV BX
  
;PUSH IT IN THE STACK
    PUSH DX
  
;INCREMENT THE COUNT
    INC CX
  
;SET DX TO 0
    XOR DX,DX
      JMP LABEL2
PRINT2:
;CHECK IF COUNT
;IS GREATER THAN ZERO
    CMP CX, 0
    JE EXIT
  
;POP THE TOP OF STACK
    POP DX
  
;COMPARE THE VALUE
;WITH 9 
    CMP DX, 9 
    JLE CONTINUE
  
;IF VALUE IS GREATER THAN 9
;THEN ADD 7 SO THAT AFTER
;ADDING 48 IT REPRESENTS A
;FOR EXAMPLE 10 + 7 + 48 = 65
;WHICH IS ASCII VALUE OF A
    ADD DX, 7
  
CONTINUE:
  
;ADD 48 SO THAT IT
;REPRESENTS THE ASCII
;VALUE OF DIGITS
    ADD DX, 48
  
;INTERRUPT TO PRINT A;
;CHARACTER
    MOV AH, 02H
    INT 21H
  
;DECREASE THE COUNT
    DEC CX
    JMP PRINT2
        
;TO PRINT THE ANSWER   
PRINTRES:
    LEA DX, MES3
    MOV AH, 09H
    INT 21H
    MOV AH,2
    MOV DX,RESULT
    INT 21H
    
JMP EXIT    
;interrupt to exit 
EXIT:
    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN
