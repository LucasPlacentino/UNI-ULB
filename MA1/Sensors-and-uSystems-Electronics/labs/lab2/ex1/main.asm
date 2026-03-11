;
; ex1.asm
;
; lab 2 ex 1
;
; Created: 11-03-26 14:17:40
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

.set BZ_OUT_DIR = DDRb
.set BZ_OUT_BANK = PORTb
.set BZ_OUT_IDX = 1
.set BZ_OUT_PIN_TGL = PINb ; PINxn is PORTxn no need for DDRx for toggling
; we can just do SBI PINb,1 to toggle the buzzer pin

.set SW_IN_DIR = DDRb
.set SW_IN_BANK = PORTb ;will be used for setting the pullup
.set SW_IN_IDX = 0
.set SW_IN_SENSE = PINb ; or directly PINb0 ?

; timer 0 and 2 are 8bit (up to 255), timer 1 is 16 bit (up to 65535)

.org 0x0000
	rjmp setup

; TIMER0 OVF (see page 12 of slides interrupts)
.org 0x0020 ; timer 0 overflow interrupt vector
	rjmp ISR880Hz



; --- a tone of 440Hz needs an interrupt at 880Hz (toggle on and off) => 880 interrupts per second ---
; 8-bit counter: prescaler 256 (0b100) => 185 initial value for timer to get 880 interrupts per second



setup:
	sei ;enable interrupts
	;ldi R16, 1<<TOIE0 ; 0b001
	ldi R16, 0b1
	;sbi TIMSK0,TOIE0 ; cannot do that
	sts TIMSK0,R16 ; enable timer 0 overflow interrupt ; store to SRAM (TIMSK0 is in Extended I/O space so in SRAM)

	;set timer 0 to normal mode
	ldi R16, 0b000 ; normal mode
	out TCCR0A,R16 ; write to TCCR0A to set normal mode
	; set timer0 prescaler to 256 (0b100)
	;ldi R16, 1<<CS02 ; combine bits for prescaler 256
	ldi R16, 0b100 ; combine bits for prescaler 256
	out TCCR0B,R16 ; write to TCCR0B to set prescaler

	; timer0 initial value to get 880 interrupts per second
	; 880Hz, f_clk prescaler 256 => 16MHz/256 => 184.977 = 185 initial value for timer to get 880 interrupts per second
	ldi R29, 185
	out TCNT0,R29

	;set pins

	;sw input
	cbi SW_IN_DIR,SW_IN_IDX ;clear bit i/o reg ;set dir of pin to 0 meaning input
	sbi SW_IN_BANK,SW_IN_IDX ;set bit i/o reg ;set pullup of pin to enabled

	;led output
	sbi BZ_OUT_DIR,BZ_OUT_IDX ;set buzzer out pin dir to output(1)
	cbi BZ_OUT_BANK,BZ_OUT_IDX ;clear buzzer to off

	;led output
	sbi LED_OUT_DIR,LED_OUT_IDX ;set led out pin dir to output(1)
	cbi LED_OUT_BANK,LED_OUT_IDX ;clear led to off

	rjmp loop

loop:
	; sbi LED_OUT_BANK,LED_OUT_IDX ;set bit of led to high

	; rcall sleep1s

	; cbi LED_OUT_BANK,LED_OUT_IDX

	; rcall sleep1s

	; --- light up led when switch is in high position :

	in r0,SW_IN_SENSE ;get value of pin bank
	;then get bit index SW_IN_IDX of SW_IN_SENSE to know if pin is low or high
	bst r0,SW_IN_IDX ;Bit Store from register to T flag ;get bit value from the bank above
	;T flag is cleared(0) if btn is pressed (to gnd)

	brtc pressed;BRanch if T flag is Cleared(0) ;meaning btn is GND meaning pressed
	;brtc(0) or brts (1) vice-versa
	not_pressed:
		cbi LED_OUT_BANK,LED_OUT_IDX ;clear bit of led to low
		ldi R16, 0b0
		sts TIMSK0,R16 ; disable timer 0 overflow interrupt
		rjmp end_pressed_br
	pressed:
		sbi LED_OUT_BANK,LED_OUT_IDX ;set bit of led to high
		ldi R16, 0b1
		sts TIMSK0,R16 ; enable timer 0 overflow interrupt

	end_pressed_br:

    rjmp loop


ISR880Hz:
	push r29 ; save r29 to stack (FILO)

	; reset timer counter to get 880 interrupts per second
	; 880Hz, f_clk prescaler 256 => 16MHz/256 => 184.977 = 185 initial value for timer to get 880 interrupts per second
	ldi R29,0xB9 ; 0xB9 is 185 in hex
	out TCNT0,R29


	sbi BZ_OUT_PIN_TGL,1 ; toggle buzzer pin (trick)
	; or
	;sbi PINB,1
	; or
	;sbi PB,1

	; sbis PORTb,1 ; spik if pin bit is set
	; rjmp other
	; cbi portb,1
	; rjmp end_isr_880
	; other:
	; sbi portb,1


	end_isr_880:
	pop r29; ; get r29 back from stack

	reti ; return from interrupt, will re-enable interrupts


test_setup:
	; enable interrupts (page 8 of slides interrupts)
	sei ; set global interrupt enable bit in SREG, CLI is the opposite to disable interrupts
	;;; or
	;; sbi SREG,7 ; set bit 7 of SREG to enable interrupts
	; TCCR1B |= (1 << CS12) ;Set up the clock source

	; ldi R16, 1<<TOV0
	; out TIFR, R16               ; Clears the Timer 0 overflow flag

	ldi R16, 1<<TOIE0
	sts TIMSK0, R16              ; Enable interrupt on overflow of T0

	; ; enable timer overflow interrupt for timer/counter 0 (see page 9 of slides interrupts)
	; sbi TIMSK0,TOIE0 ; set bit 0 of TIMSK0 to enable timer 0 overflow interrupt
	; ; but cannot use sbi on TIMSK0, so
	; ldi r16,1 ; load 1 into r16
	; out TIMSK0,r16 ; write r16 to TIMSK0 to enable timer 0 overflow interrupt
	; TIMSK0 |= (1 << TOIE0); ; enable timer 1 overflow interrupt

	;set pins

	;led output
	sbi LED_OUT_DIR,LED_OUT_IDX ;set led out pin dir to output(1)
	cbi LED_OUT_BANK,LED_OUT_IDX ;clear led to off

	rjmp loop

test_timer:
	; tccr0a = 0b000 ; normal mode
	ldi R16, 0b000 ; normal mode
	out TCCR0A,R16 ; write to TCCR0A to set normal mode

	; tccr0b = 0b000 ; stop timer

	ldi R16,1<<CS00             ; clock scaler bit 0
	ldi R17,1<<CS01             ; clock scaler bit 1
	or R16,R17 ; combine bits for prescaler 64
	out TCCR0B,R16               ; Flags set up to scale clock to 1/64 of system (16MHz/64 = 250kHz)
	; or directly
	ldi R16, (1<<CS00) | (1<<CS01) ; combine bits for prescaler 64
	; or
	ldi R16, 0b011 ; combine bits for prescaler
	out TCCR0B,R16 ; write to TCCR0B to set prescaler

	; tccr0b = 0b100 ; clk/256 prescaler => 16MHz/256 = 62500Hz => 1 tick every 16us
	; => 62500 ticks per second, so 62500 ticks for 1s
	; timer starts at TCNT initial value (0) and when overflows it flags TOV0
	; last bit of TIFR0 is TOV0, we can check it to see if timer overflowed
	; let's poll the overflow flag?, we should rather use an interrupt
	; we can also do timer interrupts on like compare and match

	; Period of timer = (Max value – TCNT_{Initial value} )*Count-rate
	; Max value: 2^[timer resolution] – 1
	; Count-rate: frequency after prescaler

	; 𝑡 = (1/𝑓_𝑐𝑙𝑘) ∗ 0𝑥𝐹𝐹 − 𝑇𝐶𝑁𝑇_𝑖𝑛𝑖𝑡]

	; How to chose the prescaler ?
	; The incrementing frequency (Tinc) is the clock frequency (16MHz) divided by the prescaler.
	; look page 12 of slides timers

	; CTC mode (Clear Timer on Compare): starts 0, each count TCNT is comapred to OCRA, when equal => OCF0A flag is set
	; then timer is cleared/reset
	; ctc mode is: TCCR01 = 0b010

	; Interrupts:


timer0_OF_ISR:
	push r31
	; reset timer counter
	; 1000Hz, f_clk = 250kHz (prescaler 64)
	; tcnt_init = 256 - (f_clk / wanted_freq) = 6 = 0x06
	LDI R31,0x06
	OUT TCNT0,R31

	; save registers if needed (if we use these regs during the interrupt):
	; they're pushed to the stack (FILO)
	push r16
	push r17
	push r18
	; etc


	; do things on interrupt

	; get value of output pin, toggle it, write it back
	; ld r16,LED_OUT_BANK ; read current value of output bank into r16
	; or just
	in r16,LED_OUT_BANK ; read current value of output bank into r16
	; toggle bit of led
	ldi r17, 1<<LED_OUT_IDX ; toggle mask
	EOR r16,r17 ; XOR r16 with r17 to toggle the target bit
	out LED_OUT_BANK,r16 ; write back to output bank to toggle led



	; restore registers if needed:
	; they're popped from the stack in reverse order (LIFO)
	pop r31
	pop r18
	pop r17
	pop r16
	; etc

	RETI ; return from interrupt, will re-enable interrupts

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
