   ************************************************************             
                           ;      LED BLINK. 
                          ;written by achala samapriya 
                           ;started on 2006/04/08   
      ;************************************************************** 
           processor PIC16F84A     ;Set the processor 
     radix hex               ;Set the radix 
       #include <p16F84A.inc>  ;Include header file 
 __CONFIG _RC_OSC & _PWRTE_OFF & _CP_OFF & _WDT_OFF 
Start     ORG 0x00 
  BANKSEL TRISA      ; SELECT BANK 1 
  CLRF TRISA         ; MAKE PORTA AN OUTPUT 
  CLRF TRISB         ; MAKE PORTB AN OUTPUT 
  BANKSEL PORTA      ; SELECT BANK 1 
BLINK 
 MOVLW B'00000000'             
 MOVWF PORTB 
 CALL DELAY2 
 MOVLW B'00000001' 
 MOVWF PORTB 
 CALL DELAY2 
 MOVLW b'00000010' 
 MOVWF PORTB 
 CALL DELAY2  
 MOVLW B'00000100' 
 MOVWF PORTB 
 CALL DELAY2 
 MOVLW B'00001000' 
 MOVWF PORTB 
 CALL DELAY2 
 MOVLW B'00010000' 
 MOVWF PORTB 
 CALL DELAY2 
 MOVLW B'00100000' 
 MOVWF PORTB 
 CALL DELAY2 
 MOVLW B'01000000' 
 MOVWF PORTB 
 CALL DELAY2  
 MOVLW B'10000000' 
 MOVWF PORTB 
 CALL DELAY2  
 MOVLW B'01000000' 
 MOVWF PORTB 
 CALL DELAY2 
 MOVLW B'00100000' 
 MOVWF PORTB 
    CALL DELAY2  
   MOVLW B'00010000' 
   MOVWF PORTB 
   CALL DELAY2  
   MOVLW  B'00001000' 
   MOVWF PORTB 
   CALL DELAY2  
   MOVLW B'00000100' 
   MOVWF PORTB 
   CALL DELAY2 
   MOVLW B'00000010' 
   MOVWF PORTB 
   CALL DELAY2  
   MOVLW  B'00000001' 
   MOVWF PORTB 
   CALL DELAY2  
   CLRF PORTB 
   GOTO BLINK 
 
     DELAY2 
         MOVLW 0X29 ;DELAY FOR 10mS ( These timing were based on 4Mhz x'tal) 
         MOVWF 0CH 
         S2     DECFSZ 0CH,1   ;   GOTO DELAY2.1 
         RETURN  
         DELAY2.1 MOVLW 52H 
         MOVWF 0DH 
S1     DECFSZ  0DH,1 
         GOTO S1  
         GOTO S2 
         RETURN                          
    
 
    END    