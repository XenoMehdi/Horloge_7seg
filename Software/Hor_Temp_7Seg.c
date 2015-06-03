#include "public.h"
//Timer0
//Prescaler 1:2; TMR0 Preload = 6; Actual Interrupt Time : 100 us
/*void InitTimer0(){
  OPTION_REG         = 0x80;
  TMR0                 = 6;
  INTCON         = 0xA0;
} *//*
void Interrupt(){
  if (TMR0IF_bit){
    TMR0IF_bit         = 0;
    TMR0               = 6;
    Read_Buttons();
  }
}   */

unsigned char display = 0, nb_secondes = 0 ;
//char settings_set ;
void main() {
//InitTimer0();
initialize();

while(1)
{

if (nb_secondes == 3) display = (display + 1)%3 ;

for(periode = 0; (periode <= DURATION_OF_DISPLAY_1s); periode++)
{
    switch(display)
        {
        case 0 : // clock
        get_date_time_temp();
        print_to_segments(&clock, NO_SETTING);
        break;
        case 2 : // temp
        get_date_time_temp();
        print_to_segments(&temperature, NO_SETTING);
        break;
        case 1 : // calendar
        get_date_time_temp();
        print_to_segments(&calendar, NO_SETTING);
        break;
        }
   if(RC0_bit == 0) Read_Buttons();
}

nb_secondes = (nb_secondes + 1) % 4 ;

}
}