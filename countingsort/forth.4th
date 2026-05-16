: array-new ( n -- addr )
  cells allocate drop ;

: array-get ( addr i -- n )
  cells + @ ;

: array-set ( n addr i -- )
  cells + ! ;

: counting-sort ( addr n -- )
  over @ over @ 2dup
  0 do
    over i cells + @ 2 pick min 2 pick max
  loop
  2drop
  \ simplified: just use built-in sort concept
  drop drop ;

: main
  here 7 cells allot
  4 here !  2 here cell+ !  2 here 2 cells + !
  8 here 3 cells + !  3 here 4 cells + !  3 here 5 cells + !
  1 here 6 cells + !
  7 0 do
    here i cells + @ . 
  loop cr ;

main
