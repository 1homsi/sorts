create arr 3 , 1 , 4 , 1 , 5 , 9 , 2 , 6 ,
8 constant n

: cell-at ( i -- addr ) cells arr + ;

: is-sorted ( -- flag )
  true
  n 1 - 0 do
    i cell-at @ i 1+ cell-at @ > if drop false leave then
  loop ;

: swap-at ( i j -- )
  over cell-at @
  over cell-at @
  rot cell-at !
  swap cell-at ! ;

: do-shuffle
  n 1 do
    n i - random i
    2dup swap-at
  loop ;

: bogosort
  begin is-sorted 0= while do-shuffle repeat ;

bogosort
n 0 do i cell-at @ . loop cr
