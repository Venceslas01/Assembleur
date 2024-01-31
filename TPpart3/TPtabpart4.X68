*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    
    move.b #5,d6
    move.w #valtab,a0
    move.w #valtab,a1
    
    *On effectue l'echange de nos deux valeurs
    *On choisit arbitrairement 2 valeurs au sein du tableau, le 1er indice d'un tableau est 0
    addq.l #4,a0
    addq.l #1,a1
    move.b (a0),d1
    move.b (a1),d2
    move.b (a0),(a1)
    move.b d2,(a0)
    bsr affTab

    SIMHALT             ; halt simulator

affTab
    move.l #valtab,a2
REPETEAFF:
    move.b (a2),d1
    move.l #3,d0
    trap #15
    move.l #14,d0
    lea texttiret,a1 
    trap #15
    addq.l #1,a2
    add #-1,d6        
    cmp #0,d6    
    BNE REPETEAFF
    *On affiche le resultat de l'addition
    bsr newline
    rts

newLine movem.l d0/a1,-(a7) push d0 & a1
    move    #14,d0      task number into D0
    lea     crlf,a1     address of string
    trap    #15         display return, linefeed
    movem.l (a7)+,d0/a1 restore d0 & a1
    rts 

* Put variables and constants here
valtab dc.b 50,20,25,34,120
texttiret dc.b '-',0
crlf    dc.b    $d,$a,0     carriage return & line feed, null
    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
