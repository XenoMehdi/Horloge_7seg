#include "public.h"

void set_date_and_time()
{

I2C1_Start();
I2C1_Wr(0xA0); // A0 + GND pin address + W
I2C1_Wr(2);        // register to start from

I2C1_Wr(0);                                                                      // seconde
I2C1_Wr( ((clock_set.digit_2 & 0x0F) << 4) | (clock_set.digit_1 & 0x0F) );       // minute
I2C1_Wr( ((clock_set.digit_4 & 0x0F) << 4) | (clock_set.digit_3 & 0x0F) );       // hour
I2C1_Wr( ((calendar_set.digit_4 & 0x0F) << 4) | (calendar_set.digit_3 & 0x0F) ); // day
I2C1_Wr( ((calendar_set.digit_2 & 0x0F) << 4) | (calendar_set.digit_1 & 0x0F) ); // month

I2C1_Stop();


}