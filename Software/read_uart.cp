#line 1 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/read_uart.c"
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
#line 3 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/read_uart.c"
void Read_Buttons()
{
 char temp;

 switches_previous.word = switches_current.word;
 switches_current.word = PORTC ;

 if((switches_current.bits.button1 == 0) && (switches_current.bits.button1 == switches_previous.bits.button1))
 {button_press_counter++;}
 else
 {button_press_counter = 0 ;}

 if (button_press_counter >= 3* (1000/(5* 1 )) )
 {
 button_press_counter = 0;

 clock_set = clock ;
 calendar_set = calendar ;

 while((button_press_counter < 3* (1000/(5* 1 )) ) && (RC5_bit == 1))
 {

 switches_previous.word = switches_current.word;
 switches_current.word = PORTC ;
 button_press_counter = ((switches_current.bits.button1 == 0) && (switches_current.bits.button1 == switches_previous.bits.button1))? button_press_counter+1 : 0 ;

 if(!switches_current.bits.button3 && switches_previous.bits.button3)
 {
 switch(settings)
 {
 case  1  :
 settings =  2 ;
 break;

 case  2  :
 settings =  3 ;
 break;

 case  3  :
 settings =  4 ;
 break;

 case  4  :
 settings =  1 ;
 break;
 }
 }
 if(!switches_current.bits.button2 && switches_previous.bits.button2)
 {
 switch(settings)
 {
 case  1  :
 temp = clock_set.digit_2*10 + clock_set.digit_1;
 temp = (temp + 1) % 60 ;
 clock_set.digit_1 = temp%10;
 clock_set.digit_2 = temp/10;
 break;

 case  2  :
 temp = clock_set.digit_4*10 + clock_set.digit_3;
 temp = (temp + 1) % 24 ;
 clock_set.digit_3 = temp%10;
 clock_set.digit_4 = temp/10;
 break;

 case  4  :
 temp = calendar_set.digit_4*10 + calendar_set.digit_3;
 temp = (temp + 1) % 32 ; if(temp == 0 ) temp = 1;
 calendar_set.digit_3 = temp%10;
 calendar_set.digit_4 = temp/10;
 break;

 case  3  :
 temp = calendar_set.digit_2*10 + calendar_set.digit_1;
 temp = (temp + 1) % 13 ; if(temp == 0 ) temp = 1;
 calendar_set.digit_1 = temp%10;
 calendar_set.digit_2 = temp/10;
 break;
 }
 }
 ptr = (settings <=  2 ) ? &clock_set : &calendar_set ;
 print_to_segments(ptr, settings);

 }
 if(button_press_counter >= 3* (1000/(5* 1 )) )
 {
 set_date_and_time();
 button_press_counter = 0;
 }
 return;
 }
}
