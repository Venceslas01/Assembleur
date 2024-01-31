*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $6000


veriftri
    *on renseigne notre compteur
    move #0,d6
    move.l #tabvar,a2
    move.b (a2),d1
    *d5 sert de booleen pour verifier le tri du tableau
    move.l #0,d5
* Put program code here
    bsr parctab
SI_NON_TRIE:
    cmp #0,d5
    beq SINON_TRIE
ALORS_NON_TRIE:
    move #14,d0
    lea text_nontrie,a1
    trap #15
    move.l #0,d3
    bra FINAFF
FINALORS_NON_TRIE:

SINON_TRIE:
    move #14,d0
    lea text_trie,a1
    trap #15
    move.l #1,d3
FINSINON_TRIE:
FINAFF:
    rts

parctab
*boucle qui parcourt le tableau en verifiant que la valeur actuelle est toujour inferieur 
*à la valeur precedente
VERIFTBOUCLE:
    cmp d4,d6
    beq FINVERIFB
CMPTRI:
    *on conpare l'élément actuelle au precedent
    move.b (a2),d3
    cmp.b d3,d1
    bgt CPMTFALSE
FINCMPTRI:
    bra FINVERIFTRI
CPMTFALSE:
    *ici on renvoie la taille max de tab à d6 pour sortir de la boucle 
    move.l #1,d5
    bra FINVERIFB
FINVERIFTRI:
    *Si on ne rentre pas dans if f1 prend la valeur actulle pointe par l'adresse a2
    *On incremente l'adresse de a2 et la valeur dans d6
    move.b (a2),d1
    addq.l #1,a2
    add.b #1,d6    
    BRA VERIFTBOUCLE
FINVERIFB 
    rts    
    
* Put variables and constants here
text_trie dc.b 'le tableau est triee',0
text_nontrie dc.b 'le tableau n est pas triee',0







*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
