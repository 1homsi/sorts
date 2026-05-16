7 constant SIZE
create arr 64 , 34 , 25 , 12 , 22 , 11 , 90 ,

: arr@ ( i -- n ) cells arr + @ ;
: arr! ( n i -- ) cells arr + ! ;

: swap-elements ( i -- )
    dup arr@ over 1+ arr@ swap
    over arr! over 1+ rot arr! drop ;

: bubble-pass ( n -- swapped )
    0 swap 1- 0 do
        i arr@ i 1+ arr@ > if
            i swap-elements
            drop 1
        then
    loop ;

: bubble-sort
    SIZE
    begin
        dup bubble-pass
    over 0 > and while
        swap 1- swap
    repeat
    2drop ;

bubble-sort
SIZE 0 do i arr@ . loop cr
