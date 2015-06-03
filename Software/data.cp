#line 1 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/data.c"
#line 1 "j:/dropbox/dropbox/f.e.s industries/projets ouadie/hor_temp_7seg/software/public.h"
#line 24 "j:/dropbox/dropbox/f.e.s industries/projets ouadie/hor_temp_7seg/software/public.h"
typedef union buttons_u{
unsigned char word ;

 struct bits_s{
unsigned char button1 : 1 ;
unsigned char button2 : 1 ;
unsigned char button3 : 1 ;
unsigned char spare1 : 1 ;
unsigned char spare2 : 1 ;
unsigned char button4 : 1 ;
unsigned char spare3 : 1 ;
unsigned char spare4 : 1 ;
 } bits;
}buttons_t;

extern buttons_t switches_current ;
extern buttons_t switches_previous ;

extern unsigned int button_press_counter ;

typedef struct digits_struct{
unsigned char digit_1:4;
unsigned char digit_2:4;
unsigned char digit_3:4;
unsigned char digit_4:4;
unsigned char minus :1;
unsigned char type :2;
unsigned char counter ;
}digits_t;
extern digits_t clock, temperature, calendar , clock_set, calendar_set;
#line 60 "j:/dropbox/dropbox/f.e.s industries/projets ouadie/hor_temp_7seg/software/public.h"
extern digits_t *ptr;


extern unsigned char numbers [11] ;
extern unsigned char symbols [ 6];
extern unsigned char segment_select[5] ;

extern unsigned char periode;
extern unsigned char settings;
#line 76 "j:/dropbox/dropbox/f.e.s industries/projets ouadie/hor_temp_7seg/software/public.h"
extern void initialize();
extern void print_to_segments(digits_t *number, char setting);
extern void get_date_time_temp();
extern void set_date_and_time();
extern void Read_Buttons();
#line 2 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/data.c"
digits_t *ptr;
digits_t clock = {0,1,2,2,0, 0x00 ,0};
digits_t temperature = {0,5,3,0,0, 0x01 ,0};
digits_t calendar = {0,0,0,0,0, 0x02 ,0};

digits_t clock_set = {0,0,0,0,0, 0x00 ,0};
digits_t calendar_set = {0,0,0,0,0, 0x02 ,0};

buttons_t switches_current ;
buttons_t switches_previous ;




unsigned char numbers [11] = {126, 66, 236, 230, 210, 182, 190, 98, 254, 246, 0};
unsigned char symbols [ 6] = {96, 48, 128, 80, 128, 0};
unsigned char segment_select[5] = { 0b11011111, 0b11110111, 0b11111011, 0b11111101, 0b11111110};

unsigned char periode;
unsigned char settings =  1 ;



unsigned int button_press_counter = 0;
