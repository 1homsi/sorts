: SELECTION-SORT ( addr n -- )
    1- 0 DO
        I 2DUP + DUP >R
        I 1+ DO
            I CELLS OVER + @ R@ CELLS OVER + @ < IF
                I R> DROP >R
            THEN
        LOOP
        OVER I CELLS + @ R@ CELLS OVER + @ SWAP
        OVER I CELLS + ! R> CELLS OVER + !
    LOOP DROP ;
