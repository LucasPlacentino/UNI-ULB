;
; ex3.asm
;
; lab1 ex3
;
; Created: 05-03-26 15:31:59
; Author : lucasp
;

; ATmega328P
.INCLUDE "m328pdef.inc"

; .ORG
; .DEF
; .EQU
; RJMP

;led2 is on PC3

.set LED_OUT_DIR = DDRc
.set LED_OUT_BANK = PORTc
.set LED_OUT_IDX = 3 ; or PC3

.org 0x0000
	rjmp setup

setup:
	;set pins

	;led output
	sbi LED_OUT_DIR,LED_OUT_IDX ;set led out pin dir to output(1)
	cbi LED_OUT_BANK,LED_OUT_IDX ;clear led to off

	rjmp loop

sleep1s:
	;16MHz
	;T=62.5 ns
	;=> needs 16,000,000 cycles for 1s
	; cube root of 16million is 251.98 approx 252 (which fits in 8 bits)
	; => 3 loops of counters to 252 ?
	; BUT loops do not do only do one instruction here below so let's do 255 255 89 or something
	ldi r19,80 ;load for big loop
	subloop_sleep_big:
		ldi r18,255 ;load for middle loop
		subloop_sleep_med:
			ldi r17,255 ; load into r1, for small loop
			subloop_sleep_small:
				; one loop is 3 clock cycles
				dec r17 ; INNER LOOP
				brne subloop_sleep_small
			dec r18 ; MEDIUM LOOP
			brne subloop_sleep_med
		dec r19 ; OUTER LOOP
		brne subloop_sleep_med
		;outer loop finished, 1s passed
	ret

loop:

	sbi LED_OUT_BANK,LED_OUT_IDX ;set bit of led to high

	rcall sleep1s

	cbi LED_OUT_BANK,LED_OUT_IDX

	rcall sleep1s

    rjmp loop
