
_main:

;Hor_Temp_7Seg.c,19 :: 		void main() {
;Hor_Temp_7Seg.c,21 :: 		initialize();
	CALL       _initialize+0
;Hor_Temp_7Seg.c,23 :: 		while(1)
L_main0:
;Hor_Temp_7Seg.c,26 :: 		if (nb_secondes == 3) display = (display + 1)%3 ;
	MOVF       _nb_secondes+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_main2
	MOVF       _display+0, 0
	ADDLW      1
	MOVWF      R0+0
	CLRF       R0+1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVLW      3
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _display+0
L_main2:
;Hor_Temp_7Seg.c,28 :: 		for(periode = 0; (periode <= DURATION_OF_DISPLAY_1s); periode++)
	CLRF       _periode+0
L_main3:
	MOVF       _periode+0, 0
	SUBLW      200
	BTFSS      STATUS+0, 0
	GOTO       L_main4
;Hor_Temp_7Seg.c,30 :: 		switch(display)
	GOTO       L_main6
;Hor_Temp_7Seg.c,32 :: 		case 0 : // clock
L_main8:
;Hor_Temp_7Seg.c,33 :: 		get_date_time_temp();
	CALL       _get_date_time_temp+0
;Hor_Temp_7Seg.c,34 :: 		print_to_segments(&clock, NO_SETTING);
	MOVLW      _clock+0
	MOVWF      FARG_print_to_segments_number+0
	CLRF       FARG_print_to_segments_setting+0
	CALL       _print_to_segments+0
;Hor_Temp_7Seg.c,35 :: 		break;
	GOTO       L_main7
;Hor_Temp_7Seg.c,36 :: 		case 2 : // temp
L_main9:
;Hor_Temp_7Seg.c,37 :: 		get_date_time_temp();
	CALL       _get_date_time_temp+0
;Hor_Temp_7Seg.c,38 :: 		print_to_segments(&temperature, NO_SETTING);
	MOVLW      _temperature+0
	MOVWF      FARG_print_to_segments_number+0
	CLRF       FARG_print_to_segments_setting+0
	CALL       _print_to_segments+0
;Hor_Temp_7Seg.c,39 :: 		break;
	GOTO       L_main7
;Hor_Temp_7Seg.c,40 :: 		case 1 : // calendar
L_main10:
;Hor_Temp_7Seg.c,41 :: 		get_date_time_temp();
	CALL       _get_date_time_temp+0
;Hor_Temp_7Seg.c,42 :: 		print_to_segments(&calendar, NO_SETTING);
	MOVLW      _calendar+0
	MOVWF      FARG_print_to_segments_number+0
	CLRF       FARG_print_to_segments_setting+0
	CALL       _print_to_segments+0
;Hor_Temp_7Seg.c,43 :: 		break;
	GOTO       L_main7
;Hor_Temp_7Seg.c,44 :: 		}
L_main6:
	MOVF       _display+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main8
	MOVF       _display+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main9
	MOVF       _display+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main10
L_main7:
;Hor_Temp_7Seg.c,45 :: 		if(RC0_bit == 0) Read_Buttons();
	BTFSC      RC0_bit+0, 0
	GOTO       L_main11
	CALL       _Read_Buttons+0
L_main11:
;Hor_Temp_7Seg.c,28 :: 		for(periode = 0; (periode <= DURATION_OF_DISPLAY_1s); periode++)
	INCF       _periode+0, 1
;Hor_Temp_7Seg.c,46 :: 		}
	GOTO       L_main3
L_main4:
;Hor_Temp_7Seg.c,48 :: 		nb_secondes = (nb_secondes + 1) % 4 ;
	MOVF       _nb_secondes+0, 0
	ADDLW      1
	MOVWF      R0+0
	CLRF       R0+1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVLW      4
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _nb_secondes+0
;Hor_Temp_7Seg.c,50 :: 		}
	GOTO       L_main0
;Hor_Temp_7Seg.c,51 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
