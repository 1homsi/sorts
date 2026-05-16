\ Pancake Sort in Forth
create arr 3 , 6 , 2 , 7 , 4 , 1 , 5 ,
7 constant n

: arr@ ( idx -- val ) cells arr + @ ;
: arr! ( val idx -- ) cells arr + ! ;

: swap-elements ( i j -- )
    over arr@ over arr@ ( i j vi vj )
    2 pick arr!  ( i j vi )
    rot arr!     ( j vi -> stored )
;

: flip ( k -- )
    0 swap ( left right=k )
    begin 2dup < while
        2dup swap-elements
        swap 1+ swap 1-
    repeat 2drop ;

: find-max-idx ( size -- idx )
    0 ( size max-idx )
    1 begin 2 pick over > while
        dup arr@ over arr@ ( size max-idx i vi vmax )
        2 pick arr@ ( size max-idx i vi vmax )
        over < if drop nip ( size i )
        else drop drop
        then
        1+
    repeat drop nip ;

: pancake-sort
    n begin dup 1 > while
        dup find-max-idx ( size max-idx )
        2dup 1- <> if
            dup 0 <> if dup flip then
            over 1- flip
        else 2drop then
        1-
    repeat drop ;

pancake-sort
n 0 do i arr@ . loop cr
