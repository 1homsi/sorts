create arr 3 , 7 , 4 , 8 , 6 , 2 , 1 , 5 ,

: arr@ ( i -- n ) cells arr + @ ;
: arr! ( n i -- ) cells arr + ! ;

: swap-elements ( i j -- )
  over arr@ over arr@ rot arr! swap arr! ;

: compare-and-swap ( i j dir -- )
  >r over arr@ over arr@ > r> =
  if swap-elements else 2drop then ;

: bitonic-merge ( lo cnt dir -- )
  dup 1 <= if drop 2drop exit then
  >r 2dup r>
  over 2/ >r
  2dup drop r@ 0 do
    2dup drop i + 2dup drop i 2dup drop r@ + rot compare-and-swap
  loop r>
  drop drop drop drop ;

: bitonic-sort ( lo cnt dir -- )
  dup 1 <= if drop 2drop exit then
  >r over over r>
  over 2/ >r
  3dup drop drop r@ 1 bitonic-sort
  3dup r@ + swap r@ swap 0 bitonic-sort
  r> bitonic-merge ;

: print-arr ( -- )
  8 0 do arr i arr@ . loop cr ;

0 8 1 bitonic-sort
print-arr
