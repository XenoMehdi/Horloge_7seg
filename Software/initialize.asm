
_setup_ds1621:

;initialize.c,2 :: 		void setup_ds1621()
;initialize.c,4 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;initialize.c,5 :: 		I2C1_Wr(0x90);             // connect to DS1621 (#0)
	MOVLW      144
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;initialize.c,6 :: 		I2C1_Wr(0xAC);                            // Access Config
	MOVLW      172
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;initialize.c,7 :: 		I2C1_Wr(0x02);                            // set for continuous conversion
	MOVLW      2
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;initialize.c,8 :: 		I2C1_Repeated_Start();
	CALL       _I2C1_Repeated_Start+0
;initialize.c,9 :: 		I2C1_Wr(0x90);             // restart
	MOVLW      144
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;initialize.c,10 :: 		I2C1_Wr(0xEE);                            // start conversions
	MOVLW      238
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;initialize.c,11 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;initialize.c,12 :: 		}
L_end_setup_ds1621:
	RETURN
; end of _setup_ds1621

_initialize:

;initialize.c,13 :: 		void initialize()
;initialize.c,15 :: 		CMCON = 7; // desable comparator
	MOVLW      7
	MOVWF      CMCON+0
;initialize.c,16 :: 		ADCON1 = 6 ; // all PORTA pins as digital I/O
	MOVLW      6
	MOVWF      ADCON1+0
;initialize.c,17 :: 		TRISA = 0;                           // all PORTA pins as digital outputs
	CLRF       TRISA+0
;initialize.c,18 :: 		TRISB = 0;                          // designate PORTB pins as output
	CLRF       TRISB+0
;initialize.c,19 :: 		TRISC = 0b00100111;
	MOVLW      39
	MOVWF      TRISC+0
;initialize.c,21 :: 		I2C1_Init(100000);
	MOVLW      50
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;initialize.c,24 :: 		setup_ds1621();
	CALL       _setup_ds1621+0
;initialize.c,25 :: 		get_date_time_temp();
	CALL       _get_date_time_temp+0
;initialize.c,30 :: 		}
L_end_initialize:
	RETURN
; end of _initialize
