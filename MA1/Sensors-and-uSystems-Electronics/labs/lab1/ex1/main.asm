;
; ex1.asm
;
; lab1 ex1
;
; Created: 05-03-26 14:06:56
; Author : lucasp
;

; ATmega328P
.INCLUDE "m328pdef.inc"

; .ORG
; .DEF
; .EQU
; RJMP

;led1 is on PC2
;joystick btn is on PB2

.set LED_OUT_DIR = DDRc
.set LED_OUT_BANK = PORTc
.set LED_OUT_IDX = 2
.set BTN_IN_DIR = DDRb
.set BTN_IN_BANK = PORTb ;will be used for setting the pullup
.set BTN_IN_IDX = 2
.set BTN_IN_SENSE = PINb

.org 0x0000
	rjmp setup

setup:
	;set pins

	;btn input
	cbi BTN_IN_DIR,BTN_IN_IDX ;clear bit i/o reg ;set dir of pin to 0 meaning input
	sbi BTN_IN_BANK,BTN_IN_IDX ;set bit i/o reg ;set pullup of pin to enabled

	;led output
	sbi LED_OUT_DIR,LED_OUT_IDX ;set led out pin dir to output(1)
	cbi LED_OUT_BANK,LED_OUT_IDX ;clear led to off

	rjmp loop

; Replace with your application code
loop:
    in r0,BTN_IN_SENSE ;get value of pin bank
	;then get bit index BTN_IN_IDX of BTN_IN_SENSE to know if pin is low or high
	bst r0,BTN_IN_IDX ;Bit Store from register to T flag ;get bit value from the bank above
	;T flag is cleared(0) if btn is pressed (to gnd)

	brtc pressed;BRanch if T flag is Cleared(0) ;meaning btn is GND meaning pressed
	;or brts (1) vice-versa
	not_pressed:
		sbi LED_OUT_BANK,LED_OUT_IDX ;set bit of led to high
		rjmp loop

	pressed:
		cbi LED_OUT_BANK,LED_OUT_IDX
		rjmp loop

	; shouldn't get to here tho
    rjmp loop
