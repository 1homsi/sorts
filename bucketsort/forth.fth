\ Bucket Sort implementation in Forth

CREATE data 10 CELLS ALLOT
CREATE bdata 100 CELLS ALLOT
CREATE bcnt 10 CELLS ALLOT

: data! CELLS data + ! ;
: data@ CELLS data + @ ;
: bdata! ( val b i -- ) SWAP 10 * + CELLS bdata + ! ;
: bdata@ ( b i -- val ) SWAP 10 * + CELLS bdata + @ ;
: bcnt! CELLS bcnt + ! ;
: bcnt@ CELLS bcnt + @ ;

: init-data
    78 0 data!  17 1 data!  39 2 data!  26 3 data!  72 4 data!
    94 5 data!  21 6 data!  12 7 data!  23 8 data!  68 9 data!
    10 0 DO 0 I bcnt! LOOP ;

: find-min-max ( n -- min max )
    0 data@ DUP
    1 DO
        I data@ OVER > IF DROP I data@ THEN
        I data@ 2OVER DROP < IF NIP I data@ SWAP THEN
    LOOP ;

: bucket-sort ( n -- )
    DUP find-min-max { n min max }
    n 0 DO
        I data@ min -
        max min - 1+ /
        n *
        n 1- MIN { idx }
        I data@ idx bcnt@ idx bdata!
        idx bcnt@ 1+ idx bcnt!
    LOOP
    0 { pos }
    n 0 DO
        I bcnt@ { m }
        1 m 1- DO
            I I bcnt@ bdata@ { key }
            I 1- { j }
            BEGIN j 0>= j I bcnt@ bdata@ key > AND WHILE
                j I bcnt@ bdata@ j 1+ I bcnt@ bdata!
                j 1- TO j
            REPEAT
            key j 1+ I bcnt@ bdata!
        LOOP
        0 m 1- DO
            I I bcnt@ bdata@ pos data!
            pos 1+ TO pos
        LOOP
    LOOP ;

init-data 10 bucket-sort
10 0 DO I data@ . LOOP CR
