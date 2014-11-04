/*
 * Dodawanie.asm
 *
 *  Created: 2014-10-26 16:38:35
 *   Author: Tomek
 */ 


 #include "m32def.inc"
.EQU LEN = 16
.DSEG // segment danych
.ORG 100
tab1: .BYTE LEN ; 2 tablice 16 bajtowe
tab2: .BYTE LEN
//liczbaA: .dw 0x74 
//liczbaB: .dw 0x84

.CSEG //segment instrukcji
.ORG 0
//LDI R18, liczbaA ; 
//LDI R19, liczbaB
LDI R20, 15 ; licznik

//LDI XL, Low(tab1) ;XL to R26, LOW - mniej znaczacy bit
//LDI XH, High(tab1)



START:
	LD R16, X  ;wycztujemy liczbe z tablicy1 o konkretnym indeksie
	LD R17, Y 

	ADC R16, R17
	ST X, R16 ;zapisujemy wynik dodawania w tablicy2
	
	//DEC R18 
	//DEC R19

	DEC R20

CPI R20, 0 ; sprawdza czy licznik =0 jesli nie to wykonuje skok
BRNE START