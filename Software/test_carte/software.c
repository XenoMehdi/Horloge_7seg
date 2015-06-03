
void main() {
TRISB = 0;

PORTB =255;

while(1)
{
           Delay_ms(1000);
           PORTB = 0;
           Delay_ms(1000);
           PORTB = 255;
}
}