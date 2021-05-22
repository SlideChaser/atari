    processor 6502
    
    seg code
    org $F000   ; Define the code origin at $F000

Start:
    sei         ; Disable interrupts
    cld         ; Disable the BCD decimal math mode
    ldx #$FF    ; Loads the X register with #$FF
    txs         ; Transfer the X register to the (S)tack pointer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clears the Page Zero region ($00 to $FF)
; meaning the entire RAM and also the entire TIA registers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    lda #0      ; A = 0
    ldx #$FF    ; X = #$FF
    lda $FF     ; Stores 0 (From the A register) in position $FF  before the loop starts
    
MemLoop:
    dex         ; X--
    sta $0,X    ; Store the value of A inside memory address $0 + X
    bne MemLoop ; Loop  until X is equal to zero  (z-flag is set)

    org $FFFC
    .word Start ; Reset vector at $FFFC (Where the program starts)
    .word Start ; making sure there are 2 bytes at the end of the ROM