CREATE data 170 , 45 , 75 , 90 , 802 , 24 , 2 , 66 ,
CREATE buf 8 CELLS ALLOT
CREATE cnt 10 CELLS ALLOT

: []  ( base i -- addr ) CELLS + ;
: get ( base i -- n ) [] @ ;
: set ( n base i -- ) [] ! ;

: clear-cnt 10 0 DO 0 cnt I set LOOP ;

: find-max ( -- max )
  data 0 get
  1 7 DO data I get MAX LOOP ;

: do-count ( exp -- )
  >R clear-cnt
  8 0 DO data I get R@ / 10 MOD DUP cnt SWAP get 1 + SWAP cnt SWAP set LOOP
  R> DROP
  1 9 DO cnt I get cnt I 1- get + cnt I set LOOP ;

: do-output ( exp -- )
  >R
  7 0 DO
    8 I - 1- >R
    data R@ get R@ R@ 2>R R> drop
    R@ R> R@ / 10 MOD
    DUP cnt SWAP get 1 - DUP ROT cnt ROT set
    buf ROT set
    R> DROP
  LOOP R> DROP ;

: copy-back 8 0 DO buf I get data I set LOOP ;

: radix-sort
  find-max 1
  BEGIN 2DUP / 0 > WHILE
    DUP do-count DUP do-output copy-back
    10 *
  REPEAT 2DROP ;

radix-sort
8 0 DO data I get . LOOP CR
