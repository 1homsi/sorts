: STOOGE-SORT ( arr first last -- )
    2DUP OVER - 1+ 2 > IF
        2DUP OVER - 1+ 2 * 3 / >R
        2DUP DROP R@ + 1-
        RECURSE
        2DUP NIP R@ - 1+
        SWAP ROT
        RECURSE
        2DUP DROP R@ + 1-
        RECURSE
        R>DROP
    ELSE
        2DROP DROP
    THEN ;

CREATE ARR 3 , 1 , 4 , 1 , 5 , 9 , 2 , 6 ,
ARR 0 7 STOOGE-SORT
8 0 DO ARR I CELLS + @ . LOOP CR
