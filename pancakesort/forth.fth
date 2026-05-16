\ Pancake Sort in Forth (ANS)
variable arr-base
create arr-data 3 , 6 , 2 , 7 , 4 , 1 , 5 ,
arr-data arr-base !
7 constant n

: arr@ ( idx -- val ) cells arr-base @ + @ ;
: arr! ( val idx -- ) cells arr-base @ + ! ;

: swap-idx ( i j -- )
    over arr@ over arr@ ( i j vi vj )
    2 pick arr!
    swap arr! ;

: flip ( k -- )
    0 swap
    begin 2dup < while
        2dup swap-idx
        swap 1+ swap 1-
    repeat 2drop ;

: find-max-idx ( size -- idx )
    0 swap ( idx size )
    1 swap ( idx 1 size )
    begin 2dup > while
        nip over ( size idx idx )
        2dup arr@ swap arr@
        < if drop nip ( idx -> new )
          2dup ( size newmax newmax )
        else drop
        then
        1+ nip
    repeat drop ;

: pancake-sort
    n begin dup 1 > while
        dup find-max-idx
        2dup 1- <> if
            dup 0 <> if dup flip then
            over 1- flip
        else 2drop then
        1-
    repeat drop ;

pancake-sort
n 0 do i arr@ . loop cr
