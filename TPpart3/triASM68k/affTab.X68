*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $2000

affTab
    move.l #tabvar,a2
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
    bsr newlineaff
    rts


newLineaff movem.l d0/a1,-(a7) push d0 & a1
    move    #14,d0      task number into D0
    lea     crlf,a1     address of string
    trap    #15         display return, linefeed
    movem.l (a7)+,d0/a1 restore d0 & a1
    rts 

texttiret dc.b '-',0    
crlf    dc.b    $d,$a,0     carriage return & line feed, null



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
