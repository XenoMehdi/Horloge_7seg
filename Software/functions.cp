#line 1 "J:/Dropbox/Dropbox/F.E.S Industries/Projets Ouadie/Hor_Temp_7Seg/Software/functions.c"

void print_to_segments(digits_t *number)
{
switch(number->type)
{

case CLOCK_TYPE :

PORTB = PORTB & 0x01 ;
PORTA = segment_select[SEGMENT_1] ;
{PORTB = PORTB | (numbers [number->digit_1%10] & 0xFE) ;}
delay_ms(CHARACTER_DELAY);


PORTB = PORTB & 0x01 ;
PORTA = segment_select[SEGMENT_2] ;
{PORTB = PORTB | (numbers [number->digit_2%10] & 0xFE) ;}
delay_ms(CHARACTER_DELAY);


PORTB = PORTB & 0x01 ;
PORTA = segment_select[SEGMENT_3] ;
{PORTB = PORTB | (numbers [number->digit_3%10] & 0xFE) ;}
delay_ms(CHARACTER_DELAY);


PORTB = PORTB & 0x01 ;
PORTA = segment_select[SEGMENT_4] ;
{PORTB = PORTB | (numbers [number->digit_4%10] & 0xFE) ;}
delay_ms(CHARACTER_DELAY);


PORTB = PORTB & 0x01 ;
PORTA = segment_select[SEGMENT_5] ;
if(number->counter < COUNTER_EQUAL_TO_500MS)
{PORTB = PORTB | (symbols [0] & 0xFE) ;}
else
{PORTB = PORTB | (symbols [5] & 0xFE) ;}
delay_ms(CHARACTER_DELAY);


if( number->counter < COUNTER_EQUAL_TO_500MS*2)
{number->counter++;}
else
{number->counter=0;}

break;

case TEMP_TYPE :

PORTB = PORTB & 0x01 ;
PORTA = segment_select[SEGMENT_1] ;
{PORTB = PORTB | (numbers [10] & 0xFE) ;}
delay_ms(CHARACTER_DELAY);


PORTB = PORTB & 0x01 ;
PORTA = segment_select[SEGMENT_2] ;
{PORTB = PORTB | (numbers [number->digit_2%10] & 0xFE) ;}
delay_ms(CHARACTER_DELAY);


PORTB = PORTB & 0x01 ;
PORTA = segment_select[SEGMENT_3] ;
{PORTB = PORTB | (numbers [number->digit_3%10] & 0xFE) ;}
delay_ms(CHARACTER_DELAY);


PORTB = PORTB & 0x01 ;
PORTA = segment_select[SEGMENT_4] ;
if(number->minus == 1)
{PORTB = PORTB | (symbols [4] & 0xFE) ;}
else
{PORTB = PORTB | (numbers [10] & 0xFE) ;}
delay_ms(CHARACTER_DELAY);


PORTB = PORTB & 0x01 ;
PORTA = segment_select[SEGMENT_5] ;
{PORTB = PORTB | (symbols [2] & 0xFE) ;}
delay_ms(CHARACTER_DELAY);

number->counter=0;
break;

case CALENDAR_TYPE :


PORTB = PORTB & 0x01 ;
PORTA = segment_select[SEGMENT_1] ;
{PORTB = PORTB | (numbers [number->digit_1%10] & 0xFE) ;}
delay_ms(CHARACTER_DELAY);


PORTB = PORTB & 0x01 ;
PORTA = segment_select[SEGMENT_2] ;
if (number->digit_2 == 1)
{PORTB = PORTB | (numbers [1] & 0xFE) ;}
else
{PORTB = PORTB | (numbers [10] & 0xFE) ;}
delay_ms(CHARACTER_DELAY);


PORTB = PORTB & 0x01 ;
PORTA = segment_select[SEGMENT_3] ;
{PORTB = PORTB | (numbers [number->digit_3%10] & 0xFE) ;}
delay_ms(CHARACTER_DELAY);


PORTB = PORTB & 0x01 ;
PORTA = segment_select[SEGMENT_4] ;
{PORTB = PORTB | (numbers [number->digit_4%10] & 0xFE) ;}
delay_ms(CHARACTER_DELAY);


PORTB = PORTB & 0x01 ;
PORTA = segment_select[SEGMENT_5] ;
{PORTB = PORTB | (symbols [1] & 0xFE) ;}
delay_ms(CHARACTER_DELAY);

number->counter=0;
break;

default:
number->counter=0;
break;
}
}
