#line 1 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/print_to_segments.c"
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
#line 3 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/print_to_segments.c"
void print_to_segments(digits_t *number, unsigned char setting)
{
switch(number->type)
{

case  0x00  :

PORTB = PORTB & 0x01 ;
PORTA = segment_select[ 0 ] ;

 if(setting ==  0  || setting ==  2 )
 {
 {
 if(setting ==  0  ) PORTB = PORTB | (numbers [number->digit_1%10] & 0xFE) ;
 if(setting ==  2 ) PORTB = PORTB | (numbers [10] & 0xFE) ;
 }
 delay_ms( 1 );

 }else if(setting ==  1 )
 {


 PORTB = PORTB | (numbers [number->digit_1%10] & 0xFE) ;





 delay_ms( 1 );
 }

PORTB = PORTB & 0x01 ;
PORTA = segment_select[ 1 ] ;
 if(setting ==  0  || setting ==  2 )
 {
 {
 if(setting ==  0  ) PORTB = PORTB | (numbers [number->digit_2%10] & 0xFE) ;
 if(setting ==  2  ) PORTB = PORTB | (numbers [10] & 0xFE) ;
 }
 delay_ms( 1 );

 }else if(setting ==  1 )
 {
#line 48 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/print_to_segments.c"
 PORTB = PORTB | (numbers [number->digit_2%10] & 0xFE) ;
#line 54 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/print_to_segments.c"
 delay_ms( 1 );
 }

PORTB = PORTB & 0x01 ;
PORTA = segment_select[ 3 ] ;

 if(setting ==  0  || setting ==  1 )
 {
 {
 if(setting ==  0  ) PORTB = PORTB | (numbers [number->digit_3%10] & 0xFE) ;
 if(setting ==  1  ) PORTB = PORTB | (numbers [10] & 0xFE) ;
 }
 delay_ms( 1 );

 }else if(setting ==  2 )
 {
#line 72 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/print_to_segments.c"
 PORTB = PORTB | (numbers [number->digit_3%10] & 0xFE) ;
#line 78 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/print_to_segments.c"
 delay_ms( 1 );
 }


PORTB = PORTB & 0x01 ;
PORTA = segment_select[ 4 ] ;
 if(setting ==  0  || setting ==  1 )
 {
 {
 if(setting ==  0  ) PORTB = PORTB | (numbers [number->digit_4%10] & 0xFE) ;
 if(setting ==  1  ) PORTB = PORTB | (numbers [10] & 0xFE) ;

 }
 delay_ms( 1 );

 }else if(setting ==  2 )
 {
#line 97 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/print_to_segments.c"
 PORTB = PORTB | (numbers [number->digit_4%10] & 0xFE) ;
#line 103 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/print_to_segments.c"
 delay_ms( 1 );
 }

PORTB = PORTB & 0x01 ;
PORTA = segment_select[ 2 ] ;
 if(setting ==  0 )
 {
 if(number->counter <  (500/(5* 1 )) )
 {
 PORTB = PORTB | (symbols [0] & 0xFE) ;
 }
 else
 {
 PORTB = PORTB | (symbols [5] & 0xFE) ;
 }
 delay_ms( 1 );

 }else if(setting ==  1  || setting ==  2 )
 {
 PORTB = PORTB | (symbols [0] & 0xFE) ;
 delay_ms( 1 );
 }

if( number->counter <  (500/(5* 1 )) *2)
{number->counter++;}
else
{number->counter=0;}

break;

case  0x01  :

PORTB = PORTB & 0x01 ;
PORTA = segment_select[ 0 ] ;
{PORTB = PORTB | (numbers [10] & 0xFE) ;}
delay_ms( 1 );


PORTB = PORTB & 0x01 ;
PORTA = segment_select[ 1 ] ;
{PORTB = PORTB | (numbers [number->digit_2%10] & 0xFE) ;}
delay_ms( 1 );


PORTB = PORTB & 0x01 ;
PORTA = segment_select[ 3 ] ;
{PORTB = PORTB | (numbers [number->digit_3%10] & 0xFE) ;}
delay_ms( 1 );


PORTB = PORTB & 0x01 ;
PORTA = segment_select[ 4 ] ;
if(number->minus == 1)
{PORTB = PORTB | (symbols [4] & 0xFE) ;}
else
{
PORTA = 255 ;
PORTB = PORTB | (numbers [10] & 0xFE) ;}
delay_ms( 1 );


PORTB = PORTB & 0x01 ;
PORTA = segment_select[ 2 ] ;
{PORTB = PORTB | (symbols [2] & 0xFE) ;}
delay_ms( 1 );

number->counter=0;
break;

case  0x02  :


PORTB = PORTB & 0x01 ;
PORTA = segment_select[ 0 ] ;
 if(setting ==  0  || setting ==  4 )
 {
 {
 if(setting ==  0  ) PORTB = PORTB | (numbers [number->digit_1%10] & 0xFE) ;
 if(setting ==  4  ) PORTB = PORTB | (numbers [10] & 0xFE) ;

 }
 delay_ms( 1 );

 }else if(setting ==  3 )
 {
#line 190 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/print_to_segments.c"
 PORTB = PORTB | (numbers [number->digit_1%10] & 0xFE) ;
#line 196 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/print_to_segments.c"
 delay_ms( 1 );
 }

PORTB = PORTB & 0x01 ;
PORTA = segment_select[ 1 ] ;
 if(setting ==  0  || setting ==  4 )
 {
 if(setting ==  0  ){
 if (number->digit_2 == 1)
 {PORTB = PORTB | (numbers [1] & 0xFE) ;}
 else
 {PORTB = PORTB | (numbers [10] & 0xFE) ;}
 }
 if(setting ==  4  ) PORTB = PORTB | (numbers [10] & 0xFE) ;

 delay_ms( 1 );

 }else if(setting ==  3 )
 {
#line 217 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/print_to_segments.c"
 if (number->digit_2 == 1)
 {PORTB = PORTB | (numbers [1] & 0xFE) ;}
 else
 {PORTB = PORTB | (numbers [10] & 0xFE) ;}
#line 227 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/print_to_segments.c"
 delay_ms( 1 );
 }



PORTB = PORTB & 0x01 ;
PORTA = segment_select[ 3 ] ;
 if(setting ==  0  || setting ==  3 )
 {
 {
 if(setting ==  0  ) PORTB = PORTB | (numbers [number->digit_3%10] & 0xFE) ;
 if(setting ==  3  ) PORTB = PORTB | (numbers [10] & 0xFE) ;

 }
 delay_ms( 1 );

 }else if(setting ==  4 )
 {
#line 247 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/print_to_segments.c"
 PORTB = PORTB | (numbers [number->digit_3%10] & 0xFE) ;
#line 253 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/print_to_segments.c"
 delay_ms( 1 );
 }


PORTB = PORTB & 0x01 ;
PORTA = segment_select[ 4 ] ;
 if(setting ==  0  || setting ==  3 )
 {
 {
 if(setting ==  0  ) PORTB = PORTB | (numbers [number->digit_4%10] & 0xFE) ;
 if(setting ==  3  ) PORTB = PORTB | (numbers [10] & 0xFE) ;

 }
 delay_ms( 1 );

 }else if(setting ==  4 )
 {
#line 272 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/print_to_segments.c"
 PORTB = PORTB | (numbers [number->digit_4%10] & 0xFE) ;
#line 278 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/print_to_segments.c"
 delay_ms( 1 );
 }



PORTB = PORTB & 0x01 ;
PORTA = segment_select[ 2 ] ;
{PORTB = PORTB | (symbols [1] & 0xFE) ;}
delay_ms( 1 );

if( number->counter <  (500/(5* 1 )) *2)
{number->counter++;}
else
{number->counter=0;}

break;

default:
number->counter=0;
break;
}
}
