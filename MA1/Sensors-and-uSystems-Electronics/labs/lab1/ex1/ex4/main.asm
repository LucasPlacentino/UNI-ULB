;
; ex4.asm
;
; lab1 ex4
;
; Created: 05-03-26 16:11:35
; Author : lucasp
;

; ATmega328P
.INCLUDE "m328pdef.inc"

; .ORG
; .DEF
; .EQU
; RJMP

;buzzer is on PB1
;sw is on PB0

.set BZ_OUT_DIR = DDRb
.set BZ_OUT_BANK = PORTb
.set BZ_OUT_IDX = 1
.set SW_IN_DIR = DDRb
.set SW_IN_BANK = PORTb ;will be used for setting the pullup
.set SW_IN_IDX = 0
.set SW_IN_SENSE = PINb

.org 0x0000
	rjmp setup

setup:
	;set pins

	;btn input
	cbi SW_IN_DIR,SW_IN_IDX ;clear bit i/o reg ;set dir of pin to 0 meaning input
	sbi SW_IN_BANK,SW_IN_IDX ;set bit i/o reg ;set pullup of pin to enabled

	;led output
	sbi BZ_OUT_DIR,BZ_OUT_IDX ;set buzzer out pin dir to output(1)
	cbi BZ_OUT_BANK,BZ_OUT_IDX ;clear buzzer to off

	rjmp loop


sleep_440Hz:
	;16MHz
	;T=62.5 ns
	;=> needs 12,121*3 cycles for 440Hz
	; let's do 47 and 210 for 220Hz so 47/2 for 440HZ ?
	; 440Hz is 2.2727ms

	; ((62.5ns * 3 cycles * 210)+3) * 47 ???

	ldi r19,47 ;load for big loop
	subloop_sleep_big:
		ldi r18,210 ;load for middle loop
		subloop_sleep_med:
			dec r18 ; MEDIUM LOOP
			brne subloop_sleep_med ;brne checks the Z-flag (the zero flag is set when the ALU's (last) result is zero)
		dec r19 ; OUTER LOOP
		brne subloop_sleep_med
		;outer loop finished, 1s passed
	ret

sound_buzzer:
	sbi BZ_OUT_BANK,BZ_OUT_IDX
	rcall sleep_440Hz
	cbi BZ_OUT_BANK,BZ_OUT_IDX
	rcall sleep_440Hz
	ret

; Replace with your application code
loop:
    in r0,SW_IN_SENSE ;get value of pin bank
	;then get bit index BTN_IN_IDX of BTN_IN_SENSE to know if pin is low or high
	bst r0,SW_IN_IDX ;Bit Store from register to T flag ;get bit value from the bank above
	;T flag is cleared(0) if btn is pressed (to gnd)

	brtc pressed;BRanch if T flag is Cleared(0) ;meaning btn is GND meaning pressed
	;brtc(0) or brts (1) vice-versa
	not_pressed:
		rcall sound_buzzer
		rjmp loop

	pressed:
		cbi BZ_OUT_BANK,BZ_OUT_IDX
		rjmp loop

	; shouldn't get to here tho
    rjmp loop
