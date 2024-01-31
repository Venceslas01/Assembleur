*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
    move.l #6,d6
    move.l #1,d1
    
* Put program code here

FACBOUCLE:
    *Dans cette boucle on calcule la factorielle du nombre renseigne en d6
    cmp #1,d6
    BEQ FINFACB
    MULU d6,d1  
    add.l #-1,d6
    BRA FACBOUCLE
FINFACB:
    move #3,d0
    trap #15    
    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
