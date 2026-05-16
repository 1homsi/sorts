: arr 8 cells allot ;
create data 3 , 1 , 4 , 1 , 5 , 9 , 2 , 6 ,

: n 8 ;

: at ( i -- addr ) cells data + ;

: is-sorted ( -- flag )
  true
  n 1 - 0 do
    i at @ i 1 + at @ > if drop false leave then
  loop ;

: swap-cells ( i j -- )
  2dup at @ swap at @ swap
  at ! swap at ! ;

: shuffle
  n 1 do
    n i - 1 + random i
    swap-cells
  loop ;

: bogosort
  begin is-sorted 0= while shuffle repeat ;

bogosort
n 0 do i at @ . loop cr
