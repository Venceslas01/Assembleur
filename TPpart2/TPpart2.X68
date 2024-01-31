*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    move.w #789,D2
    move.w #789,D4
    
SI:
    *On effectue la premiere comparaison
    CMP d2,d4
    BNE SINON
ALORS:
    *Si d2 et d4 sont egaux
    *on affiche
    move #14,d0
    lea textd2,a1 
    trap #15 
    move.w #3,d0
    move.w d2,d1
    trap #15
    move #14,d0
    lea textequal,a1   
    trap #15
    move #14,d0
    lea textd4,a1
    trap #15      
    move.w #3,d0
    move.w d4,d1
    trap #15
    bsr newLine
FIN_ALORS:
    BRA FINSI    
SINON:
    *Si les valeurs de d2 et d4 sont differentes on les compares une nouvelle fois pour
    *deduire la plus grande des deux 
SICMP2:
    BPL SINONCMP2
ALORSCMP2:
    *cas on d2 est le plus grand
    move #14,d0
    lea textd2,a1 
    trap #15 
    move.w #3,d0
    move.w d2,d1
    trap #15
    move #14,d0
    lea textgt,a1   
    trap #15
    move #14,d0
    lea textd4,a1
    trap #15      
    move.w #3,d0
    move.w d4,d1
    trap #15 
    bsr newLine    
FIN_ALORSCMP2
    BRA FINSICMP2 
SINONCMP2:
    *cas ou d4 est le plus grand
    move #14,d0
    lea textd2,a1 
    trap #15 
    move.w #3,d0
    move.w d2,d1
    trap #15
    move #14,d0
    lea textlt,a1  
    trap #15
    move #14,d0
    lea textd4,a1
    trap #15      
    move.w #3,d0
    move.w d4,d1
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
textd2 dc.b    'd2=',0   null terminated string
textd4 dc.b    ' d4=',0   null terminated string
textequal  dc.b    ' EQUAL ',0   null terminated string
textgt  dc.b    ' greater than ',0   null terminated string
textlt  dc.b    ' lesser than ',0   null terminated string
crlf    dc.b    $d,$a,0     carriage return & line feed, null

    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
