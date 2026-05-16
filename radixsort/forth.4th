CREATE arr 170 , 45 , 75 , 90 , 802 , 24 , 2 , 66 ,
CREATE output 8 CELLS ALLOT
CREATE count 10 CELLS ALLOT

: arr@ ( i -- n ) CELLS arr + @ ;
: arr! ( n i -- ) CELLS arr + ! ;
: out@ ( i -- n ) CELLS output + @ ;
: out! ( n i -- ) CELLS output + ! ;
: cnt@ ( i -- n ) CELLS count + @ ;
: cnt! ( n i -- ) CELLS count + ! ;

: clear-count 10 0 DO 0 I cnt! LOOP ;

: find-max ( -- max )
  arr@ 1 7 DO arr@ I arr@ MAX LOOP ;

: counting-sort ( exp -- )
  >R
  clear-count
  8 0 DO arr@ I arr@ R@ / 10 MOD DUP cnt@ 1+ SWAP cnt! LOOP
  1 9 DO I cnt@ I 1- cnt@ + I cnt! LOOP
  7 0 DO arr@ 7 I - R@ / 10 MOD DUP cnt@ 1- OVER cnt! cnt@ I out! LOOP
  8 0 DO out@ I arr@ I arr! LOOP
  R> DROP ;

: radix-sort
  find-max 1
  BEGIN 2DUP / 0> WHILE
    counting-sort
    10 *
  REPEAT 2DROP ;

radix-sort
8 0 DO arr@ I . LOOP CR
