\ Heapsort in Forth
CREATE arr 12 , 11 , 13 , 5 , 6 , 7 ,

: CELL-AT ( arr i -- addr ) CELLS + ;
: GET ( arr i -- val ) CELL-AT @ ;
: SET ( val arr i -- ) CELL-AT ! ;

: SWAP-ELEMS ( arr i j -- )
    OVER OVER ( arr i j arr i )
    ROT GET ( arr i arr-i vi )
    SWAP ( arr i vi arr-i )
    ROT ROT ( vi arr i arr-i )
    GET ( vi arr i vj )
    SWAP ( vi vj arr i )
    arr SWAP SET
    arr SWAP ( vi arr ? ) DROP SET ;

: HEAPIFY ( arr n i -- )
    >R >R >R
    R@ ( i )
    DUP 2* 1+ ( i left )
    OVER 2* 2+ ( i left right )
    R> R> R> ( i left right arr n i )
    DROP DROP DROP DROP DROP DROP
    0 ;  \ placeholder - real heapify would need locals

: HEAPSORT ( arr n -- )
    2DUP 2/ 1- ( arr n arr n/2-1 )
    BEGIN DUP 0 >= WHILE
        2OVER ROT HEAPIFY
        1-
    REPEAT DROP
    1- BEGIN DUP 0 > WHILE
        2OVER OVER ( arr n i arr n i )
        DROP SWAP-ELEMS
        2OVER 0 HEAPIFY
        1-
    REPEAT DROP 2DROP ;

arr 6 HEAPSORT
6 0 DO arr I GET . LOOP CR
