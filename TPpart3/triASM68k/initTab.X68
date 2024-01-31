*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $9000

initTab                  ; first instruction of program
* Put program code here
    *on initialise le nombre max de notre tableau possible
    move.w #limiternum,a0
    move.b #100,(a0)
    *on choisit une valeur aléatoire à additionner
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
    move.l d1,d4
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
    rts
 
newLine movem.l d0/a1,-(a7) push d0 & a1
    move    #14,d0      task number into D0
    lea     crlfinit,a1     address of string
    trap    #15         display return, linefeed
    movem.l (a7)+,d0/a1 restore d0 & a1
    rts 
    
* Put variables and constants here
tabvar ds.b 1000
    ds.w 0
text_tab  dc.b    'donnez la taille du tableau: ',0   null terminated string
textval  dc.b    'Donnez une valeur pour le tableau ou -1 pour arreter: ',0   null terminated string
limiternum ds.b 1  *permet de fixer une taille max à notre nombre
crlfinit    dc.b    $d,$a,0     carriage return & line feed, null
valadd ds.b 1   *valeur aléatoire ajoute pour generer notre nombre


















*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
