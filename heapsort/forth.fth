\ Heapsort in Forth
VARIABLE N
CREATE ARR 12 , 11 , 13 , 5 , 6 , 7 ,

: CELL@ ( base idx -- val ) CELLS + @ ;
: CELL! ( val base idx -- ) CELLS + ! ;

: SWAP-ELEMS ( i j -- )
    2DUP
    ARR SWAP CELL@  ( i j vi )
    ARR 2PICK CELL@  ( i j vi vj )
    ARR 4 PICK CELL!  ( i j vi )
    ARR ROT CELL!
    DROP ;

: HEAPIFY ( n i -- )
    2DUP 2* 1+  ( n i left )
    OVER 2* 2+  ( n i left right )
    4 PICK OVER < IF
        3 PICK OVER ARR CELL@  ARR 3 PICK CELL@  >
        IF 2SWAP 2DROP SWAP DROP ELSE DROP THEN
    ELSE DROP THEN
    ( n i largest )
    2DUP <> IF
        OVER OVER SWAP-ELEMS
        ROT SWAP RECURSE
    ELSE
        2DROP
    THEN ;

: HEAPSORT ( -- )
    6 N !
    N @ 2/ 1- BEGIN DUP 0 >= WHILE
        N @ OVER HEAPIFY
        1-
    REPEAT DROP
    N @ 1- BEGIN DUP 1 >= WHILE
        0 OVER SWAP-ELEMS
        DUP 0 HEAPIFY
        1-
    REPEAT DROP ;

HEAPSORT
6 0 DO ARR I CELL@ . LOOP CR
