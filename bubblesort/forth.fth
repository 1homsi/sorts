7 constant SIZE
create data 64 , 34 , 25 , 12 , 22 , 11 , 90 ,

: get ( i -- n ) cells data + @ ;
: put ( n i -- ) cells data + ! ;

: bubble-pass ( n -- swapped )
    false swap 1- 0 do
        i get i 1+ get > if
            i get i 1+ get
            i put i 1+ swap put
            drop true
        then
    loop ;

: bubble-sort ( -- )
    SIZE
    begin dup bubble-pass while swap 1- swap repeat
    2drop ;

bubble-sort
SIZE 0 do i get . loop cr
