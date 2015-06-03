
_main:

;software.c,2 :: 		void main() {
;software.c,3 :: 		TRISB = 0;
	CLRF       TRISB+0
;software.c,5 :: 		PORTB =255;
	MOVLW      255
	MOVWF      PORTB+0
;software.c,7 :: 		while(1)
L_main0:
;software.c,9 :: 		Delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;software.c,10 :: 		PORTB =0;
	CLRF       PORTB+0
;software.c,11 :: 		Delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;software.c,12 :: 		PORTB =255;
	MOVLW      255
	MOVWF      PORTB+0
;software.c,13 :: 		}
	GOTO       L_main0
;software.c,14 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
