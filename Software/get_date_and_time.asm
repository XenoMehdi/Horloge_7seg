
_get_date_time_temp:

;get_date_and_time.c,3 :: 		void get_date_time_temp()
;get_date_and_time.c,10 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;get_date_and_time.c,11 :: 		I2C1_Wr(0xA0); // A0 + GND pin address + W
	MOVLW      160
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;get_date_and_time.c,12 :: 		I2C1_Wr(2);        // register to start from
	MOVLW      2
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;get_date_and_time.c,13 :: 		I2C1_Repeated_Start();
	CALL       _I2C1_Repeated_Start+0
;get_date_and_time.c,14 :: 		I2C1_Wr(0xA1); // A0 + GND pin address + R
	MOVLW      161
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;get_date_and_time.c,16 :: 		seconds = I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
;get_date_and_time.c,17 :: 		minutes = I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      get_date_time_temp_minutes_L0+0
;get_date_and_time.c,18 :: 		hours = I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      get_date_time_temp_hours_L0+0
;get_date_and_time.c,19 :: 		day = I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      get_date_time_temp_day_L0+0
;get_date_and_time.c,20 :: 		month = I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      get_date_time_temp_month_L0+0
;get_date_and_time.c,21 :: 		year = I2C1_Rd(0);
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
;get_date_and_time.c,22 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;get_date_and_time.c,31 :: 		clock.digit_1 = minutes & 0x0F;
	MOVLW      15
	ANDWF      get_date_time_temp_minutes_L0+0, 0
	MOVWF      R0+0
	MOVF       _clock+0, 0
	XORWF      R0+0, 1
	MOVLW      15
	ANDWF      R0+0, 1
	MOVF       _clock+0, 0
	XORWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      _clock+0
;get_date_and_time.c,32 :: 		clock.digit_2 = (minutes & 0xF0) >> 4;
	MOVLW      240
	ANDWF      get_date_time_temp_minutes_L0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      R2+0
	RRF        R2+0, 1
	BCF        R2+0, 7
	RRF        R2+0, 1
	BCF        R2+0, 7
	RRF        R2+0, 1
	BCF        R2+0, 7
	RRF        R2+0, 1
	BCF        R2+0, 7
	MOVLW      4
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__get_date_time_temp3:
	BTFSC      STATUS+0, 2
	GOTO       L__get_date_time_temp4
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__get_date_time_temp3
L__get_date_time_temp4:
	MOVF       _clock+0, 0
	XORWF      R0+0, 1
	MOVLW      240
	ANDWF      R0+0, 1
	MOVF       _clock+0, 0
	XORWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      _clock+0
;get_date_and_time.c,33 :: 		clock.digit_3 = hours & 0x0F;
	MOVLW      15
	ANDWF      get_date_time_temp_hours_L0+0, 0
	MOVWF      R0+0
	MOVF       _clock+1, 0
	XORWF      R0+0, 1
	MOVLW      15
	ANDWF      R0+0, 1
	MOVF       _clock+1, 0
	XORWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      _clock+1
;get_date_and_time.c,34 :: 		clock.digit_4 = (hours & 0xF0)  >> 4;
	MOVLW      240
	ANDWF      get_date_time_temp_hours_L0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      R2+0
	RRF        R2+0, 1
	BCF        R2+0, 7
	RRF        R2+0, 1
	BCF        R2+0, 7
	RRF        R2+0, 1
	BCF        R2+0, 7
	RRF        R2+0, 1
	BCF        R2+0, 7
	MOVLW      4
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__get_date_time_temp5:
	BTFSC      STATUS+0, 2
	GOTO       L__get_date_time_temp6
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__get_date_time_temp5
L__get_date_time_temp6:
	MOVF       _clock+1, 0
	XORWF      R0+0, 1
	MOVLW      240
	ANDWF      R0+0, 1
	MOVF       _clock+1, 0
	XORWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      _clock+1
;get_date_and_time.c,38 :: 		calendar.digit_1 = month & 0x0F;
	MOVLW      15
	ANDWF      get_date_time_temp_month_L0+0, 0
	MOVWF      R0+0
	MOVF       _calendar+0, 0
	XORWF      R0+0, 1
	MOVLW      15
	ANDWF      R0+0, 1
	MOVF       _calendar+0, 0
	XORWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      _calendar+0
;get_date_and_time.c,39 :: 		calendar.digit_2 = (month & 0x10)  >> 4;
	MOVLW      16
	ANDWF      get_date_time_temp_month_L0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      R2+0
	RRF        R2+0, 1
	BCF        R2+0, 7
	RRF        R2+0, 1
	BCF        R2+0, 7
	RRF        R2+0, 1
	BCF        R2+0, 7
	RRF        R2+0, 1
	BCF        R2+0, 7
	MOVLW      4
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__get_date_time_temp7:
	BTFSC      STATUS+0, 2
	GOTO       L__get_date_time_temp8
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__get_date_time_temp7
L__get_date_time_temp8:
	MOVF       _calendar+0, 0
	XORWF      R0+0, 1
	MOVLW      240
	ANDWF      R0+0, 1
	MOVF       _calendar+0, 0
	XORWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      _calendar+0
;get_date_and_time.c,40 :: 		calendar.digit_3 = day & 0x0F;
	MOVLW      15
	ANDWF      get_date_time_temp_day_L0+0, 0
	MOVWF      R0+0
	MOVF       _calendar+1, 0
	XORWF      R0+0, 1
	MOVLW      15
	ANDWF      R0+0, 1
	MOVF       _calendar+1, 0
	XORWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      _calendar+1
;get_date_and_time.c,41 :: 		calendar.digit_4 = (day & 0x30) >> 4;
	MOVLW      48
	ANDWF      get_date_time_temp_day_L0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      R2+0
	RRF        R2+0, 1
	BCF        R2+0, 7
	RRF        R2+0, 1
	BCF        R2+0, 7
	RRF        R2+0, 1
	BCF        R2+0, 7
	RRF        R2+0, 1
	BCF        R2+0, 7
	MOVLW      4
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__get_date_time_temp9:
	BTFSC      STATUS+0, 2
	GOTO       L__get_date_time_temp10
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__get_date_time_temp9
L__get_date_time_temp10:
	MOVF       _calendar+1, 0
	XORWF      R0+0, 1
	MOVLW      240
	ANDWF      R0+0, 1
	MOVF       _calendar+1, 0
	XORWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      _calendar+1
;get_date_and_time.c,49 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;get_date_and_time.c,50 :: 		I2C1_Wr(0x90); // 90 + GND pin address + W
	MOVLW      144
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;get_date_and_time.c,51 :: 		I2C1_Wr(0xAA);        // register to start from
	MOVLW      170
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;get_date_and_time.c,52 :: 		I2C1_Repeated_Start();
	CALL       _I2C1_Repeated_Start+0
;get_date_and_time.c,53 :: 		I2C1_Wr(0x91); // 90 + GND pin address + R
	MOVLW      145
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;get_date_and_time.c,55 :: 		temp = I2C1_Rd(0); // read only one byte, no need to 1/2 resolution
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      get_date_time_temp_temp_L0+0
;get_date_and_time.c,56 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;get_date_and_time.c,59 :: 		temperature.minus   = (temp > 0) ? 0 : 1;
	MOVF       get_date_time_temp_temp_L0+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_get_date_time_temp0
	CLRF       R0+0
	GOTO       L_get_date_time_temp1
L_get_date_time_temp0:
	MOVLW      1
	MOVWF      R0+0
L_get_date_time_temp1:
	BTFSC      R0+0, 0
	GOTO       L__get_date_time_temp11
	BCF        _temperature+2, 0
	GOTO       L__get_date_time_temp12
L__get_date_time_temp11:
	BSF        _temperature+2, 0
L__get_date_time_temp12:
;get_date_and_time.c,60 :: 		temperature.digit_2 =  temp     % 10 ;
	MOVLW      10
	MOVWF      R4+0
	MOVF       get_date_time_temp_temp_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      4
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      R2+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVF       R2+0, 0
L__get_date_time_temp13:
	BTFSC      STATUS+0, 2
	GOTO       L__get_date_time_temp14
	RLF        R1+0, 1
	BCF        R1+0, 0
	ADDLW      255
	GOTO       L__get_date_time_temp13
L__get_date_time_temp14:
	MOVF       _temperature+0, 0
	XORWF      R1+0, 1
	MOVLW      240
	ANDWF      R1+0, 1
	MOVF       _temperature+0, 0
	XORWF      R1+0, 1
	MOVF       R1+0, 0
	MOVWF      _temperature+0
;get_date_and_time.c,61 :: 		temperature.digit_3 = (temp/10) % 10 ;
	MOVLW      10
	MOVWF      R4+0
	MOVF       get_date_time_temp_temp_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       _temperature+1, 0
	XORWF      R0+0, 1
	MOVLW      15
	ANDWF      R0+0, 1
	MOVF       _temperature+1, 0
	XORWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      _temperature+1
;get_date_and_time.c,80 :: 		}
L_end_get_date_time_temp:
	RETURN
; end of _get_date_time_temp
