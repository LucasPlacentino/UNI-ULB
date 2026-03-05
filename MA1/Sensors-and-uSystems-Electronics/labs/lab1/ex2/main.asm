;
; ex2.asm
;
; lab1 ex2
;
; Created: 05-03-26 15:27:00
; Author : lucasp
;

; ATmega328P
.INCLUDE "m328pdef.inc"

; .ORG
; .DEF
; .EQU
; RJMP

;led2 is on PC3
;sw is on PB0

.set LED_OUT_DIR = DDRc
.set LED_OUT_BANK = PORTc
.set LED_OUT_IDX = 3
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
	sbi LED_OUT_DIR,LED_OUT_IDX ;set led out pin dir to output(1)
	cbi LED_OUT_BANK,LED_OUT_IDX ;clear led to off

	rjmp loop

; Replace with your application code
loop:
    in r0,SW_IN_SENSE ;get value of pin bank
	;then get bit index BTN_IN_IDX of BTN_IN_SENSE to know if pin is low or high
	bst r0,SW_IN_IDX ;Bit Store from register to T flag ;get bit value from the bank above
	;T flag is cleared(0) if btn is pressed (to gnd)

	brts pressed;BRanch if T flag is Cleared(0) ;meaning btn is GND meaning pressed
	;brtc(0) or brts (1) vice-versa
	not_pressed:
		sbi LED_OUT_BANK,LED_OUT_IDX ;set bit of led to high
		rjmp loop

	pressed:
		cbi LED_OUT_BANK,LED_OUT_IDX
		rjmp loop

	; shouldn't get to here tho
    rjmp loop
