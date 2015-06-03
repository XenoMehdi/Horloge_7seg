#line 1 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/get_date_and_time.c"
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
#line 3 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/get_date_and_time.c"
void get_date_time_temp()
{
char temp;



char seconds, minutes, hours, day, month, year ;
I2C1_Start();
I2C1_Wr(0xA0);
I2C1_Wr(2);
I2C1_Repeated_Start();
I2C1_Wr(0xA1);

seconds = I2C1_Rd(1);
minutes = I2C1_Rd(1);
hours = I2C1_Rd(1);
day = I2C1_Rd(1);
month = I2C1_Rd(1);
year = I2C1_Rd(0);
I2C1_Stop();








clock.digit_1 = minutes & 0x0F;
clock.digit_2 = (minutes & 0xF0) >> 4;
clock.digit_3 = hours & 0x0F;
clock.digit_4 = (hours & 0xF0) >> 4;



calendar.digit_1 = month & 0x0F;
calendar.digit_2 = (month & 0x10) >> 4;
calendar.digit_3 = day & 0x0F;
calendar.digit_4 = (day & 0x30) >> 4;







I2C1_Start();
I2C1_Wr(0x90);
I2C1_Wr(0xAA);
I2C1_Repeated_Start();
I2C1_Wr(0x91);

temp = I2C1_Rd(0);
I2C1_Stop();


temperature.minus = (temp > 0) ? 0 : 1;
temperature.digit_2 = temp % 10 ;
temperature.digit_3 = (temp/10) % 10 ;
#line 80 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/get_date_and_time.c"
}
