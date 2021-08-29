
                      
         ;************************************************************            
                             ; counter for single digit 
                            ;written by achala samapriya
                             ;started on 2007/01/30  
        ;**************************************************************

            	processor PIC16F84A    	;Set the processor
   				radix hex              	;Set the radix
			   	#include <p16F84A.inc> 	;Include header file
		__CONFIG _RC_OSC & _PWRTE_OFF & _CP_OFF & _WDT_OFF



 ORG 0x00
        GOTO MAIN
 ORG 0X04
        GOTO INT_SER  ;INTERUPT VECTOR     


DIS1       EQU   0XC ;COUNTER
DISPLAY1   EQU   0XD ;PATTERN

MAIN
   BANKSEL TRISA
   CLRF TRISA
   MOVLW 0X01
   MOVWF TRISB
   BANKSEL PORTA
   CLRF PORTA       ;SET BOTH AS OUT PUTS
   CLRF PORTB

 CLRF DIS1
 CLRF DISPLAY1
 
                          
    MOVLW 	b'01111110'
    MOVWF DISPLAY1
   
SCAN1
    

    MOVF DISPLAY1,0
    MOVWF PORTB

WAIT
      BTFSS PORTB ,0
      GOTO WAIT
     
      INCF DIS1,1
      MOVLW 0X0A
      XORWF DIS1,0
      BTFSS STATUS,Z
      GOTO NZERO
      GOTO ZERO 
NZERO
      MOVF DIS1,W
      CALL TABLE
      MOVWF DISPLAY1
      GOTO SCAN1 
ZERO  
      CLRF DIS1 
      MOVF DIS1,W
      CALL TABLE
      MOVWF DISPLAY1
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
