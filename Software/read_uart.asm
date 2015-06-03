
_Read_Buttons:

;read_uart.c,3 :: 		void Read_Buttons()
;read_uart.c,7 :: 		switches_previous.word = switches_current.word;
	MOVF       _switches_current+0, 0
	MOVWF      _switches_previous+0
;read_uart.c,8 :: 		switches_current.word = PORTC ;
	MOVF       PORTC+0, 0
	MOVWF      _switches_current+0
;read_uart.c,10 :: 		if((switches_current.bits.button1 == 0) && (switches_current.bits.button1 == switches_previous.bits.button1))
	BTFSC      _switches_current+0, 0
	GOTO       L_Read_Buttons2
	BTFSC      _switches_current+0, 0
	GOTO       L__Read_Buttons44
	BTFSS      _switches_previous+0, 0
	GOTO       L__Read_Buttons45
	GOTO       L_Read_Buttons2
L__Read_Buttons44:
	BTFSS      _switches_previous+0, 0
	GOTO       L_Read_Buttons2
L__Read_Buttons45:
L__Read_Buttons42:
;read_uart.c,11 :: 		{button_press_counter++;}
	INCF       _button_press_counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _button_press_counter+1, 1
	GOTO       L_Read_Buttons3
L_Read_Buttons2:
;read_uart.c,13 :: 		{button_press_counter = 0 ;}
	CLRF       _button_press_counter+0
	CLRF       _button_press_counter+1
L_Read_Buttons3:
;read_uart.c,15 :: 		if (button_press_counter >= 3*DURATION_OF_DISPLAY_1s)
	MOVLW      2
	SUBWF      _button_press_counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Read_Buttons46
	MOVLW      88
	SUBWF      _button_press_counter+0, 0
L__Read_Buttons46:
	BTFSS      STATUS+0, 0
	GOTO       L_Read_Buttons4
;read_uart.c,17 :: 		button_press_counter = 0;
	CLRF       _button_press_counter+0
	CLRF       _button_press_counter+1
;read_uart.c,19 :: 		clock_set    = clock ;
	MOVLW      4
	MOVWF      R3+0
	MOVLW      _clock_set+0
	MOVWF      R2+0
	MOVLW      _clock+0
	MOVWF      R1+0
L_Read_Buttons5:
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	INCF       R2+0, 1
	INCF       R1+0, 1
	DECF       R3+0, 1
	BTFSS      STATUS+0, 2
	GOTO       L_Read_Buttons5
;read_uart.c,20 :: 		calendar_set = calendar ;
	MOVLW      4
	MOVWF      R3+0
	MOVLW      _calendar_set+0
	MOVWF      R2+0
	MOVLW      _calendar+0
	MOVWF      R1+0
L_Read_Buttons6:
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	INCF       R2+0, 1
	INCF       R1+0, 1
	DECF       R3+0, 1
	BTFSS      STATUS+0, 2
	GOTO       L_Read_Buttons6
;read_uart.c,22 :: 		while((button_press_counter < 3*DURATION_OF_DISPLAY_1s) && (RC5_bit == 1))
L_Read_Buttons7:
	MOVLW      2
	SUBWF      _button_press_counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Read_Buttons47
	MOVLW      88
	SUBWF      _button_press_counter+0, 0
L__Read_Buttons47:
	BTFSC      STATUS+0, 0
	GOTO       L_Read_Buttons8
	BTFSS      RC5_bit+0, 5
	GOTO       L_Read_Buttons8
L__Read_Buttons41:
;read_uart.c,25 :: 		switches_previous.word = switches_current.word;
	MOVF       _switches_current+0, 0
	MOVWF      _switches_previous+0
;read_uart.c,26 :: 		switches_current.word = PORTC ;
	MOVF       PORTC+0, 0
	MOVWF      _switches_current+0
;read_uart.c,27 :: 		button_press_counter = ((switches_current.bits.button1 == 0) && (switches_current.bits.button1 == switches_previous.bits.button1))? button_press_counter+1 : 0 ;
	CLRF       R1+0
	BTFSC      _switches_current+0, 0
	INCF       R1+0, 1
	MOVF       R1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Read_Buttons13
	CLRF       R2+0
	BTFSC      _switches_current+0, 0
	INCF       R2+0, 1
	CLRF       R1+0
	BTFSC      _switches_previous+0, 0
	INCF       R1+0, 1
	MOVF       R2+0, 0
	XORWF      R1+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Read_Buttons13
L__Read_Buttons40:
	MOVF       _button_press_counter+0, 0
	ADDLW      1
	MOVWF      R0+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _button_press_counter+1, 0
	MOVWF      R0+1
	GOTO       L_Read_Buttons14
L_Read_Buttons13:
	CLRF       R0+0
	CLRF       R0+1
L_Read_Buttons14:
	MOVF       R0+0, 0
	MOVWF      _button_press_counter+0
	MOVF       R0+1, 0
	MOVWF      _button_press_counter+1
;read_uart.c,29 :: 		if(!switches_current.bits.button3 && switches_previous.bits.button3)
	BTFSC      _switches_current+0, 2
	GOTO       L_Read_Buttons17
	BTFSS      _switches_previous+0, 2
	GOTO       L_Read_Buttons17
L__Read_Buttons39:
;read_uart.c,31 :: 		switch(settings)
	GOTO       L_Read_Buttons18
;read_uart.c,33 :: 		case SET_MIN :
L_Read_Buttons20:
;read_uart.c,34 :: 		settings = SET_HOUR;
	MOVLW      2
	MOVWF      _settings+0
;read_uart.c,35 :: 		break;
	GOTO       L_Read_Buttons19
;read_uart.c,37 :: 		case SET_HOUR :
L_Read_Buttons21:
;read_uart.c,38 :: 		settings = SET_DAY;
	MOVLW      3
	MOVWF      _settings+0
;read_uart.c,39 :: 		break;
	GOTO       L_Read_Buttons19
;read_uart.c,41 :: 		case SET_DAY :
L_Read_Buttons22:
;read_uart.c,42 :: 		settings = SET_MONTH;
	MOVLW      4
	MOVWF      _settings+0
;read_uart.c,43 :: 		break;
	GOTO       L_Read_Buttons19
;read_uart.c,45 :: 		case SET_MONTH :
L_Read_Buttons23:
;read_uart.c,46 :: 		settings = SET_MIN;
	MOVLW      1
	MOVWF      _settings+0
;read_uart.c,47 :: 		break;
	GOTO       L_Read_Buttons19
;read_uart.c,48 :: 		}
L_Read_Buttons18:
	MOVF       _settings+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Read_Buttons20
	MOVF       _settings+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_Read_Buttons21
	MOVF       _settings+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_Read_Buttons22
	MOVF       _settings+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_Read_Buttons23
L_Read_Buttons19:
;read_uart.c,49 :: 		}
L_Read_Buttons17:
;read_uart.c,50 :: 		if(!switches_current.bits.button2 && switches_previous.bits.button2)
	BTFSC      _switches_current+0, 1
	GOTO       L_Read_Buttons26
	BTFSS      _switches_previous+0, 1
	GOTO       L_Read_Buttons26
L__Read_Buttons38:
;read_uart.c,52 :: 		switch(settings)
	GOTO       L_Read_Buttons27
;read_uart.c,54 :: 		case SET_MIN :
L_Read_Buttons29:
;read_uart.c,55 :: 		temp = clock_set.digit_2*10 + clock_set.digit_1;
	MOVLW      240
	ANDWF      _clock_set+0, 0
	MOVWF      R4+0
	RRF        R4+0, 1
	BCF        R4+0, 7
	RRF        R4+0, 1
	BCF        R4+0, 7
	RRF        R4+0, 1
	BCF        R4+0, 7
	RRF        R4+0, 1
	BCF        R4+0, 7
	MOVLW      10
	MOVWF      R0+0
	CALL       _Mul_8x8_U+0
	MOVLW      15
	ANDWF      _clock_set+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ADDWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      Read_Buttons_temp_L0+0
;read_uart.c,56 :: 		temp = (temp + 1) % 60 ;
	MOVLW      1
	ADDWF      R0+0, 1
	CLRF       R0+1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVLW      60
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      Read_Buttons_temp_L0+0
;read_uart.c,57 :: 		clock_set.digit_1 = temp%10;
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       _clock_set+0, 0
	XORWF      R0+0, 1
	MOVLW      15
	ANDWF      R0+0, 1
	MOVF       _clock_set+0, 0
	XORWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      _clock_set+0
;read_uart.c,58 :: 		clock_set.digit_2 = temp/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       Read_Buttons_temp_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVLW      4
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      R2+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVF       R2+0, 0
L__Read_Buttons48:
	BTFSC      STATUS+0, 2
	GOTO       L__Read_Buttons49
	RLF        R1+0, 1
	BCF        R1+0, 0
	ADDLW      255
	GOTO       L__Read_Buttons48
L__Read_Buttons49:
	MOVF       _clock_set+0, 0
	XORWF      R1+0, 1
	MOVLW      240
	ANDWF      R1+0, 1
	MOVF       _clock_set+0, 0
	XORWF      R1+0, 1
	MOVF       R1+0, 0
	MOVWF      _clock_set+0
;read_uart.c,59 :: 		break;
	GOTO       L_Read_Buttons28
;read_uart.c,61 :: 		case SET_HOUR :
L_Read_Buttons30:
;read_uart.c,62 :: 		temp = clock_set.digit_4*10 + clock_set.digit_3;
	MOVLW      240
	ANDWF      _clock_set+1, 0
	MOVWF      R4+0
	RRF        R4+0, 1
	BCF        R4+0, 7
	RRF        R4+0, 1
	BCF        R4+0, 7
	RRF        R4+0, 1
	BCF        R4+0, 7
	RRF        R4+0, 1
	BCF        R4+0, 7
	MOVLW      10
	MOVWF      R0+0
	CALL       _Mul_8x8_U+0
	MOVLW      15
	ANDWF      _clock_set+1, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ADDWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      Read_Buttons_temp_L0+0
;read_uart.c,63 :: 		temp = (temp + 1) % 24 ;
	MOVLW      1
	ADDWF      R0+0, 1
	CLRF       R0+1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVLW      24
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      Read_Buttons_temp_L0+0
;read_uart.c,64 :: 		clock_set.digit_3 = temp%10;
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       _clock_set+1, 0
	XORWF      R0+0, 1
	MOVLW      15
	ANDWF      R0+0, 1
	MOVF       _clock_set+1, 0
	XORWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      _clock_set+1
;read_uart.c,65 :: 		clock_set.digit_4 = temp/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       Read_Buttons_temp_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVLW      4
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      R2+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVF       R2+0, 0
L__Read_Buttons50:
	BTFSC      STATUS+0, 2
	GOTO       L__Read_Buttons51
	RLF        R1+0, 1
	BCF        R1+0, 0
	ADDLW      255
	GOTO       L__Read_Buttons50
L__Read_Buttons51:
	MOVF       _clock_set+1, 0
	XORWF      R1+0, 1
	MOVLW      240
	ANDWF      R1+0, 1
	MOVF       _clock_set+1, 0
	XORWF      R1+0, 1
	MOVF       R1+0, 0
	MOVWF      _clock_set+1
;read_uart.c,66 :: 		break;
	GOTO       L_Read_Buttons28
;read_uart.c,68 :: 		case SET_MONTH :
L_Read_Buttons31:
;read_uart.c,69 :: 		temp = calendar_set.digit_4*10 + calendar_set.digit_3;
	MOVLW      240
	ANDWF      _calendar_set+1, 0
	MOVWF      R4+0
	RRF        R4+0, 1
	BCF        R4+0, 7
	RRF        R4+0, 1
	BCF        R4+0, 7
	RRF        R4+0, 1
	BCF        R4+0, 7
	RRF        R4+0, 1
	BCF        R4+0, 7
	MOVLW      10
	MOVWF      R0+0
	CALL       _Mul_8x8_U+0
	MOVLW      15
	ANDWF      _calendar_set+1, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ADDWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      Read_Buttons_temp_L0+0
;read_uart.c,70 :: 		temp = (temp + 1) % 32 ; if(temp == 0 ) temp = 1;
	MOVLW      1
	ADDWF      R0+0, 1
	CLRF       R0+1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVLW      32
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      Read_Buttons_temp_L0+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Read_Buttons32
	MOVLW      1
	MOVWF      Read_Buttons_temp_L0+0
L_Read_Buttons32:
;read_uart.c,71 :: 		calendar_set.digit_3 = temp%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       Read_Buttons_temp_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       _calendar_set+1, 0
	XORWF      R0+0, 1
	MOVLW      15
	ANDWF      R0+0, 1
	MOVF       _calendar_set+1, 0
	XORWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      _calendar_set+1
;read_uart.c,72 :: 		calendar_set.digit_4 = temp/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       Read_Buttons_temp_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVLW      4
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      R2+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVF       R2+0, 0
L__Read_Buttons52:
	BTFSC      STATUS+0, 2
	GOTO       L__Read_Buttons53
	RLF        R1+0, 1
	BCF        R1+0, 0
	ADDLW      255
	GOTO       L__Read_Buttons52
L__Read_Buttons53:
	MOVF       _calendar_set+1, 0
	XORWF      R1+0, 1
	MOVLW      240
	ANDWF      R1+0, 1
	MOVF       _calendar_set+1, 0
	XORWF      R1+0, 1
	MOVF       R1+0, 0
	MOVWF      _calendar_set+1
;read_uart.c,73 :: 		break;
	GOTO       L_Read_Buttons28
;read_uart.c,75 :: 		case SET_DAY :
L_Read_Buttons33:
;read_uart.c,76 :: 		temp = calendar_set.digit_2*10 + calendar_set.digit_1;
	MOVLW      240
	ANDWF      _calendar_set+0, 0
	MOVWF      R4+0
	RRF        R4+0, 1
	BCF        R4+0, 7
	RRF        R4+0, 1
	BCF        R4+0, 7
	RRF        R4+0, 1
	BCF        R4+0, 7
	RRF        R4+0, 1
	BCF        R4+0, 7
	MOVLW      10
	MOVWF      R0+0
	CALL       _Mul_8x8_U+0
	MOVLW      15
	ANDWF      _calendar_set+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ADDWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      Read_Buttons_temp_L0+0
;read_uart.c,77 :: 		temp = (temp + 1) % 13 ; if(temp == 0 ) temp = 1;
	MOVLW      1
	ADDWF      R0+0, 1
	CLRF       R0+1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVLW      13
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      Read_Buttons_temp_L0+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Read_Buttons34
	MOVLW      1
	MOVWF      Read_Buttons_temp_L0+0
L_Read_Buttons34:
;read_uart.c,78 :: 		calendar_set.digit_1 = temp%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       Read_Buttons_temp_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       _calendar_set+0, 0
	XORWF      R0+0, 1
	MOVLW      15
	ANDWF      R0+0, 1
	MOVF       _calendar_set+0, 0
	XORWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      _calendar_set+0
;read_uart.c,79 :: 		calendar_set.digit_2 = temp/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       Read_Buttons_temp_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVLW      4
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      R2+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVF       R2+0, 0
L__Read_Buttons54:
	BTFSC      STATUS+0, 2
	GOTO       L__Read_Buttons55
	RLF        R1+0, 1
	BCF        R1+0, 0
	ADDLW      255
	GOTO       L__Read_Buttons54
L__Read_Buttons55:
	MOVF       _calendar_set+0, 0
	XORWF      R1+0, 1
	MOVLW      240
	ANDWF      R1+0, 1
	MOVF       _calendar_set+0, 0
	XORWF      R1+0, 1
	MOVF       R1+0, 0
	MOVWF      _calendar_set+0
;read_uart.c,80 :: 		break;
	GOTO       L_Read_Buttons28
;read_uart.c,81 :: 		}
L_Read_Buttons27:
	MOVF       _settings+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Read_Buttons29
	MOVF       _settings+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_Read_Buttons30
	MOVF       _settings+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_Read_Buttons31
	MOVF       _settings+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_Read_Buttons33
L_Read_Buttons28:
;read_uart.c,82 :: 		}
L_Read_Buttons26:
;read_uart.c,83 :: 		ptr = (settings <= SET_HOUR) ? &clock_set : &calendar_set ;
	MOVF       _settings+0, 0
	SUBLW      2
	BTFSS      STATUS+0, 0
	GOTO       L_Read_Buttons35
	MOVLW      _clock_set+0
	MOVWF      R0+0
	GOTO       L_Read_Buttons36
L_Read_Buttons35:
	MOVLW      _calendar_set+0
	MOVWF      R0+0
L_Read_Buttons36:
	MOVF       R0+0, 0
	MOVWF      _ptr+0
;read_uart.c,84 :: 		print_to_segments(ptr, settings);
	MOVF       R0+0, 0
	MOVWF      FARG_print_to_segments_number+0
	MOVF       _settings+0, 0
	MOVWF      FARG_print_to_segments_setting+0
	CALL       _print_to_segments+0
;read_uart.c,86 :: 		}
	GOTO       L_Read_Buttons7
L_Read_Buttons8:
;read_uart.c,87 :: 		if(button_press_counter >= 3*DURATION_OF_DISPLAY_1s)
	MOVLW      2
	SUBWF      _button_press_counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Read_Buttons56
	MOVLW      88
	SUBWF      _button_press_counter+0, 0
L__Read_Buttons56:
	BTFSS      STATUS+0, 0
	GOTO       L_Read_Buttons37
;read_uart.c,89 :: 		set_date_and_time();
	CALL       _set_date_and_time+0
;read_uart.c,90 :: 		button_press_counter = 0;
	CLRF       _button_press_counter+0
	CLRF       _button_press_counter+1
;read_uart.c,91 :: 		}
L_Read_Buttons37:
;read_uart.c,92 :: 		return;
	GOTO       L_end_Read_Buttons
;read_uart.c,93 :: 		}
L_Read_Buttons4:
;read_uart.c,94 :: 		}
L_end_Read_Buttons:
	RETURN
; end of _Read_Buttons
