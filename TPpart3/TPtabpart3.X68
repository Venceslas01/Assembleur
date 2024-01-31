*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
    *on renseigne notre compteur
    move #0,d6
    move.l #valtab,a2
    move.b (a2),d1
    *d5 sert de booleen pour verifier le tri du tableau
    move.l #0,d5
    *ici on renseigne la taille de notre tableau d'element
    move.b #5,d4
* Put program code here
    bsr parctab
EST_TRIE:
    cmp #0,d5
    beq TRIE
NON_TRIE:
    move #14,d0
    lea text_nontrie,a1
    trap #15
    bra FINTRIE
FIN_NON_TRIE:

TRIE:
    move #14,d0
    lea text_trie,a1
    trap #15
FIN_TRIE:
FINTRIE:

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
  
    SIMHALT             ; halt simulator
    
* Put variables and constants here
text_trie dc.b 'le tableau est triee',0
text_nontrie dc.b 'le tableau n est pas triee',0
valtab dc.b -120,-12,25,34,120
    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
