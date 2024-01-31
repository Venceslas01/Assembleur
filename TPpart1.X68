*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
    move.l #-2147483647,$0900
    move.l #2147483647,$0904
    *addition des 3 premier nombre du tableau
    lea tab1,a1
    move.l #tab1,a2
    move.b (a1),d1 
    move.b 1(a1),d2
    bsr additionrgs
    lea tab1,a1
    move.l #0,d2
    move.b 2(a1),d2
    bsr additionrgs
    *addition entre differents nombre
    * tab2[4]+tab3[2]
    lea tab2,a2
    lea tab3,a3
    move.l #0,d2
    move.l #0,d1
    move.w 6(a2),d1 
    move.l 4(a3),d2
    bsr additionrgs
    * tab1[2]+tab2[1]
    lea tab1,a2
    lea tab2,a3
    move.l #0,d2
    move.l #0,d1   
    move.b 1(a2),d1 
    move.w (a3),d2
    bsr additionrgs
    * tab1[5]+tab3[4]
    lea tab1,a2
    lea tab3,a3
    move.l #0,d2
    move.l #0,d1
    move.b 4(a2),d1 
    move.l 12(a3),d2
    bsr additionrgs
    *addition val 32 bits
    move.l #0,d2
    move.l #0,d1
    move.l $0900,d1
    move.l $0904,d2
    bsr additionrgs
    *forcement les deux opposées s'annulent
    *add val 32bits+1
    move.l #0,d2
    move.l #0,d1
    move.l $0904,d1
    move.l #1,d2
    bsr additionrgs
    *Le dépassement dans les positifs nous fait devenir le plus petit des négatifs
* Put program code here

    SIMHALT             ; halt simulator
    
additionrgs
    add.l d2,d1
    move #14,d0
    lea textresult,a1   load address of string to display into A1
    trap #15         trap #15 activates input/output task
    move #3,d0
    trap #15
    bsr newLine    
    rts                 return    

newLine movem.l d0/a1,-(a7) push d0 & a1
    move    #14,d0      task number into D0
    lea     crlf,a1     address of string
    trap    #15         display return, linefeed
    movem.l (a7)+,d0/a1 restore d0 & a1
    rts 

* Put variables and constants here
textresult  dc.b    'Value contains: ',0   null terminated string
tab1 dc.b 45,78,12,9,77
tab2 dc.w 122,200,156,12,20
tab3 dc.l 4520,7895,1456,256,147
crlf    dc.b    $d,$a,0     carriage return & line feed, null

    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~16~
*~Tab type~1~
*~Tab size~4~
