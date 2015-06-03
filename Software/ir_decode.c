#include "public.h"

void IR_decode(){
/*switch(state)
{
case IDLE :
if(IR_NEC_remote.previous == 1 && IR_NEC_remote.current == 0)
state = LOOK_FOR_LEADING_PULSE;
delay_bit_counter=0;
break;

case LOOK_FOR_LEADING_PULSE :
if((IR_NEC_remote.current == 0 && IR_NEC_remote.previous == 0 ) && delay_bit_counter < 95)
{
delay_bit_counter++;
}
else if (IR_NEC_remote.current == 1 && IR_NEC_remote.previous == 0 && delay_bit_counter > 90)
{
state = LOOK_FOR_SPACE;
delay_bit_counter = 0;
}
else
{
state = IDLE;
delay_bit_counter = 0;
}

break;

case LOOK_FOR_SPACE :
if(IR_NEC_remote.current == 1 && IR_NEC_remote.previous == 1 && delay_bit_counter < 50)
delay_bit_counter++;
else if (IR_NEC_remote.current == 0 && IR_NEC_remote.previous == 1 && delay_bit_counter > 45)
{
state = LOOK_FOR_DATA;
delay_bit_counter = 0;
}
else
{
state = IDLE;
delay_bit_counter = 0;
}
break;

case LOOK_FOR_DATA :
     if(bits_counter <32)
     {
     delay_bit_counter++;
     if(IR_NEC_remote.current == 0 && IR_NEC_remote.previous == 1 )
                              {
                              if( delay_bit_counter < 15)
                                  {    // 0 has been detected
                                  data_ir = data_ir << 1;
                                  bits_counter++;
                                  delay_bit_counter=0;
                                  }
                              else if ( delay_bit_counter < 30)
                                   {    // 1 has been detected
                                   data_ir = data_ir << 1;
                                   data_ir |= 0x00000001;
                                   bits_counter++;
                                   delay_bit_counter=0;
                                   }
                              else
                                  {
                                  state = IDLE;
                                  delay_bit_counter = 0;
                                  }
                              }
     else
         {
         data_ir_received = 1;
         bits_counter = 0;
         state = IDLE;
         delay_bit_counter = 0;
         }
     }
break;
} */

}