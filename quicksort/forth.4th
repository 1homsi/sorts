variable arr-base

: arr@ ( i -- n ) cells arr-base @ + @ ;
: arr! ( n i -- ) cells arr-base @ + ! ;
: swap-arr ( i j -- ) over arr@ over arr@ rot arr! swap arr! ;

: partition ( low high -- pivot-idx )
  over arr@ -rot over ( pivot low high low )
  dup rot ( pivot low low high )
  begin 2dup < while
    2dup swap arr@ ( pivot low low high arr[low] )
    4 pick <= if ( pivot low low high )
      2 pick over swap-arr ( pivot low low high )
      rot 1+ rot rot ( pivot low+1 low high )
    then
    1+
  repeat
  drop nip ( pivot i high )
  drop ( pivot i )
  swap over arr! ( i )
  dup arr-base @ swap cells + ! ;

: quicksort ( low high -- )
  2dup < if
    2dup partition ( low high p )
    rot drop ( high p )
    swap over 1- ( p high p-1 )
    rot ( high p-1 )
    swap ( p-1 high ) swap
    rot rot ( low high=p-1 ) drop
    2dup 1+ swap quicksort
  then
  2drop ;

create data 3 , 6 , 8 , 10 , 1 , 2 , 1 ,
data arr-base !
0 6 quicksort
7 0 do i arr@ . loop cr
