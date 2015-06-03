#include "public.h"
void setup_ds1621()
{
    I2C1_Start();
    I2C1_Wr(0x90);             // connect to DS1621 (#0)
    I2C1_Wr(0xAC);                            // Access Config
    I2C1_Wr(0x02);                            // set for continuous conversion
    I2C1_Repeated_Start();
    I2C1_Wr(0x90);             // restart
    I2C1_Wr(0xEE);                            // start conversions
    I2C1_Stop();
}
void initialize()
{
  CMCON = 7; // desable comparator
  ADCON1 = 6 ; // all PORTA pins as digital I/O
  TRISA = 0;                           // all PORTA pins as digital outputs
  TRISB = 0;                          // designate PORTB pins as output
  TRISC = 0b00100111;
  //PORTC.B5 = 1 ;
  I2C1_Init(100000);
 // UART1_Init(115200);
 // Delay_ms(100);                  // Wait for UART module to stabilize
  setup_ds1621();
  get_date_time_temp();
 /* UART1_Write_Text("Start Clock, Calendar and Temperature Program");
  UART1_Write(13);
  UART1_Write(10);
   */
}