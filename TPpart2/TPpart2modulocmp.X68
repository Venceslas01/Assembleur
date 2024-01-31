*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    move.w #11,d1
    move.w d1,d2

PAIR:
    *on calcule le modulo
    divu #2,d1
    CLR.W d1
    swap d1
    *On verifie la parite
    CMP #1,d1
    BEQ IMPAIR
EST_PAIRE:
    *cas paire
    move #14,d0
    lea textd1,a1 
    trap #15
    move #3,d0
    move.w d2,d1 
    trap #15
    move #14,d0
    lea textismod,a1   
    trap #15 
    bsr newLine
FIN_EST_PAIR:
    BRA FINMOD    
IMPAIR:
    *cas impair
    move #14,d0
    lea textd1,a1 
    trap #15
    move #3,d0
    move.w d2,d1 
    trap #15
    move #14,d0
    lea textntmod,a1   
    trap #15 
    bsr newLine
FINMOD:    
    
        

    SIMHALT             ; halt simulator

newLine movem.l d0/a1,-(a7) push d0 & a1
    move    #14,d0      task number into D0
    lea     crlf,a1     address of string
    trap    #15         display return, linefeed
    movem.l (a7)+,d0/a1 restore d0 & a1
    rts 

* Put variables and constants here
textd1 dc.b    'd1=',0   null terminated string
textismod  dc.b    ' est pair ',0   null terminated string
textntmod  dc.b    ' est impair ',0   null terminated string
crlf    dc.b    $d,$a,0     carriage return & line feed, null

    END    START        ; last line of source




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
