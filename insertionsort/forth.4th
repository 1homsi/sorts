: insert-sorted ( addr n key -- )
  2dup 0 do
    over i cells + @ 3 pick > if
      over i cells + @ over i 1+ cells + !
    else
      leave
    then
  loop
  drop cells + ! ;

: insertion-sort ( addr n -- )
  1 do
    dup i cells + @
    over i insert-sorted
  loop
  drop ;
