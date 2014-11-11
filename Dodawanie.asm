/*
 * Dodawanie.asm
 *
 *  Created: 2014-10-26 16:38:35
 *   Author: Tomek
 */ 


 #include "m32def.inc"
.EQU LEN = 16 //dlugosc tablicy
.DSEG 
.ORG 100
tab1: .BYTE LEN 
tab2: .BYTE LEN


.CSEG 
.ORG 0

LDI XL, low(tab1)
LDI XH, high(tab1)
LDI YL, low(tab2)
LDI YH, high(tab2)
LDI ZL, low(LEN)
LDI ZH, high(LEN)

/*
X - adres pierwszej tablicy
Y - adres drugiej tablicy
Z - dlugosc tablic
*/



CLC
START:
	LD R18, X+
    	LD R19, Y
	ADC R18, R19 
	IN R20, SREG
	ST Y+, R18 //zapisujemy wynik dodawania w 2 tablicy

	SBIW Z, 1 // skok jezeli Z!=1
	IN R21, SREG
	OR R20, R21
    	OUT SREG, R20
	BRNE START

KONIEC:
RJMP KONIEC
		
         