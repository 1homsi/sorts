: CELL-AT ( addr i -- addr' )
    CELLS + ;

: @AT ( addr i -- n )
    CELL-AT @ ;

: !AT ( n addr i -- )
    CELL-AT ! ;

: GNOME-SORT ( addr n -- )
    SWAP >R
    0 ( i )
    BEGIN
        DUP R@ <
    WHILE
        DUP 0= IF
            1+
        ELSE
            DUP 1- R@ OVER @AT OVER @AT >
            IF
                2DUP 1- R@ SWAP @AT
                OVER 1- R@ ROT @AT SWAP R@ SWAP !AT
                R@ SWAP !AT
                1-
            ELSE
                1+
            THEN
        THEN
    REPEAT
    DROP R> DROP ;
