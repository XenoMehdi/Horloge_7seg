
void print_to_segments(digits_t *number)
{
switch(number->type)
{

case CLOCK_TYPE :
// print digit 1
PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
PORTA = segment_select[SEGMENT_1] ;  // select segment 1
{PORTB = PORTB | (numbers [number->digit_1%10] & 0xFE) ;} // set the digit to PORTB
delay_ms(CHARACTER_DELAY); // multiplexing delay

// print digit 2
PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
PORTA = segment_select[SEGMENT_2] ;  // select segment 2
{PORTB = PORTB | (numbers [number->digit_2%10] & 0xFE) ;} // set the digit to PORTB
delay_ms(CHARACTER_DELAY); // multiplexing delay

// print digit 3
PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
PORTA = segment_select[SEGMENT_3] ;  // select segment 3
{PORTB = PORTB | (numbers [number->digit_3%10] & 0xFE) ;} // set the digit to PORTB
delay_ms(CHARACTER_DELAY); // multiplexing delay

// print digit 4
PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
PORTA = segment_select[SEGMENT_4] ;  // select segment 4
{PORTB = PORTB | (numbers [number->digit_4%10] & 0xFE) ;} // set the digit to PORTB
delay_ms(CHARACTER_DELAY); // multiplexing delay

// print symbol
PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
PORTA = segment_select[SEGMENT_5] ;  // select segment 5
if(number->counter < COUNTER_EQUAL_TO_500MS)
{PORTB = PORTB | (symbols [0] & 0xFE) ;} // set the symbol ':' to PORTB
else
{PORTB = PORTB | (symbols [5] & 0xFE) ;} // set the symbol ':' to PORTB
delay_ms(CHARACTER_DELAY); // multiplexing delay


if( number->counter < COUNTER_EQUAL_TO_500MS*2)
{number->counter++;}
else
{number->counter=0;}

break;

case TEMP_TYPE :
// print digit 1 : NULL
PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
PORTA = segment_select[SEGMENT_1] ;  // select segment 1
{PORTB = PORTB | (numbers [10] & 0xFE) ;} // set the digit to PORTB
delay_ms(CHARACTER_DELAY); // multiplexing delay

// print digit 2
PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
PORTA = segment_select[SEGMENT_2] ;  // select segment 2
{PORTB = PORTB | (numbers [number->digit_2%10] & 0xFE) ;} // set the digit to PORTB
delay_ms(CHARACTER_DELAY); // multiplexing delay

// print digit 3
PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
PORTA = segment_select[SEGMENT_3] ;  // select segment 3
{PORTB = PORTB | (numbers [number->digit_3%10] & 0xFE) ;} // set the digit to PORTB
delay_ms(CHARACTER_DELAY); // multiplexing delay

// print digit 4
PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
PORTA = segment_select[SEGMENT_4] ;  // select segment 4
if(number->minus == 1)
{PORTB = PORTB | (symbols [4] & 0xFE) ;} // set PORTB to '-'
else
{PORTB = PORTB | (numbers [10] & 0xFE) ;} // set PORTB to NULL
delay_ms(CHARACTER_DELAY); // multiplexing delay

// print symbol
PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
PORTA = segment_select[SEGMENT_5] ;  // select segment 5
{PORTB = PORTB | (symbols [2] & 0xFE) ;} // set the symbol '°' to PORTB
delay_ms(CHARACTER_DELAY); // multiplexing delay

number->counter=0;
break;

case CALENDAR_TYPE :

// print digit 1 : NULL
PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
PORTA = segment_select[SEGMENT_1] ;  // select segment 1
{PORTB = PORTB | (numbers [number->digit_1%10] & 0xFE) ;} // set the digit to PORTB
delay_ms(CHARACTER_DELAY); // multiplexing delay

// print digit 2
PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
PORTA = segment_select[SEGMENT_2] ;  // select segment 2
if (number->digit_2 == 1)
{PORTB = PORTB | (numbers [1] & 0xFE) ;} // set the digit to PORTB
else
{PORTB = PORTB | (numbers [10] & 0xFE) ;} // set the digit to PORTB
delay_ms(CHARACTER_DELAY); // multiplexing delay

// print digit 3
PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
PORTA = segment_select[SEGMENT_3] ;  // select segment 3
{PORTB = PORTB | (numbers [number->digit_3%10] & 0xFE) ;} // set the digit to PORTB
delay_ms(CHARACTER_DELAY); // multiplexing delay

// print digit 4
PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
PORTA = segment_select[SEGMENT_4] ;  // select segment 4
{PORTB = PORTB | (numbers [number->digit_4%10] & 0xFE) ;} // set the digit to PORTB
delay_ms(CHARACTER_DELAY); // multiplexing delay

// print symbol
PORTB = PORTB & 0x01 ; // save the stat of PORTB.0 and reset others
PORTA = segment_select[SEGMENT_5] ;  // select segment 5
{PORTB = PORTB | (symbols [1] & 0xFE) ;} // set the symbol '/' to PORTB
delay_ms(CHARACTER_DELAY); // multiplexing delay

number->counter=0;
break;

default:
number->counter=0;
break;
}
}


