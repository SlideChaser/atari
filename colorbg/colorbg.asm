    processor 6502
    include "vcs.h"
    include "macro.h"

    seg code
    org $ F000      ; Defines origin of the ROM at $F000

START:
    CLEAN_START     ; Macro to safely clear the memory
