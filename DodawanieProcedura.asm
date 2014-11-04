/*
 * DodawanieProcedura.asm
 *
 *  Created: 2014-11-04 18:50:36
 *   Author: Tomek
 */ 


 #include "m32def.inc"
.EQU LEN = 16 ; dlugosc tablic
.DSEG // segment danych
.ORG 100
tab1: .BYTE LEN ; 2 tablice o podanej dlugosci
tab2: .BYTE LEN

.CSEG //segment instrukcji
.ORG 0
    LDI R16, low(RAMEND)    //inicjalizacja stosu na koncu pamiêci
    LDI R17, high(RAMEND)
    OUT SPL, R16
    OUT SPH, R17

    LDI XL, low(tab1)
    LDI XH, high(tab1)
    LDI YL, low(tab2)
    LDI YH, high(tab2)
    LDI ZL, low(len)
    LDI ZH, high(len)

    CALL DODAJ

KONIEC:
    RJMP KONIEC
/*
 *
 * Parametry:
 * X - adres pierwszej liczby
 * y - adres drugiej liczby
 * z - dlugosc liczby
 *
 */


DODAJ:
    PUSH R18
    PUSH R19
	PUSH R20
    CLC
    LOOP:
    
        LD R18, X+
        LD R19, Y   // inkrementacja Y jest w ST bo chcemy storowac w dobre miejce a nie w 1 dalej
        ADC R18, R19
        IN R20, SREG //odkladam wszyskie flagi do r20
		CLC
		ST Y+, r18
        SBIW Z, 1 // skok jezeli Z!=1
        OUT SREG, R20
		BRNE LOOP 

    POP R20
	POP R19
    POP R18
    RET