#line 1 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/Hor_Temp_7Seg.c"
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
#line 17 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/Hor_Temp_7Seg.c"
unsigned char display = 0, nb_secondes = 0 ;

void main() {

initialize();

while(1)
{

if (nb_secondes == 3) display = (display + 1)%3 ;

for(periode = 0; (periode <=  (1000/(5* 1 )) ); periode++)
{
 switch(display)
 {
 case 0 :
 get_date_time_temp();
 print_to_segments(&clock,  0 );
 break;
 case 2 :
 get_date_time_temp();
 print_to_segments(&temperature,  0 );
 break;
 case 1 :
 get_date_time_temp();
 print_to_segments(&calendar,  0 );
 break;
 }
 if(RC0_bit == 0) Read_Buttons();
}

nb_secondes = (nb_secondes + 1) % 4 ;

}
}
