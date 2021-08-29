
                      
         ;************************************************************            
                             ;COUNTER FOR FOUR DIGITS.
                            ;written by achala samapriya
                             ;started on 2006/04/08  
        ;**************************************************************

            	processor PIC16F84A    	;Set the processor
   				radix hex              	;Set the radix
			   	#include <p16F84A.inc> 	;Include header file
		__CONFIG _RC_OSC & _PWRTE_OFF & _CP_OFF & _WDT_OFF



 ORG 0x00
        GOTO MAIN
 ORG 0X04
        GOTO INT_SER         


DIS1       EQU   0CH
DIS2       EQU   0DH
DIS3       EQU   0EH
DIS4       EQU   0FH  
DISPLAY1   EQU   12H
DISPLAY2   EQU   13H
DISPLAY3   EQU   14H
DISPLAY4   EQU   15H
   
MAIN
   BANKSEL TRISA
   CLRF TRISA
   MOVLW 0X01
   MOVWF TRISB
   BANKSEL PORTA
   CLRF PORTA       ;SET BOTH AS OUT PUTS
   CLRF PORTB

 CLRF DIS1
 CLRF DIS2
 CLRF DIS3
 CLRF DIS4 
 CLRF DISPLAY1
 CLRF DISPLAY2
 CLRF DISPLAY3
 CLRF DISPLAY4 
                          
    MOVLW 	b'01111110'
    MOVWF DISPLAY1
    MOVWF DISPLAY2
    MOVWF DISPLAY3
    MOVWF DISPLAY4
SCAN1

    BCF INTCON,INTF
    BSF INTCON,INTE
    BSF INTCON,GIE
    


    MOVF DISPLAY4,0
    MOVWF PORTB
	BSF PORTA,0
    CALL DELAY
    BCF PORTA,0
   
  
    MOVF DISPLAY3,0
    MOVWF PORTB
 	BSF PORTA,1
    CALL DELAY
    BCF PORTA,1
    
   
    MOVF DISPLAY2,0
    MOVWF PORTB
    BSF PORTA,2
    CALL DELAY
    BCF PORTA,2
   
   
    MOVF DISPLAY1,0
    MOVWF PORTB
	BSF PORTA,3
    CALL DELAY
    BCF PORTA,3
    GOTO SCAN1
INT_SER
        
      BTFSS INTCON,INTF
      RETFIE
      CLRF PORTA
      CLRF PORTB 
      INCF DIS1,1
 	  MOVLW 0X0A
      SUBWF DIS1,0
      BTFSS STATUS,Z
      GOTO SCC1
      GOTO SCC2
SCC1
      MOVF DIS1,W
      CALL TABLE
      MOVWF DISPLAY1
      GOTO SCAN1 
SCC2
      CLRF DIS1
      MOVF DIS1,W
      CALL TABLE
      MOVWF DISPLAY1 
      INCF DIS2,1
      MOVLW 0X0A
      SUBWF DIS2,0
      BTFSS STATUS,Z
      GOTO SCC3
      GOTO SCC4
SCC3
      MOVF DIS2,W
      CALL TABLE
      MOVWF DISPLAY2 
      GOTO SCAN1
SCC4
      CLRF DIS2
      MOVF DIS2,W
      CALL TABLE
      MOVWF DISPLAY2
      INCF DIS3,1
 	  MOVLW 0X0A
      SUBWF DIS3,0
      BTFSS STATUS,Z
      GOTO SCC5
      GOTO SCC6
SCC5
      MOVF DIS3,W
      CALL TABLE
      MOVWF DISPLAY3 
      GOTO SCAN1
SCC6 
      CLRF DIS3
      MOVF DIS3,W
      CALL TABLE
      MOVWF DISPLAY3
      INCF DIS4,1 
      MOVLW 0X0A
      SUBWF DIS4,0
      BTFSS STATUS,Z
      GOTO SCC7
      GOTO SCC8
SCC7   
      MOVF DIS4,W
      CALL TABLE
      MOVWF DISPLAY4 
      GOTO SCAN1 
SCC8
      CLRF DIS4
      MOVF DIS4,W
      CALL TABLE
      MOVWF DISPLAY4
      GOTO SCAN1         
TABLE       ;Data table for seven segments... 
  
        ADDWF PCL,1
     
        ;gfedcba
		RETLW	b'01111110'
		RETLW	b'00001100'
		RETLW	b'10110110'
		RETLW	b'10011110'
		RETLW	b'11001100'
		RETLW	b'11011010'
		RETLW	b'11111010'
		RETLW	b'00001110'
		RETLW	b'11111110'
		RETLW	b'11011110'
DELAY
         MOVLW 06H ;DELAY FOR SCAN
         MOVWF 32H
S2       DECFSZ 32H,1
         GOTO DELAY2.1
         RETURN 
DELAY2.1 MOVLW 50H
         MOVWF 33H
S1       DECFSZ	33H,1
		 GOTO S1	
         GOTO S2   

    END   
