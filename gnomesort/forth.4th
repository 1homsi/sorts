: SWAP-CELLS ( addr i -- )
    CELLS OVER + SWAP CELLS + SWAP
    2DUP @ SWAP @ ROT ! SWAP ! ;

: GNOME-SORT ( addr n -- )
    0 ( addr n i )
    BEGIN
        2 PICK OVER <
    WHILE
        DUP 0= IF
            1+
        ELSE
            2DUP 1- CELLS 4 PICK + @ OVER CELLS 4 PICK + @ >
            IF
                2DUP 1- 4 PICK SWAP-CELLS
                1-
            ELSE
                1+
            THEN
        THEN
    REPEAT
    DROP DROP DROP ;
