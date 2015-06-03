#include "public.h"

void get_date_time_temp()
{
char temp;

//if(chip == 0) // 0 = pcf8583
//{
char seconds, minutes, hours, day, month, year ;
I2C1_Start();
I2C1_Wr(0xA0); // A0 + GND pin address + W
I2C1_Wr(2);        // register to start from
I2C1_Repeated_Start();
I2C1_Wr(0xA1); // A0 + GND pin address + R

seconds = I2C1_Rd(1);
minutes = I2C1_Rd(1);
hours = I2C1_Rd(1);
day = I2C1_Rd(1);
month = I2C1_Rd(1);
year = I2C1_Rd(0);
I2C1_Stop();

//seconds  =  ((seconds & 0xF0) >> 4)*10 + (seconds & 0x0F);  // Transform seconds
//minutes  =  ((minutes & 0xF0) >> 4)*10 + (minutes & 0x0F);  // Transform months
//hours    =  ((hours & 0xF0)  >> 4)*10  + (hours & 0x0F);    // Transform hours
//year     =   (day & 0xC0) >> 6;                             // Transform year
//day      =  ((day & 0x30) >> 4)*10    + (day & 0x0F);       // Transform day
//month    =  ((month & 0x10)  >> 4)*10 + (month & 0x0F);     // Transform month

clock.digit_1 = minutes & 0x0F;
clock.digit_2 = (minutes & 0xF0) >> 4;
clock.digit_3 = hours & 0x0F;
clock.digit_4 = (hours & 0xF0)  >> 4;
//clock.digit_3 = seconds%10;
//clock.digit_4 = (seconds/10)%10;

calendar.digit_1 = month & 0x0F;
calendar.digit_2 = (month & 0x10)  >> 4;
calendar.digit_3 = day & 0x0F;
calendar.digit_4 = (day & 0x30) >> 4;

//}

//else if (chip == 1) // 1 = DS1621
//{

// Read from DS1621 : 0x90
I2C1_Start();
I2C1_Wr(0x90); // 90 + GND pin address + W
I2C1_Wr(0xAA);        // register to start from
I2C1_Repeated_Start();
I2C1_Wr(0x91); // 90 + GND pin address + R

temp = I2C1_Rd(0); // read only one byte, no need to 1/2 resolution
I2C1_Stop();


temperature.minus   = (temp > 0) ? 0 : 1;
temperature.digit_2 =  temp     % 10 ;
temperature.digit_3 = (temp/10) % 10 ;

//}
                                    /*
UART1_Write_Text("i2c read :");

UART1_Write(clock.digit_4 +48);   
UART1_Write(clock.digit_3+48); 
UART1_Write_Text(":");
UART1_Write(clock.digit_2+48); 
UART1_Write(clock.digit_1+48);
UART1_Write_Text("  ");
UART1_Write(temperature.digit_2+48);
UART1_Write(temperature.digit_3+48);
UART1_Write_Text("C ");
  UART1_Write(temp1);
  UART1_Write(temp2);
  UART1_Write(13);
  UART1_Write(10);                */
}