/*
 * Wyswietlacz7seg.c
 *
 * Created: 2014-12-02 21:08:09
 *  Author: Tomek
 */ 



#define F_CPU 16000000UL
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

#define licznik 0;
const cyfry[10] = {~(0b00111111), ~(0b00000110), ~(0b01011011), ~(0b01001111), ~(0b01100110),~(0b01101101), ~(0b01111101), ~(0b00000111), ~(0b01111111), ~(0b01101111)};
//const poryty[4];

ISR(TIMER0_COMP_vect){

}
        

int main(void)
{
    DDRA=0xFF;
    
    sei();
    OCR0 = 2500;
    TIMSK |= (1 << OCIE0);
    TCCR0 |= (1 << CS00) | (1 << CS01) | (1 << WGM01);
    
	;
    
    while(1)
    {
        /*
        int j = licznik%10;
        int tmp = 0;
        if(licznik/10 > 1){
            tmp = licznik/10;
        }
        int d = tmp%10;
        if(tmp/10 > 1){
            tmp = licznik/10;
        }
        int s = tmp%10;
        if(tmp/10 > 1){
            tmp = licznik/10;
        }
		*/ 
        for(int i=0; i<10; i++){
            PORTA = cyfry[i]; 
            _delay_us(1000000);
        }
        
        
        
         
    }
}