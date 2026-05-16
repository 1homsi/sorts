: STOOGE-SORT ( addr first last -- )
    2>R OVER
    2R@ OVER - ROT SWAP
    CELLS + @ SWAP CELLS + @
    > IF
        2R@ SWAP OVER OVER
        2R@ NIP CELLS + @ ROT CELLS + !
        CELLS + !
    THEN
    2R@ - 1+
    DUP 2 > IF
        2 * 3 /
        2R@ SWAP OVER + 1- ROT RECURSE
        2R@ NIP OVER - 1+ SWAP 2R@ NIP RECURSE
        2R@ SWAP OVER + 1- ROT RECURSE
    ELSE DROP THEN
    2R>DROP ;

CREATE DATA 3 , 1 , 4 , 1 , 5 , 9 , 2 , 6 ,
DATA 0 7 STOOGE-SORT
8 0 DO DATA I CELLS + @ . LOOP CR
