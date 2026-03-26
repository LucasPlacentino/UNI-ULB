;
; task.asm
;
; lab 3
;
; Created: 26-03-26 14:28:45
; Author : lucasp
;

; Implement one method to readout the keyboard, write code such that the buttons do the following:
; Button 7: Two leds on; => row 1 col 1
; Button 8: Bottom led on; => row 1 col 2
; Button 4: Top Led on; => row 2 col 1
; All other buttons: Buzzer on;
; No buttons pressed: Leds and buzzer off



; ATmega328P
.INCLUDE "m328pdef.inc"

; .ORG
; .DEF
; .EQU
; RJMP

.def temp = r16 ; example: define alias "temp" for the register "r16"
;.def row = r30 ; row is alias of r30
;.def col = r31 ; col is alias of r31

; Timer1 reset value for overflow timing
.equ TCNT1_RESET_880   = 47354  ;440Hz

.equ LED_OUT2_DIR = DDRc
.equ LED_OUT2_BANK = PORTc
.equ LED_OUT2_IDX = 2 ; or PC2
.equ LED_OUT3_DIR = DDRc
.equ LED_OUT3_BANK = PORTc
.equ LED_OUT3_IDX = 3 ; or PC3

.equ BZ_OUT_DIR = DDRb
.equ BZ_OUT_BANK = PORTb
.equ BZ_OUT_IDX = 1
.equ BZ_OUT_PIN_TGL = PINb ; PINxn is PORTxn no need for DDRx for toggling
; we can just do SBI PINb,1 to toggle the buzzer pin

.set SW_IN_DIR = DDRb
.set SW_IN_BANK = PORTb ;will be used for setting the pullup
.set SW_IN_IDX = 0
.set SW_IN_SENSE = PINb ; or directly PINb0 ?

;keypad
.equ KP_PIN = PINd
.equ KP_DDR = DDRd
.equ KP_PORT = PORTd
; see schematic:
; row1->4 = bit7->4 of PD
.equ ROW1 = 7
.equ ROW2 = 6
.equ ROW3 = 5
.equ ROW4 = 4
; col1->4 = bit3->0 of PD
.equ COL1 = 3
.equ COL2 = 2
.equ COL3 = 1
.equ COL4 = 0





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

	;;sw input
	;cbi SW_IN_DIR,SW_IN_IDX ;clear bit i/o reg ;set dir of pin to 0 meaning input
	;sbi SW_IN_BANK,SW_IN_IDX ;set bit i/o reg ;set pullup of pin to enabled

	;buzzer output
	sbi BZ_OUT_DIR,BZ_OUT_IDX ;set buzzer out pin dir to output(1)
	cbi BZ_OUT_BANK,BZ_OUT_IDX ;clear buzzer to off

	;led output
	sbi LED_OUT2_DIR,LED_OUT2_IDX ;set led2 out pin dir to output(1)
	cbi LED_OUT2_BANK,LED_OUT2_IDX ;clear led2 to off
	sbi LED_OUT3_DIR,LED_OUT3_IDX ;set led3 out pin dir to output(1)
	cbi LED_OUT3_BANK,LED_OUT3_IDX ;clear led3 to off

	rjmp loop

loop:
	; poll keypad
	rjmp kp_polling_1

	;; lab 2 code:
	;in r0,SW_IN_SENSE ;get value of pin bank
	;;then get bit index SW_IN_IDX of SW_IN_SENSE to know if pin is low or high
	;bst r0,SW_IN_IDX ;Bit Store from register to T flag ;get bit value from the bank above
	;;T flag is cleared(0) if btn is pressed (to gnd)
	;brtc buz_en;BRanch if T flag is Cleared(0) ;meaning btn is GND meaning pressed
	;;brtc(0) or brts (1) vice-versa
	;buz_disabled:
	;	rcall BUZOFF
	;	rjmp end_buz_br
	;buz_en:
	;	rcall BUZON
	;end_buz_br:

    rjmp loop

LED2ON:
	; LOW enable
	cbi LED_OUT2_BANK,LED_OUT2_IDX ;set bit of led to high
	ret
LED2OFF:
	sbi LED_OUT2_BANK,LED_OUT2_IDX ;set bit of led to low
	ret
LED3ON:
	; LOW enable
	cbi LED_OUT3_BANK,LED_OUT3_IDX ;set bit of led to high
	ret
LED3OFF:
	sbi LED_OUT3_BANK,LED_OUT3_IDX ;set bit of led to low
	ret
BUZON:
	ldi R16, 0b1
	sts TIMSK0,R16 ; enable timer 0 overflow interrupt
	ret
BUZOFF:
	ldi R16, 0b0
	sts TIMSK0,R16 ; disable timer 0 overflow interrupt
	ret

other_btn_pressed:
	rcall LED2OFF
	rcall LED3OFF
	rcall BUZON
	ret

; making this a macro can make it more elegant
;KP_POLLING_2:
.macro KP_POLLING_2
	; careful: need to first modify PORT reg before modifying DDR reg.
	; rows as inputs:
	ldi temp,(1<<ROW1)|(1<<ROW2)|(1<<ROW3)|(1<<ROW4)
	out KP_PORT,temp ; bitmask to keypad port for rows
	; cols as outputs:
	ldi temp,(1<<COL1)|(1<<COL2)|(1<<COL3)|(1<<COL4)
	out KP_DDR,temp     ; bitmask to keypad port dir for cols

	nop ; No operation because "Add NOP when changing output connected to an input" slide 8 ("Bits in PINx register are always one cycle behind", synchronizer: PIN reg 1 clk-cycle late)
	; now we can read PIN reg

	;ldi row,0x0 ; default nothing pressed
	sbis KP_PIN,ROW1
	; rcall or rjmp to colY row X=1
	;ldi row,0x1
	rjmp @0 ; rjmp to first arg of macro

	sbis KP_PIN,ROW2
	; rcall or rjmp to colY row X=2
	;ldi row,0x2
	rjmp @1 ; rjmp to second arg of macro

	sbis KP_PIN,ROW3
	; rcall or rjmp to colY row X=3
	;ldi row,0x3
	rjmp @2 ; rjmp to third arg of macro

	sbis KP_PIN,ROW4
	; rcall or rjmp to colY row X=4
	;ldi row,0x4
	rjmp @3 ; rjmp to fourth arg of macro

	rjmp no_kp_pressed

	;ret
.endmacro

; this does the "2-step method" switching for the keypad
; - config all rows output, set them LOW
; - config all cols input, check which low
;	- the col y that is low has a btn pressed => col num Y
;	- config all rows input, all cols output
;	- => careful transition, intermediate pin states ! context switching
;	- set all cols to LOW, check row pins
;		- if all rows HIGH => btn release, exit
;		- if row x is LOW => btn pressed in Y col => row num X
;		- => btn pressed is row-X and col-Y
; - if no col is low (=all high) no btn is pressed, exit
kp_polling_1:
	; careful: need to first modify PORT reg before modifying DDR reg.
	; cols as inputs:
	ldi temp,(1<<COL1)|(1<<COL2)|(1<<COL3)|(1<<COL4)
	out KP_PORT,temp ; bitmask to keypad port for cols
	; rows as outputs set LOW:
	ldi temp,(1<<ROW1)|(1<<ROW2)|(1<<ROW3)|(1<<ROW4)
	out KP_DDR,temp ; bitmask to keypad port dir for rows

	nop ; No operation because "Add NOP when changing output connected to an input" slide 8 ("Bits in PINx register are always one cycle behind", synchronizer: PIN reg 1 clk-cycle late)
	; now we can read PIN reg

	sbis KP_PIN,COL1
	; rcall or rjmp to KP_POLLING_2 as col Y=1 or set a reg to some value?
	;ldi col,0x1
	rjmp col1pressed

	sbis KP_PIN,COL2
	; rcall or rjmp to KP_POLLING_2 as col Y=2
	;ldi col,0x2
	rjmp col2pressed

	sbis KP_PIN,COL3
	; rcall or rjmp to KP_POLLING_2 as col Y=3
	;ldi col,0x3
	rjmp col3pressed

	sbis KP_PIN,COL4
	; rcall or rjmp to KP_POLLING_2 as col Y=4
	;ldi col,0x4
	rjmp col4pressed

	; nothing was pressed
	rjmp no_kp_pressed
	;ret

no_kp_pressed:
	; set everything OFF
	rcall LED2OFF
	rcall LED3OFF
	rcall BUZOFF
	rjmp loop

col1pressed:
	; col Y=1
	;rcall KP_POLLING_2 ; check row X value => in reg `row` after this func call
	KP_POLLING_2 col1row1,col1row2,col1row3,col1row4 ; macro with args to rjmp to corresponding label
	; don't happen:
	rjmp loop
col2pressed:
	;rcall KP_POLLING_2 ; check row X value => in reg `row` after this func call
	KP_POLLING_2 col2row1,col2row2,col2row3,col2row4 ; macro with args to rjmp to corresponding label
	; don't happen:
	rjmp loop
col3pressed:
	;rcall KP_POLLING_2 ; check row X value => in reg `row` after this func call
	KP_POLLING_2 col3row1,col3row2,col3row3,col3row4 ; macro with args to rjmp to corresponding label
	; don't happen:
	rjmp loop
col4pressed:
	;rcall KP_POLLING_2 ; check row X value => in reg `row` after this func call
	KP_POLLING_2 col4row1,col4row2,col4row3,col4row4 ; macro with args to rjmp to corresponding label
	; don't happen:
	rjmp loop

; --- COL 1 ---
col1row1:
	; BTN 7
	; turn both LEDs on
	rcall LED2ON
	rcall LED3ON
	rcall BUZOFF
	rjmp loop
col1row2:
	; BTN4
	; top LED on
	rcall LED2ON
	rcall LED3OFF
	rcall BUZOFF
	rjmp loop
col1row3:
	rcall other_btn_pressed
	rjmp loop
col1row4:
	rcall other_btn_pressed
	rjmp loop

; --- COL 2 ---
col2row1:
	; BTN 8
	; bottom LED on
	rcall LED2OFF
	rcall LED3ON
	rcall BUZOFF
	rjmp loop
col2row2:
	rcall other_btn_pressed
	rjmp loop
col2row3:
	rcall other_btn_pressed
	rjmp loop
col2row4:
	rcall other_btn_pressed
	rjmp loop

; --- COL 3 ---
col3row1:
	rcall other_btn_pressed
	rjmp loop
col3row2:
	rcall other_btn_pressed
	rjmp loop
col3row3:
	rcall other_btn_pressed
	rjmp loop
col3row4:
	rcall other_btn_pressed
	rjmp loop

; --- COL 4 ---
col4row1:
	rcall other_btn_pressed
	rjmp loop
col4row2:
	rcall other_btn_pressed
	rjmp loop
col4row3:
	rcall other_btn_pressed
	rjmp loop
col4row4:
	rcall other_btn_pressed
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

