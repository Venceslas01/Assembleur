*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    move.w #0,d5
    
SI:
    *On effectue la premiere comparaison
    CMP #0,d5
    BNE SINON
ALORS:
    *Nombre nul
    *on affiche
    move #14,d0
    lea textd5,a1 
    trap #15
    move.w #3,d0
    move.w d5,d1
    trap #15
    move #14,d0
    lea textnul,a1
    trap #15   
    bsr newLine
FIN_ALORS:
    BRA FINSI    
SINON:
    *Si les valeurs de d2 et d4 sont differentes on les compares une nouvelle fois pour
    *deduire la plus grande des deux 
SICMP2:
    BLT SINONCMP2
ALORSCMP2:
    *cas ou d1 plus grand que 0
    move #14,d0
    lea textd5,a1 
    trap #15
    move.w #3,d0
    move.w d5,d1
    trap #15
    move #14,d0
    lea textpos,a1
    trap #15   
    bsr newLine   
FIN_ALORSCMP2
    BRA FINSICMP2 
SINONCMP2:
    *cas ou d1 inferieur � 0
    move #14,d0
    lea textd5,a1 
    trap #15
    move.w #3,d0
    move.w d5,d1
    trap #15
    move #14,d0
    lea textneg,a1  
    trap #15 
    bsr newLine  

FINSICMP2:    
FINSI:    
    
        

    SIMHALT             ; halt simulator

newLine movem.l d0/a1,-(a7) push d0 & a1
    move    #14,d0      task number into D0
    lea     crlf,a1     address of string
    trap    #15         display return, linefeed
    movem.l (a7)+,d0/a1 restore d0 & a1
    rts 

* Put variables and constants here
textd5 dc.b    'd5=',0   null terminated string
textnul  dc.b    ' IS NULL',0   null terminated string
textpos  dc.b    ' IS POSITIVE ',0   null terminated string
textneg  dc.b    ' IS NEGATIVE ',0   null terminated string
crlf    dc.b    $d,$a,0     carriage return & line feed, null

    END    START        ; last line of source




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
