\ Bucket Sort in Forth

CREATE arr 10 CELLS ALLOT
CREATE buckets 100 CELLS ALLOT
CREATE counts 10 CELLS ALLOT

: arr! ( val idx -- ) CELLS arr + ! ;
: arr@ ( idx -- val ) CELLS arr + @ ;
: bucket@ ( b i -- val ) 10 * + CELLS buckets + @ ;
: bucket! ( val b i -- ) 10 * + CELLS buckets + ! ;
: count@ ( b -- n ) CELLS counts + @ ;
: count! ( n b -- ) CELLS counts + ! ;

: init-data
  78 0 arr!  17 1 arr!  39 2 arr!  26 3 arr!  72 4 arr!
  94 5 arr!  21 6 arr!  12 7 arr!  23 8 arr!  68 9 arr!
  10 0 DO 0 I count! LOOP ;

: min-max ( -- min max )
  0 arr@ DUP
  10 1 DO
    I arr@ OVER > IF DROP I arr@ THEN
    I arr@ 2OVER DROP < IF NIP I arr@ SWAP THEN
  LOOP ;

: get-idx ( num min max n -- idx )
  ROT 2OVER DROP - ROT ROT - 1+ */ MIN 9 MIN ;

: insertion-sort ( b -- )
  10 0 DO
    I count@ 0 > IF
      I 1 bucket@ I 0 bucket@ < IF
        I 0 bucket@ I 1 bucket@ I 0 bucket!
        I 1 bucket!
      THEN
    THEN
  LOOP ;

: bucket-sort
  min-max 10
  10 0 DO
    I arr@ 2OVER GET-IDX DUP count@ I bucket! 1+ I count!
  LOOP
  10 0 DO I insertion-sort LOOP ;

init-data bucket-sort
10 0 DO I arr@ . LOOP CR
