#include "public.h"
digits_t *ptr;
digits_t clock = {0,1,2,2,0,CLOCK_TYPE,0};
digits_t temperature = {0,5,3,0,0,TEMP_TYPE,0};
digits_t calendar = {0,0,0,0,0,CALENDAR_TYPE,0};

digits_t clock_set = {0,0,0,0,0,CLOCK_TYPE,0};
digits_t calendar_set = {0,0,0,0,0,CALENDAR_TYPE,0};

buttons_t switches_current ;
buttons_t switches_previous ;
//pin_state_t IR_NEC_remote = {0, 0} ;
/********************* Data ****************/
//int i,j,n;
// old int numbers [11] = {252, 132, 110, 206, 150, 218, 250, 140, 254, 222, 0}; // 0123456789' '
unsigned char numbers [11] = {126, 66, 236, 230, 210, 182, 190, 98, 254, 246, 0}; // 0123456789' '
unsigned char symbols [ 6] = {96, 48, 128, 80, 128, 0};              // ':', '/', '°' , '\' and '-' only for seg4, ' '
unsigned char segment_select[5] = { 0b11011111, 0b11110111, 0b11111011, 0b11111101, 0b11111110};

unsigned char periode;
unsigned char settings = SET_MIN;
//unsigned int delay_bit_counter=0;
//unsigned char bits_counter=0, data_ir_received=0;
//unsigned long int data_ir=0;
unsigned int button_press_counter = 0;

//char uart_rx_data[20] , char_, index, uart_rx_data_received=0;