
#define CHARACTER_DELAY 1
#define COUNTER_EQUAL_TO_500MS  (500/(5*CHARACTER_DELAY))
#define COUNTER_EQUAL_TO_750MS  (750/(5*CHARACTER_DELAY))
#define DURATION_OF_DISPLAY_1s     (1000/(5*CHARACTER_DELAY))

#define SEGMENT_1       0
#define SEGMENT_2       1
#define SEGMENT_3       3
#define SEGMENT_4       4
#define SEGMENT_5       2

#define CLOCK_TYPE      0x00
#define TEMP_TYPE       0x01
#define CALENDAR_TYPE   0x02


#define NO_SETTING 0
#define SET_MIN    1
#define SET_HOUR   2
#define SET_DAY    3
#define SET_MONTH  4

typedef union buttons_u{
unsigned char   word ;

       struct   bits_s{
unsigned char   button1 : 1 ;
unsigned char   button2 : 1 ;
unsigned char   button3 : 1 ;
unsigned char   spare1  : 1 ;
unsigned char   spare2  : 1 ;
unsigned char   button4 : 1 ;
unsigned char   spare3  : 1 ;
unsigned char   spare4  : 1 ;
                     } bits;
}buttons_t;

extern  buttons_t switches_current ;
extern  buttons_t switches_previous ;

extern unsigned int button_press_counter ;

typedef struct digits_struct{
unsigned char digit_1:4;
unsigned char digit_2:4;
unsigned char digit_3:4;
unsigned char digit_4:4;
unsigned char minus  :1;
unsigned char type   :2;
unsigned char counter  ;
}digits_t;
extern digits_t clock, temperature, calendar , clock_set, calendar_set;
extern digits_t *ptr;                             /*
typedef struct pin_state_s{
char current :1;
char previous:1;
}pin_state_t;
extern pin_state_t IR_NEC_remote ;
                               */
/********************* Data ****************/
//extern int i,j,n;
extern unsigned char numbers [11] ;
extern unsigned char symbols [ 6];
extern unsigned char segment_select[5] ;

extern unsigned char periode;
extern unsigned char settings;
/*extern unsigned int delay_bit_counter;
extern unsigned char bits_counter, data_ir_received;
extern unsigned long int data_ir;

extern char uart_rx_data[20] , char_, index, uart_rx_data_received;
  */
/********************* Functions ****************/
extern void initialize();
extern void print_to_segments(digits_t *number, char setting); // 0 -> no setting, 1 = minutes, 2 = hours, 3 days, 4 = months
extern void get_date_time_temp();
extern void set_date_and_time();
extern void Read_Buttons();