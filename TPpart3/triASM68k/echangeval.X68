*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $7000
    
echangeval    
    move.b (a2),d5
    move.b (a3),d6
verifcroissant
    cmp d5,d6
    bgt finverifcroissant    
    move.b (a2),(a3)
    move.b d6,(a2)
finverifcroissant
    rts    









*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
