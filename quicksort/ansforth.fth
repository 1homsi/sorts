CREATE ARR 3 , 6 , 8 , 10 , 1 , 2 , 1 ,

: A@ ( i -- n ) CELLS ARR + @ ;
: A! ( n i -- ) CELLS ARR + ! ;

: SWAP-ELEMS ( i j -- )
  OVER A@ OVER A@
  ROT A! SWAP A! ;

: PARTITION ( low high -- p )
  DUP A@ >R
  OVER
  2DUP < IF
    BEGIN
      DUP A@ R@ <= IF
        2 PICK OVER SWAP-ELEMS
        ROT 1+ -ROT
      THEN
      1+
    2DUP < 0= UNTIL
  THEN
  DROP NIP
  DUP A@ R>
  2 PICK A!
  SWAP A! ;

: QS ( low high -- )
  2DUP < IF
    2DUP PARTITION
    OVER 1- 2 PICK RECURSE
    1+ RECURSE
  ELSE
    2DROP
  THEN ;

0 6 QS
7 0 DO I A@ . LOOP CR
