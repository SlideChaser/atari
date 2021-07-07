processor 6502

seg code
org $F000

;addressing modes

; Immediate Mode
lda #80     ; Loads the A register with the literal Decimal value 80/"eighty"
; Literal instruction: A9 50

; Absolute (zero page) Mode
lda $80     ; Loads the A register with the value -inside- memory address $80
; Literal instruction: A5 80

; Can use other registers, not just A. 
; A is just easy to use atm

lda #$80    ; Loads the A register with the literal hexadecimal number $80 (same as 128 decimal - (8*16)+(0*1) ;P )
