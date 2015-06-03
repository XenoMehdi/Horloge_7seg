#include "public.h"

void Read_Buttons()
{
   char temp;
   
   switches_previous.word = switches_current.word;
   switches_current.word = PORTC ;

   if((switches_current.bits.button1 == 0) && (switches_current.bits.button1 == switches_previous.bits.button1))
   {button_press_counter++;}
   else
   {button_press_counter = 0 ;}
   
   if (button_press_counter >= 3*DURATION_OF_DISPLAY_1s)
   {
   button_press_counter = 0;

   clock_set    = clock ;
   calendar_set = calendar ;

   while((button_press_counter < 3*DURATION_OF_DISPLAY_1s) && (RC5_bit == 1))
   {  // tant que le button4 'cancel' n'est pas appuyé et le boutton save nest pas appuyé our 3 secondes

      switches_previous.word = switches_current.word;
      switches_current.word = PORTC ;
      button_press_counter = ((switches_current.bits.button1 == 0) && (switches_current.bits.button1 == switches_previous.bits.button1))? button_press_counter+1 : 0 ;

      if(!switches_current.bits.button3 && switches_previous.bits.button3)
      {
       switch(settings)
       {
       case SET_MIN :
       settings = SET_HOUR;
       break;

        case SET_HOUR :
        settings = SET_DAY;
        break;

        case SET_DAY :
        settings = SET_MONTH;
        break;

        case SET_MONTH :
        settings = SET_MIN;
        break;
        }
      }
      if(!switches_current.bits.button2 && switches_previous.bits.button2)
      {
        switch(settings)
        {
        case SET_MIN :
        temp = clock_set.digit_2*10 + clock_set.digit_1;
        temp = (temp + 1) % 60 ;
        clock_set.digit_1 = temp%10;
        clock_set.digit_2 = temp/10;
        break;

        case SET_HOUR :
        temp = clock_set.digit_4*10 + clock_set.digit_3;
        temp = (temp + 1) % 24 ;
        clock_set.digit_3 = temp%10;
        clock_set.digit_4 = temp/10;
        break;

        case SET_MONTH :
        temp = calendar_set.digit_4*10 + calendar_set.digit_3;
        temp = (temp + 1) % 32 ; if(temp == 0 ) temp = 1;
        calendar_set.digit_3 = temp%10;
        calendar_set.digit_4 = temp/10;
        break;

        case SET_DAY :
        temp = calendar_set.digit_2*10 + calendar_set.digit_1;
        temp = (temp + 1) % 13 ; if(temp == 0 ) temp = 1;
        calendar_set.digit_1 = temp%10;
        calendar_set.digit_2 = temp/10;
        break;
        }
      }
      ptr = (settings <= SET_HOUR) ? &clock_set : &calendar_set ;
      print_to_segments(ptr, settings);
      
      }
      if(button_press_counter >= 3*DURATION_OF_DISPLAY_1s)
         {
         set_date_and_time();
         button_press_counter = 0;
         }
      return;
  }
}