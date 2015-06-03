
_print_to_segments:

;print_to_segments.c,3 :: 		void print_to_segments(digits_t *number, unsigned char setting)
;print_to_segments.c,5 :: 		switch(number->type)
	MOVLW      2
	ADDWF      FARG_print_to_segments_number+0, 0
	MOVWF      FLOC__print_to_segments+0
	GOTO       L_print_to_segments0
;print_to_segments.c,8 :: 		case CLOCK_TYPE :
L_print_to_segments2:
;print_to_segments.c,10 :: 		PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
	MOVLW      1
	ANDWF      PORTB+0, 1
;print_to_segments.c,11 :: 		PORTA = segment_select[SEGMENT_1] ;  // select segment 1
	MOVF       _segment_select+0, 0
	MOVWF      PORTA+0
;print_to_segments.c,13 :: 		if(setting == NO_SETTING || setting == SET_HOUR)
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__print_to_segments111
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__print_to_segments111
	GOTO       L_print_to_segments5
L__print_to_segments111:
;print_to_segments.c,16 :: 		if(setting == NO_SETTING ) PORTB = PORTB | (numbers [number->digit_1%10] & 0xFE) ; // set the digit to PORTB
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments6
	MOVF       FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      15
	ANDWF      R0+0, 1
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _numbers+0
	MOVWF      FSR
	MOVLW      254
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
L_print_to_segments6:
;print_to_segments.c,17 :: 		if(setting == SET_HOUR)    PORTB = PORTB | (numbers [10] & 0xFE) ; // set the digit to PORTB
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments7
	MOVLW      254
	ANDWF      _numbers+10, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
L_print_to_segments7:
;print_to_segments.c,19 :: 		delay_ms(CHARACTER_DELAY); // multiplexing delay
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_print_to_segments8:
	DECFSZ     R13+0, 1
	GOTO       L_print_to_segments8
	DECFSZ     R12+0, 1
	GOTO       L_print_to_segments8
;print_to_segments.c,21 :: 		}else if(setting == SET_MIN)
	GOTO       L_print_to_segments9
L_print_to_segments5:
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments10
;print_to_segments.c,25 :: 		PORTB = PORTB | (numbers [number->digit_1%10] & 0xFE) ; // set the digit to PORTB
	MOVF       FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      15
	ANDWF      R0+0, 1
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _numbers+0
	MOVWF      FSR
	MOVLW      254
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
;print_to_segments.c,31 :: 		delay_ms(CHARACTER_DELAY); // multiplexing delay
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_print_to_segments11:
	DECFSZ     R13+0, 1
	GOTO       L_print_to_segments11
	DECFSZ     R12+0, 1
	GOTO       L_print_to_segments11
;print_to_segments.c,32 :: 		}
L_print_to_segments10:
L_print_to_segments9:
;print_to_segments.c,34 :: 		PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
	MOVLW      1
	ANDWF      PORTB+0, 1
;print_to_segments.c,35 :: 		PORTA = segment_select[SEGMENT_2] ;  // select segment 2
	MOVF       _segment_select+1, 0
	MOVWF      PORTA+0
;print_to_segments.c,36 :: 		if(setting == NO_SETTING || setting == SET_HOUR)
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__print_to_segments110
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__print_to_segments110
	GOTO       L_print_to_segments14
L__print_to_segments110:
;print_to_segments.c,39 :: 		if(setting == NO_SETTING ) PORTB = PORTB | (numbers [number->digit_2%10] & 0xFE) ; // set the digit to PORTB
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments15
	MOVF       FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      240
	ANDWF      R0+0, 0
	MOVWF      R1+0
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	MOVF       R1+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _numbers+0
	MOVWF      FSR
	MOVLW      254
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
L_print_to_segments15:
;print_to_segments.c,40 :: 		if(setting == SET_HOUR )   PORTB = PORTB | (numbers [10] & 0xFE) ; // set the digit to PORTB
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments16
	MOVLW      254
	ANDWF      _numbers+10, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
L_print_to_segments16:
;print_to_segments.c,42 :: 		delay_ms(CHARACTER_DELAY); // multiplexing delay
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_print_to_segments17:
	DECFSZ     R13+0, 1
	GOTO       L_print_to_segments17
	DECFSZ     R12+0, 1
	GOTO       L_print_to_segments17
;print_to_segments.c,44 :: 		}else if(setting == SET_MIN)
	GOTO       L_print_to_segments18
L_print_to_segments14:
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments19
;print_to_segments.c,48 :: 		PORTB = PORTB | (numbers [number->digit_2%10] & 0xFE) ; // set the digit to PORTB
	MOVF       FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      240
	ANDWF      R0+0, 0
	MOVWF      R1+0
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	MOVF       R1+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _numbers+0
	MOVWF      FSR
	MOVLW      254
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
;print_to_segments.c,54 :: 		delay_ms(CHARACTER_DELAY); // multiplexing delay
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_print_to_segments20:
	DECFSZ     R13+0, 1
	GOTO       L_print_to_segments20
	DECFSZ     R12+0, 1
	GOTO       L_print_to_segments20
;print_to_segments.c,55 :: 		}
L_print_to_segments19:
L_print_to_segments18:
;print_to_segments.c,57 :: 		PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
	MOVLW      1
	ANDWF      PORTB+0, 1
;print_to_segments.c,58 :: 		PORTA = segment_select[SEGMENT_3] ;  // select segment 3
	MOVF       _segment_select+3, 0
	MOVWF      PORTA+0
;print_to_segments.c,60 :: 		if(setting == NO_SETTING || setting == SET_MIN)
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__print_to_segments109
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__print_to_segments109
	GOTO       L_print_to_segments23
L__print_to_segments109:
;print_to_segments.c,63 :: 		if(setting == NO_SETTING ) PORTB = PORTB | (numbers [number->digit_3%10] & 0xFE) ; // set the digit to PORTB
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments24
	INCF       FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	MOVLW      15
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _numbers+0
	MOVWF      FSR
	MOVLW      254
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
L_print_to_segments24:
;print_to_segments.c,64 :: 		if(setting == SET_MIN )   PORTB = PORTB | (numbers [10] & 0xFE) ; // set the digit to PORTB
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments25
	MOVLW      254
	ANDWF      _numbers+10, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
L_print_to_segments25:
;print_to_segments.c,66 :: 		delay_ms(CHARACTER_DELAY); // multiplexing delay
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_print_to_segments26:
	DECFSZ     R13+0, 1
	GOTO       L_print_to_segments26
	DECFSZ     R12+0, 1
	GOTO       L_print_to_segments26
;print_to_segments.c,68 :: 		}else if(setting == SET_HOUR)
	GOTO       L_print_to_segments27
L_print_to_segments23:
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments28
;print_to_segments.c,72 :: 		*/         PORTB = PORTB | (numbers [number->digit_3%10] & 0xFE) ; // set the digit to PORTB
	INCF       FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	MOVLW      15
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _numbers+0
	MOVWF      FSR
	MOVLW      254
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
;print_to_segments.c,78 :: 		*/         delay_ms(CHARACTER_DELAY); // multiplexing delay
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_print_to_segments29:
	DECFSZ     R13+0, 1
	GOTO       L_print_to_segments29
	DECFSZ     R12+0, 1
	GOTO       L_print_to_segments29
;print_to_segments.c,79 :: 		}
L_print_to_segments28:
L_print_to_segments27:
;print_to_segments.c,82 :: 		PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
	MOVLW      1
	ANDWF      PORTB+0, 1
;print_to_segments.c,83 :: 		PORTA = segment_select[SEGMENT_4] ;  // select segment 4
	MOVF       _segment_select+4, 0
	MOVWF      PORTA+0
;print_to_segments.c,84 :: 		if(setting == NO_SETTING || setting == SET_MIN)
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__print_to_segments108
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__print_to_segments108
	GOTO       L_print_to_segments32
L__print_to_segments108:
;print_to_segments.c,87 :: 		if(setting == NO_SETTING ) PORTB = PORTB | (numbers [number->digit_4%10] & 0xFE) ; // set the digit to PORTB
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments33
	INCF       FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	MOVLW      240
	ANDWF      INDF+0, 0
	MOVWF      R1+0
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	MOVF       R1+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _numbers+0
	MOVWF      FSR
	MOVLW      254
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
L_print_to_segments33:
;print_to_segments.c,88 :: 		if(setting == SET_MIN )   PORTB = PORTB | (numbers [10] & 0xFE) ; // set the digit to PORTB
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments34
	MOVLW      254
	ANDWF      _numbers+10, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
L_print_to_segments34:
;print_to_segments.c,91 :: 		delay_ms(CHARACTER_DELAY); // multiplexing delay
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_print_to_segments35:
	DECFSZ     R13+0, 1
	GOTO       L_print_to_segments35
	DECFSZ     R12+0, 1
	GOTO       L_print_to_segments35
;print_to_segments.c,93 :: 		}else if(setting == SET_HOUR)
	GOTO       L_print_to_segments36
L_print_to_segments32:
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments37
;print_to_segments.c,97 :: 		PORTB = PORTB | (numbers [number->digit_4%10] & 0xFE) ; // set the digit to PORTB
	INCF       FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	MOVLW      240
	ANDWF      INDF+0, 0
	MOVWF      R1+0
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	MOVF       R1+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _numbers+0
	MOVWF      FSR
	MOVLW      254
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
;print_to_segments.c,103 :: 		delay_ms(CHARACTER_DELAY); // multiplexing delay
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_print_to_segments38:
	DECFSZ     R13+0, 1
	GOTO       L_print_to_segments38
	DECFSZ     R12+0, 1
	GOTO       L_print_to_segments38
;print_to_segments.c,104 :: 		}
L_print_to_segments37:
L_print_to_segments36:
;print_to_segments.c,106 :: 		PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
	MOVLW      1
	ANDWF      PORTB+0, 1
;print_to_segments.c,107 :: 		PORTA = segment_select[SEGMENT_5] ;  // select segment 5
	MOVF       _segment_select+2, 0
	MOVWF      PORTA+0
;print_to_segments.c,108 :: 		if(setting == NO_SETTING)
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments39
;print_to_segments.c,110 :: 		if(number->counter < COUNTER_EQUAL_TO_500MS)
	MOVLW      3
	ADDWF      FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	MOVLW      100
	SUBWF      INDF+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_print_to_segments40
;print_to_segments.c,112 :: 		PORTB = PORTB | (symbols [0] & 0xFE) ; // set the symbol ':' to PORTB
	MOVLW      254
	ANDWF      _symbols+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
;print_to_segments.c,113 :: 		}
	GOTO       L_print_to_segments41
L_print_to_segments40:
;print_to_segments.c,116 :: 		PORTB = PORTB | (symbols [5] & 0xFE) ; // set the symbol ' ' to PORTB
	MOVLW      254
	ANDWF      _symbols+5, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
;print_to_segments.c,117 :: 		}
L_print_to_segments41:
;print_to_segments.c,118 :: 		delay_ms(CHARACTER_DELAY); // multiplexing delay
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_print_to_segments42:
	DECFSZ     R13+0, 1
	GOTO       L_print_to_segments42
	DECFSZ     R12+0, 1
	GOTO       L_print_to_segments42
;print_to_segments.c,120 :: 		}else if(setting == SET_MIN || setting == SET_HOUR)
	GOTO       L_print_to_segments43
L_print_to_segments39:
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__print_to_segments107
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__print_to_segments107
	GOTO       L_print_to_segments46
L__print_to_segments107:
;print_to_segments.c,122 :: 		PORTB = PORTB | (symbols [0] & 0xFE) ; // set the symbol ':' to PORTB
	MOVLW      254
	ANDWF      _symbols+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
;print_to_segments.c,123 :: 		delay_ms(CHARACTER_DELAY); // multiplexing delay
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_print_to_segments47:
	DECFSZ     R13+0, 1
	GOTO       L_print_to_segments47
	DECFSZ     R12+0, 1
	GOTO       L_print_to_segments47
;print_to_segments.c,124 :: 		}
L_print_to_segments46:
L_print_to_segments43:
;print_to_segments.c,126 :: 		if( number->counter < COUNTER_EQUAL_TO_500MS*2)
	MOVLW      3
	ADDWF      FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	MOVLW      200
	SUBWF      INDF+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_print_to_segments48
;print_to_segments.c,127 :: 		{number->counter++;}
	MOVLW      3
	ADDWF      FARG_print_to_segments_number+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      FSR
	INCF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	GOTO       L_print_to_segments49
L_print_to_segments48:
;print_to_segments.c,129 :: 		{number->counter=0;}
	MOVLW      3
	ADDWF      FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	CLRF       INDF+0
L_print_to_segments49:
;print_to_segments.c,131 :: 		break;
	GOTO       L_print_to_segments1
;print_to_segments.c,133 :: 		case TEMP_TYPE :
L_print_to_segments50:
;print_to_segments.c,135 :: 		PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
	MOVLW      1
	ANDWF      PORTB+0, 1
;print_to_segments.c,136 :: 		PORTA = segment_select[SEGMENT_1] ;  // select segment 1
	MOVF       _segment_select+0, 0
	MOVWF      PORTA+0
;print_to_segments.c,137 :: 		{PORTB = PORTB | (numbers [10] & 0xFE) ;} // set the digit to PORTB
	MOVLW      254
	ANDWF      _numbers+10, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
;print_to_segments.c,138 :: 		delay_ms(CHARACTER_DELAY); // multiplexing delay
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_print_to_segments51:
	DECFSZ     R13+0, 1
	GOTO       L_print_to_segments51
	DECFSZ     R12+0, 1
	GOTO       L_print_to_segments51
;print_to_segments.c,141 :: 		PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
	MOVLW      1
	ANDWF      PORTB+0, 1
;print_to_segments.c,142 :: 		PORTA = segment_select[SEGMENT_2] ;  // select segment 2
	MOVF       _segment_select+1, 0
	MOVWF      PORTA+0
;print_to_segments.c,143 :: 		{PORTB = PORTB | (numbers [number->digit_2%10] & 0xFE) ;} // set the digit to PORTB
	MOVF       FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      240
	ANDWF      R0+0, 0
	MOVWF      R1+0
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	MOVF       R1+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _numbers+0
	MOVWF      FSR
	MOVLW      254
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
;print_to_segments.c,144 :: 		delay_ms(CHARACTER_DELAY); // multiplexing delay
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_print_to_segments52:
	DECFSZ     R13+0, 1
	GOTO       L_print_to_segments52
	DECFSZ     R12+0, 1
	GOTO       L_print_to_segments52
;print_to_segments.c,147 :: 		PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
	MOVLW      1
	ANDWF      PORTB+0, 1
;print_to_segments.c,148 :: 		PORTA = segment_select[SEGMENT_3] ;  // select segment 3
	MOVF       _segment_select+3, 0
	MOVWF      PORTA+0
;print_to_segments.c,149 :: 		{PORTB = PORTB | (numbers [number->digit_3%10] & 0xFE) ;} // set the digit to PORTB
	INCF       FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	MOVLW      15
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _numbers+0
	MOVWF      FSR
	MOVLW      254
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
;print_to_segments.c,150 :: 		delay_ms(CHARACTER_DELAY); // multiplexing delay
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_print_to_segments53:
	DECFSZ     R13+0, 1
	GOTO       L_print_to_segments53
	DECFSZ     R12+0, 1
	GOTO       L_print_to_segments53
;print_to_segments.c,153 :: 		PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
	MOVLW      1
	ANDWF      PORTB+0, 1
;print_to_segments.c,154 :: 		PORTA = segment_select[SEGMENT_4] ;  // select segment 4
	MOVF       _segment_select+4, 0
	MOVWF      PORTA+0
;print_to_segments.c,155 :: 		if(number->minus == 1)
	MOVLW      2
	ADDWF      FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	BTFSS      R0+0, 0
	GOTO       L_print_to_segments54
;print_to_segments.c,156 :: 		{PORTB = PORTB | (symbols [4] & 0xFE) ;} // set PORTB to '-'
	MOVLW      254
	ANDWF      _symbols+4, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
	GOTO       L_print_to_segments55
L_print_to_segments54:
;print_to_segments.c,159 :: 		PORTA = 255 ; //No segment selected
	MOVLW      255
	MOVWF      PORTA+0
;print_to_segments.c,160 :: 		PORTB = PORTB | (numbers [10] & 0xFE) ;} // set PORTB to NULL
	MOVLW      254
	ANDWF      _numbers+10, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
L_print_to_segments55:
;print_to_segments.c,161 :: 		delay_ms(CHARACTER_DELAY); // multiplexing delay
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_print_to_segments56:
	DECFSZ     R13+0, 1
	GOTO       L_print_to_segments56
	DECFSZ     R12+0, 1
	GOTO       L_print_to_segments56
;print_to_segments.c,164 :: 		PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
	MOVLW      1
	ANDWF      PORTB+0, 1
;print_to_segments.c,165 :: 		PORTA = segment_select[SEGMENT_5] ;  // select segment 5
	MOVF       _segment_select+2, 0
	MOVWF      PORTA+0
;print_to_segments.c,166 :: 		{PORTB = PORTB | (symbols [2] & 0xFE) ;} // set the symbol '°' to PORTB
	MOVLW      254
	ANDWF      _symbols+2, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
;print_to_segments.c,167 :: 		delay_ms(CHARACTER_DELAY); // multiplexing delay
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_print_to_segments57:
	DECFSZ     R13+0, 1
	GOTO       L_print_to_segments57
	DECFSZ     R12+0, 1
	GOTO       L_print_to_segments57
;print_to_segments.c,169 :: 		number->counter=0;
	MOVLW      3
	ADDWF      FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;print_to_segments.c,170 :: 		break;
	GOTO       L_print_to_segments1
;print_to_segments.c,172 :: 		case CALENDAR_TYPE :
L_print_to_segments58:
;print_to_segments.c,175 :: 		PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
	MOVLW      1
	ANDWF      PORTB+0, 1
;print_to_segments.c,176 :: 		PORTA = segment_select[SEGMENT_1] ;  // select segment 1
	MOVF       _segment_select+0, 0
	MOVWF      PORTA+0
;print_to_segments.c,177 :: 		if(setting == NO_SETTING || setting == SET_MONTH)
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__print_to_segments106
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L__print_to_segments106
	GOTO       L_print_to_segments61
L__print_to_segments106:
;print_to_segments.c,180 :: 		if(setting == NO_SETTING ) PORTB = PORTB | (numbers [number->digit_1%10] & 0xFE) ; // set the digit to PORTB
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments62
	MOVF       FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      15
	ANDWF      R0+0, 1
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _numbers+0
	MOVWF      FSR
	MOVLW      254
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
L_print_to_segments62:
;print_to_segments.c,181 :: 		if(setting == SET_MONTH )  PORTB = PORTB | (numbers [10] & 0xFE) ; // set the digit to PORTB
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments63
	MOVLW      254
	ANDWF      _numbers+10, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
L_print_to_segments63:
;print_to_segments.c,184 :: 		delay_ms(CHARACTER_DELAY); // multiplexing delay
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_print_to_segments64:
	DECFSZ     R13+0, 1
	GOTO       L_print_to_segments64
	DECFSZ     R12+0, 1
	GOTO       L_print_to_segments64
;print_to_segments.c,186 :: 		}else if(setting == SET_DAY)
	GOTO       L_print_to_segments65
L_print_to_segments61:
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments66
;print_to_segments.c,190 :: 		*/         PORTB = PORTB | (numbers [number->digit_1%10] & 0xFE) ; // set the digit to PORTB
	MOVF       FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      15
	ANDWF      R0+0, 1
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _numbers+0
	MOVWF      FSR
	MOVLW      254
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
;print_to_segments.c,196 :: 		*/      delay_ms(CHARACTER_DELAY); // multiplexing delay
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_print_to_segments67:
	DECFSZ     R13+0, 1
	GOTO       L_print_to_segments67
	DECFSZ     R12+0, 1
	GOTO       L_print_to_segments67
;print_to_segments.c,197 :: 		}
L_print_to_segments66:
L_print_to_segments65:
;print_to_segments.c,199 :: 		PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
	MOVLW      1
	ANDWF      PORTB+0, 1
;print_to_segments.c,200 :: 		PORTA = segment_select[SEGMENT_2] ;  // select segment 2
	MOVF       _segment_select+1, 0
	MOVWF      PORTA+0
;print_to_segments.c,201 :: 		if(setting == NO_SETTING || setting == SET_MONTH)
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__print_to_segments105
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L__print_to_segments105
	GOTO       L_print_to_segments70
L__print_to_segments105:
;print_to_segments.c,203 :: 		if(setting == NO_SETTING ){
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments71
;print_to_segments.c,204 :: 		if (number->digit_2 == 1)
	MOVF       FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      240
	ANDWF      R0+0, 0
	MOVWF      R1+0
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	MOVF       R1+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments72
;print_to_segments.c,205 :: 		{PORTB = PORTB | (numbers [1] & 0xFE) ;} // set the digit to PORTB
	MOVLW      254
	ANDWF      _numbers+1, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
	GOTO       L_print_to_segments73
L_print_to_segments72:
;print_to_segments.c,207 :: 		{PORTB = PORTB | (numbers [10] & 0xFE) ;} // set the digit to PORTB
	MOVLW      254
	ANDWF      _numbers+10, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
L_print_to_segments73:
;print_to_segments.c,208 :: 		}
L_print_to_segments71:
;print_to_segments.c,209 :: 		if(setting == SET_MONTH )  PORTB = PORTB | (numbers [10] & 0xFE) ; // set the digit to PORTB
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments74
	MOVLW      254
	ANDWF      _numbers+10, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
L_print_to_segments74:
;print_to_segments.c,211 :: 		delay_ms(CHARACTER_DELAY); // multiplexing delay
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_print_to_segments75:
	DECFSZ     R13+0, 1
	GOTO       L_print_to_segments75
	DECFSZ     R12+0, 1
	GOTO       L_print_to_segments75
;print_to_segments.c,213 :: 		}else if(setting == SET_DAY)
	GOTO       L_print_to_segments76
L_print_to_segments70:
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments77
;print_to_segments.c,217 :: 		*/       if (number->digit_2 == 1)
	MOVF       FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      240
	ANDWF      R0+0, 0
	MOVWF      R1+0
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	MOVF       R1+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments78
;print_to_segments.c,218 :: 		{PORTB = PORTB | (numbers [1] & 0xFE) ;} // set the digit to PORTB
	MOVLW      254
	ANDWF      _numbers+1, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
	GOTO       L_print_to_segments79
L_print_to_segments78:
;print_to_segments.c,220 :: 		{PORTB = PORTB | (numbers [10] & 0xFE) ;} // set the digit to PORTB
	MOVLW      254
	ANDWF      _numbers+10, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
L_print_to_segments79:
;print_to_segments.c,227 :: 		delay_ms(CHARACTER_DELAY); // multiplexing delay
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_print_to_segments80:
	DECFSZ     R13+0, 1
	GOTO       L_print_to_segments80
	DECFSZ     R12+0, 1
	GOTO       L_print_to_segments80
;print_to_segments.c,228 :: 		}
L_print_to_segments77:
L_print_to_segments76:
;print_to_segments.c,232 :: 		PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
	MOVLW      1
	ANDWF      PORTB+0, 1
;print_to_segments.c,233 :: 		PORTA = segment_select[SEGMENT_3] ;  // select segment 3
	MOVF       _segment_select+3, 0
	MOVWF      PORTA+0
;print_to_segments.c,234 :: 		if(setting == NO_SETTING || setting == SET_DAY)
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__print_to_segments104
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L__print_to_segments104
	GOTO       L_print_to_segments83
L__print_to_segments104:
;print_to_segments.c,237 :: 		if(setting == NO_SETTING ) PORTB = PORTB | (numbers [number->digit_3%10] & 0xFE) ; // set the digit to PORTB
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments84
	INCF       FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	MOVLW      15
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _numbers+0
	MOVWF      FSR
	MOVLW      254
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
L_print_to_segments84:
;print_to_segments.c,238 :: 		if(setting == SET_DAY )    PORTB = PORTB | (numbers [10] & 0xFE) ; // set the digit to PORTB
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments85
	MOVLW      254
	ANDWF      _numbers+10, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
L_print_to_segments85:
;print_to_segments.c,241 :: 		delay_ms(CHARACTER_DELAY); // multiplexing delay
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_print_to_segments86:
	DECFSZ     R13+0, 1
	GOTO       L_print_to_segments86
	DECFSZ     R12+0, 1
	GOTO       L_print_to_segments86
;print_to_segments.c,243 :: 		}else if(setting == SET_MONTH)
	GOTO       L_print_to_segments87
L_print_to_segments83:
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments88
;print_to_segments.c,247 :: 		PORTB = PORTB | (numbers [number->digit_3%10] & 0xFE) ; // set the digit to PORTB
	INCF       FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	MOVLW      15
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _numbers+0
	MOVWF      FSR
	MOVLW      254
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
;print_to_segments.c,253 :: 		delay_ms(CHARACTER_DELAY); // multiplexing delay
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_print_to_segments89:
	DECFSZ     R13+0, 1
	GOTO       L_print_to_segments89
	DECFSZ     R12+0, 1
	GOTO       L_print_to_segments89
;print_to_segments.c,254 :: 		}
L_print_to_segments88:
L_print_to_segments87:
;print_to_segments.c,257 :: 		PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
	MOVLW      1
	ANDWF      PORTB+0, 1
;print_to_segments.c,258 :: 		PORTA = segment_select[SEGMENT_4] ;  // select segment 4
	MOVF       _segment_select+4, 0
	MOVWF      PORTA+0
;print_to_segments.c,259 :: 		if(setting == NO_SETTING || setting == SET_DAY)
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__print_to_segments103
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L__print_to_segments103
	GOTO       L_print_to_segments92
L__print_to_segments103:
;print_to_segments.c,262 :: 		if(setting == NO_SETTING ) PORTB = PORTB | (numbers [number->digit_4%10] & 0xFE) ; // set the digit to PORTB
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments93
	INCF       FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	MOVLW      240
	ANDWF      INDF+0, 0
	MOVWF      R1+0
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	MOVF       R1+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _numbers+0
	MOVWF      FSR
	MOVLW      254
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
L_print_to_segments93:
;print_to_segments.c,263 :: 		if(setting == SET_DAY )    PORTB = PORTB | (numbers [10] & 0xFE) ; // set the digit to PORTB
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments94
	MOVLW      254
	ANDWF      _numbers+10, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
L_print_to_segments94:
;print_to_segments.c,266 :: 		delay_ms(CHARACTER_DELAY); // multiplexing delay
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_print_to_segments95:
	DECFSZ     R13+0, 1
	GOTO       L_print_to_segments95
	DECFSZ     R12+0, 1
	GOTO       L_print_to_segments95
;print_to_segments.c,268 :: 		}else if(setting == SET_MONTH)
	GOTO       L_print_to_segments96
L_print_to_segments92:
	MOVF       FARG_print_to_segments_setting+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_print_to_segments97
;print_to_segments.c,272 :: 		PORTB = PORTB | (numbers [number->digit_4%10] & 0xFE) ; // set the digit to PORTB
	INCF       FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	MOVLW      240
	ANDWF      INDF+0, 0
	MOVWF      R1+0
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	MOVF       R1+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _numbers+0
	MOVWF      FSR
	MOVLW      254
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
;print_to_segments.c,278 :: 		delay_ms(CHARACTER_DELAY); // multiplexing delay
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_print_to_segments98:
	DECFSZ     R13+0, 1
	GOTO       L_print_to_segments98
	DECFSZ     R12+0, 1
	GOTO       L_print_to_segments98
;print_to_segments.c,279 :: 		}
L_print_to_segments97:
L_print_to_segments96:
;print_to_segments.c,283 :: 		PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
	MOVLW      1
	ANDWF      PORTB+0, 1
;print_to_segments.c,284 :: 		PORTA = segment_select[SEGMENT_5] ;  // select segment 5
	MOVF       _segment_select+2, 0
	MOVWF      PORTA+0
;print_to_segments.c,285 :: 		{PORTB = PORTB | (symbols [1] & 0xFE) ;} // set the symbol '/' to PORTB
	MOVLW      254
	ANDWF      _symbols+1, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
;print_to_segments.c,286 :: 		delay_ms(CHARACTER_DELAY); // multiplexing delay
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_print_to_segments99:
	DECFSZ     R13+0, 1
	GOTO       L_print_to_segments99
	DECFSZ     R12+0, 1
	GOTO       L_print_to_segments99
;print_to_segments.c,288 :: 		if( number->counter < COUNTER_EQUAL_TO_500MS*2)
	MOVLW      3
	ADDWF      FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	MOVLW      200
	SUBWF      INDF+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_print_to_segments100
;print_to_segments.c,289 :: 		{number->counter++;}
	MOVLW      3
	ADDWF      FARG_print_to_segments_number+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      FSR
	INCF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	GOTO       L_print_to_segments101
L_print_to_segments100:
;print_to_segments.c,291 :: 		{number->counter=0;}
	MOVLW      3
	ADDWF      FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	CLRF       INDF+0
L_print_to_segments101:
;print_to_segments.c,293 :: 		break;
	GOTO       L_print_to_segments1
;print_to_segments.c,295 :: 		default:
L_print_to_segments102:
;print_to_segments.c,296 :: 		number->counter=0;
	MOVLW      3
	ADDWF      FARG_print_to_segments_number+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;print_to_segments.c,297 :: 		break;
	GOTO       L_print_to_segments1
;print_to_segments.c,298 :: 		}
L_print_to_segments0:
	MOVF       FLOC__print_to_segments+0, 0
	MOVWF      FSR
	MOVLW      6
	ANDWF      INDF+0, 0
	MOVWF      R1+0
	RRF        R1+0, 1
	BCF        R1+0, 7
	MOVF       R1+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_print_to_segments2
	MOVF       FLOC__print_to_segments+0, 0
	MOVWF      FSR
	MOVLW      6
	ANDWF      INDF+0, 0
	MOVWF      R1+0
	RRF        R1+0, 1
	BCF        R1+0, 7
	MOVF       R1+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_print_to_segments50
	MOVF       FLOC__print_to_segments+0, 0
	MOVWF      FSR
	MOVLW      6
	ANDWF      INDF+0, 0
	MOVWF      R1+0
	RRF        R1+0, 1
	BCF        R1+0, 7
	MOVF       R1+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_print_to_segments58
	GOTO       L_print_to_segments102
L_print_to_segments1:
;print_to_segments.c,299 :: 		}
L_end_print_to_segments:
	RETURN
; end of _print_to_segments
