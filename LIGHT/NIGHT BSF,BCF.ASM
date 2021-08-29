         
        ;************************************************************             
                        ;      LED RUN (using bsf & bcf commands) . 
                                ;written by achala samapriya( micro house ) 
                                 ;started on 2007/01/30   
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
MAIN 
   BSF PORTB,0         ;B0 ON 
   CALL DELAY         ;WAIT  
   BCF PORTB,0         ;B0 OFF 
   BSF PORTB,1 
   CALL DELAY 
   BCF PORTB,1 
   BSF PORTB,2 
   CALL DELAY 
   BCF PORTB,2 
   BSF PORTB,3 
   CALL DELAY 
   BCF PORTB,3 
   BSF PORTB,4 
   CALL DELAY 
   BCF PORTB,4 
   BSF PORTB,5 
   CALL DELAY 
   BCF PORTB,5 
   BSF PORTB,6 
   CALL DELAY 
   BCF PORTB,6 
   BSF PORTB,7 
   CALL DELAY 
   BCF PORTB,7 
   BSF PORTB,6 
      CALL DELAY 
   BCF PORTB,6 
   BSF PORTB,5 
   CALL DELAY 
   BCF PORTB,5 
   BSF PORTB,4 
   CALL DELAY 
   BCF PORTB,4 
   BSF PORTB,3 
   CALL DELAY 
   BCF PORTB,3 
   BSF PORTB,2 
   CALL DELAY 
   BCF PORTB,2 
   BSF PORTB,1 
   CALL DELAY 
   BCF PORTB,1 
   GOTO MAIN       ; LOOP AGAIN 
 
DELAY 
         MOVLW 0X29 ;DELAY FOR 10mS ( These timing were based on 4Mhz x'tal) 
         MOVWF 0CH 
         S2     DECFSZ 0CH,1   ;   GOTO DELAY2.1 
         RETURN  
 DELAY2.1 MOVLW 52H 
         MOVWF 0DH 
S1     DECFSZ  0DH,1 
         GOTO S1  
         GOTO S2 
    END    
 
 
 
 
  