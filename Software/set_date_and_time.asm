
_set_date_and_time:

;set_date_and_time.c,3 :: 		void set_date_and_time()
;set_date_and_time.c,6 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;set_date_and_time.c,7 :: 		I2C1_Wr(0xA0); // A0 + GND pin address + W
	MOVLW      160
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;set_date_and_time.c,8 :: 		I2C1_Wr(2);        // register to start from
	MOVLW      2
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;set_date_and_time.c,10 :: 		I2C1_Wr(0);                                                                      // seconde
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;set_date_and_time.c,11 :: 		I2C1_Wr( ((clock_set.digit_2 & 0x0F) << 4) | (clock_set.digit_1 & 0x0F) );       // minute
	MOVLW      240
	ANDWF      _clock_set+0, 0
	MOVWF      R1+0
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	MOVLW      15
	ANDWF      R1+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	RLF        FARG_I2C1_Wr_data_+0, 1
	BCF        FARG_I2C1_Wr_data_+0, 0
	RLF        FARG_I2C1_Wr_data_+0, 1
	BCF        FARG_I2C1_Wr_data_+0, 0
	RLF        FARG_I2C1_Wr_data_+0, 1
	BCF        FARG_I2C1_Wr_data_+0, 0
	RLF        FARG_I2C1_Wr_data_+0, 1
	BCF        FARG_I2C1_Wr_data_+0, 0
	MOVLW      15
	ANDWF      _clock_set+0, 0
	MOVWF      R0+0
	MOVLW      15
	ANDWF      R0+0, 1
	MOVF       R0+0, 0
	IORWF      FARG_I2C1_Wr_data_+0, 1
	CALL       _I2C1_Wr+0
;set_date_and_time.c,12 :: 		I2C1_Wr( ((clock_set.digit_4 & 0x0F) << 4) | (clock_set.digit_3 & 0x0F) );       // hour
	MOVLW      240
	ANDWF      _clock_set+1, 0
	MOVWF      R1+0
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	MOVLW      15
	ANDWF      R1+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	RLF        FARG_I2C1_Wr_data_+0, 1
	BCF        FARG_I2C1_Wr_data_+0, 0
	RLF        FARG_I2C1_Wr_data_+0, 1
	BCF        FARG_I2C1_Wr_data_+0, 0
	RLF        FARG_I2C1_Wr_data_+0, 1
	BCF        FARG_I2C1_Wr_data_+0, 0
	RLF        FARG_I2C1_Wr_data_+0, 1
	BCF        FARG_I2C1_Wr_data_+0, 0
	MOVLW      15
	ANDWF      _clock_set+1, 0
	MOVWF      R0+0
	MOVLW      15
	ANDWF      R0+0, 1
	MOVF       R0+0, 0
	IORWF      FARG_I2C1_Wr_data_+0, 1
	CALL       _I2C1_Wr+0
;set_date_and_time.c,13 :: 		I2C1_Wr( ((calendar_set.digit_4 & 0x0F) << 4) | (calendar_set.digit_3 & 0x0F) ); // day
	MOVLW      240
	ANDWF      _calendar_set+1, 0
	MOVWF      R1+0
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	MOVLW      15
	ANDWF      R1+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	RLF        FARG_I2C1_Wr_data_+0, 1
	BCF        FARG_I2C1_Wr_data_+0, 0
	RLF        FARG_I2C1_Wr_data_+0, 1
	BCF        FARG_I2C1_Wr_data_+0, 0
	RLF        FARG_I2C1_Wr_data_+0, 1
	BCF        FARG_I2C1_Wr_data_+0, 0
	RLF        FARG_I2C1_Wr_data_+0, 1
	BCF        FARG_I2C1_Wr_data_+0, 0
	MOVLW      15
	ANDWF      _calendar_set+1, 0
	MOVWF      R0+0
	MOVLW      15
	ANDWF      R0+0, 1
	MOVF       R0+0, 0
	IORWF      FARG_I2C1_Wr_data_+0, 1
	CALL       _I2C1_Wr+0
;set_date_and_time.c,14 :: 		I2C1_Wr( ((calendar_set.digit_2 & 0x0F) << 4) | (calendar_set.digit_1 & 0x0F) ); // month
	MOVLW      240
	ANDWF      _calendar_set+0, 0
	MOVWF      R1+0
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	MOVLW      15
	ANDWF      R1+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	RLF        FARG_I2C1_Wr_data_+0, 1
	BCF        FARG_I2C1_Wr_data_+0, 0
	RLF        FARG_I2C1_Wr_data_+0, 1
	BCF        FARG_I2C1_Wr_data_+0, 0
	RLF        FARG_I2C1_Wr_data_+0, 1
	BCF        FARG_I2C1_Wr_data_+0, 0
	RLF        FARG_I2C1_Wr_data_+0, 1
	BCF        FARG_I2C1_Wr_data_+0, 0
	MOVLW      15
	ANDWF      _calendar_set+0, 0
	MOVWF      R0+0
	MOVLW      15
	ANDWF      R0+0, 1
	MOVF       R0+0, 0
	IORWF      FARG_I2C1_Wr_data_+0, 1
	CALL       _I2C1_Wr+0
;set_date_and_time.c,16 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;set_date_and_time.c,19 :: 		}
L_end_set_date_and_time:
	RETURN
; end of _set_date_and_time
