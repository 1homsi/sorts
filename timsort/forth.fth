\ ANS Forth Timsort

32 CONSTANT MIN-RUN

CREATE DATA 9 CELLS ALLOT
: D! ( val idx -- ) CELLS DATA + ! ;
: D@ ( idx -- val ) CELLS DATA + @ ;

: INIT
    5 0 D! 2 1 D! 8 2 D! 1 3 D!
    9 4 D! 3 5 D! 7 6 D! 4 7 D! 6 8 D! ;

: MIN2 ( a b -- min ) 2DUP < IF DROP ELSE NIP THEN ;

: ISORT ( left right -- )
    OVER 1+ DO
        I D@ ( key )
        I 1- ( key j )
        BEGIN
            DUP OVER 4 PICK >= ( key j j>=left )
            OVER CELLS DATA + @ 3 PICK > AND
        WHILE
            DUP CELLS DATA + @ OVER 1+ CELLS DATA + !
            1-
        REPEAT
        1+ CELLS DATA + !
    LOOP ;

: TIMSORT ( n -- )
    INIT
    0 ( i )
    BEGIN DUP OVER < WHILE
        DUP DUP MIN-RUN + 1- 2 PICK 1- MIN2
        2DUP ISORT
        DROP MIN-RUN +
    REPEAT 2DROP ;

9 TIMSORT
9 0 DO I D@ . LOOP CR
