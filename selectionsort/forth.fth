: swap-at ( addr i j -- )
  2dup 2>r
  cells + @ 2r> cells + @ swap
  rot cells + ! swap rot cells + ! ;

: selection-sort ( addr n -- )
  1- 0 ?do
    i 2dup + dup >r
    i 1+ do
      i over @ < if i r> drop >r then
    loop
    over r@ swap-at r> drop
  loop drop ;
