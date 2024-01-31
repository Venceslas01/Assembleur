*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000

START:                  ; first instruction of program
* Put program code here
    *on initialise le nombre max de notre tableau possible
    move.w #limiternum,a0
    move.b #127,(a0)
    *on choisit une valeur aleatoire a additionner
    move.w #valadd,a0
    move.b #67,(a0)

 *On recupere la taille du tableau    
    move #14,d0
    lea text_tab,a1 
    trap #15
    bsr newline
 
    move.l #4,d0
    trap #15
    *on stock la taille du tableau dans un registre
    move.l d1,d5
    move.l d1,d6
    *on pointe le debut du tableau
    move.l #tabvar,a1
    
REPETE:
    move.l #0,d1
    *On recupere le timstamp
    move #8,d0
    *on ne garde que la partie des secondes écoulées
    trap #15
    swap d1
    clr.w d1
    swap d1
    *On calcule notre nombre (tempshorloge+valadd)%limite
    move.l #0,d2
    move.w #valadd,a0
    move.b (a0),d2    
    add.b d2,d1
    move.l #0,d2   
    move.w #limiternum,a0
    move.b (a0),d2
    divu d2,d1
    *On récupére le reste
    clr.w d1
    swap d1 
    *on enregistre la valeur dans notre tableau
    move.b d1,(a1)
    *on increment l'indice de notre tableau
    addq.l #1,a1
    *on decremente le tab
    add #-1,d5        
    cmp #0,d5
    BNE REPETE
    
    bsr affTab
    SIMHALT             ; halt simulator
    
newLine movem.l d0/a1,-(a7) push d0 & a1
    move    #14,d0      task number into D0
    lea     crlf,a1     address of string
    trap    #15         display return, linefeed
    movem.l (a7)+,d0/a1 restore d0 & a1
    rts 


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
    add.w d1,d5         
    cmp #0,d6   
    BNE REPETEAFF
    *On affiche le resultat de l'addition
    bsr newline
    move.l d5,d1
    move.l #3,d0
    trap #15
    
* Put variables and constants here
tabvar ds.b 1000
    ds.w 0
text_tab  dc.b    'donnez la taille du tableau: ',0   null terminated string
textval  dc.b    'Donnez une valeur pour le tableau ou -1 pour arreter: ',0   null terminated string
texttiret dc.b '-',0
limiternum ds.b 1
    DS.W 0
valadd ds.b 1
crlf    dc.b    $d,$a,0     carriage return & line feed, null

    END    START        ; last line of source




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
