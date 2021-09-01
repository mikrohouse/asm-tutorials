
                      
         ;************************************************************            
                             ;  EEPROM  DEMO
                            ;written by achala samapriya
                             ;started on 2006/04/08  
        ;**************************************************************

            	processor PIC16F84A    	;Set the processor
   				radix hex              	;Set the radix
			   	#include <p16F84A.inc> 	;Include header file
	
             	__CONFIG _XT_OSC & _PWRTE_OFF & _CP_OFF & _WDT_OFF


 ORG 0x00
        GOTO MAIN


CNT       EQU   0x0C

MAIN

   BANKSEL TRISA 
   CLRF  TRISB
   MOVLW 0XFF
   MOVWF TRISA      ;PORTA AS AN INPUT
   CLRF PORTA       ;SET BOTH AS OUT PUTS
   CLRF PORTB

   
         BANKSEL EEADR           ;EEPROM READING FOR PROGRAM 1
         MOVLW 0X00                ;READ EEPROM 0H
         MOVWF EEADR
         BANKSEL EECON1
         BSF EECON1,RD
         BANKSEL EEDATA
         MOVF EEDATA,W
         BANKSEL CNT
         MOVWF   CNT
   
CNTLOOP
        INCF CNT,1
        MOVF CNT,W
        MOVWF PORTB
        CALL DELAY
        BTFSC PORTA,0
        GOTO CNTLOOP 
        BTFSS PORTA,0
        GOTO $-1
        BANKSEL INTCON
        BCF INTCON,GIE
        BANKSEL EEADR
        MOVLW 0X00
        MOVWF EEADR
        BANKSEL CNT
        MOVF CNT,0 
        BANKSEL EEDATA                ;DATA TO EEPROM LOCATION 01
        MOVWF EEDATA
        BANKSEL EECON1  
        BSF EECON1,WREN
        MOVLW 0X55
        MOVWF EECON2
        MOVLW 0XAA
        MOVWF EECON2
        BSF EECON1,WR
WR4     BTFSC EECON1,WR
        GoTo WR4
        BANKSEL INTCON
        BSF INTCON,GIE                               
        GOTO CNTLOOP           
                          
DELAY
         MOVLW 0XFF ;DELAY FOR SCAN
         MOVWF 0X0D
S2       DECFSZ 0X0D,1
         GOTO DELAY2.1
         RETURN 
DELAY2.1 MOVLW 0XFF
         MOVWF 0X0E
S1       DECFSZ	0X0E,1
         GOTO S1	
         GOTO S2   

    END   
