*-----------------------------------------------------------
* Title      :Tri à bulle
* Written by :Melvin,Venceslas
* Date       :
* Description:Cette version du tri est adapté pour des valeurs de un octet et peut marcher pour des word(2) avec quelques modifications, par contre cela sera plus complique avec des long(4)
* car l'utilisation de certains operateurs comme divu entrainent un dépassement sur des long
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    bsr initTab
    bsr affTab
    bsr verifTri
    *Si trie on ne rentre pas dans l'algo de tri
    cmp #1,d3
    beq EST_TRIEE
    move.l d4,d2
    add #-1,d4
*equivalent à une double boucle, à chaque tour on decremente la taille max de notre tableau
*car la valeur la plus grande de notre tri est déjà dedans et ainsi de suite
DEBTRIBULLE
    move.l #0,d3    
    move.l #tabvar,a2
    move.l #tabvar,a3
    addq.l #1,a3
 
DEBPARCBULLE
    bsr echangeval
    add.b #1,d3
    addq.l #1,a2
    addq.l #1,a3    
    cmp d3,d4
    bne DEBPARCBULLE
    add #-1,d4    
    cmp #0,d4
    bne DEBTRIBULLE
    move.l d2,d6
    bsr newLinemain
    bsr affTab
EST_TRIEE    
    
    SIMHALT             ; halt simulator
    
newLinemain movem.l d0/a1,-(a7) push d0 & a1
    move    #14,d0      task number into D0
    lea     crlmain,a1     address of string
    trap    #15         display return, linefeed
    movem.l (a7)+,d0/a1 restore d0 & a1
    rts     

* Appels de toutes nos bibliotheques de fonction, elle sont basées sur les programmes des exos précédent avec
* quelques modifications pour tout faire marcher globalement
    INCLUDE "C:\Users\melvi\Desktop\asmtp\TPpart3\triASM68k\initTab.X68"
    INCLUDE "C:\Users\melvi\Desktop\asmtp\TPpart3\triASM68k\affTab.X68"
    INCLUDE "C:\Users\melvi\Desktop\asmtp\TPpart3\triASM68k\echangeval.X68"
    INCLUDE "C:\Users\melvi\Desktop\asmtp\TPpart3\triASM68k\verifTri.X68" 

crlmain    dc.b    $d,$a,0     carriage return & line feed, null
    END    START        ; last line of source




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
