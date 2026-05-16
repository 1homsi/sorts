\ Timsort in Forth
32 CONSTANT MIN-RUN

VARIABLE N
CREATE ARR 9 CELLS ALLOT

: ARR! ( val idx -- ) CELLS ARR + ! ;
: ARR@ ( idx -- val ) CELLS ARR + @ ;

: INIT-ARR
    5 0 ARR! 2 1 ARR! 8 2 ARR! 1 3 ARR!
    9 4 ARR! 3 5 ARR! 7 6 ARR! 4 7 ARR! 6 8 ARR!
    9 N ! ;

: INSERTION-SORT ( left right -- )
    OVER 1+ SWAP DO
        I ARR@ DUP
        I 1- OVER
        BEGIN
            DUP ROT DUP ROT
            2DUP 0>= SWAP PICK 0 CELLS + > AND
        WHILE
            DUP 1+ PICK SWAP 1+ ARR!
            1-
        REPEAT
        DROP 1+ ARR!
    LOOP ;

: TIMSORT
    INIT-ARR
    0
    BEGIN DUP N @ < WHILE
        DUP DUP MIN-RUN + 1- N @ 1- MIN
        2DUP > IF 2DROP 2DROP ELSE INSERTION-SORT THEN
        MIN-RUN +
    REPEAT DROP
    N @ 0 DO I ARR@ . LOOP CR ;

TIMSORT
