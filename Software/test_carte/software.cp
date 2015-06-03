#line 1 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/test_carte/software.c"

void main() {
TRISB = 0;

PORTB =255;

while(1)
{
 Delay_ms(1000);
 PORTB =0;
 Delay_ms(1000);
 PORTB =255;
}
}
