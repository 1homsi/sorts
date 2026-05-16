variable min-idx
variable tmp

: swap-elements ( addr i j -- )
  2dup cells + @ >r
  over cells + @
  rot cells + !
  r> swap cells + ! ;

: selection-sort ( addr n -- )
  1- 0 do
    i min-idx !
    i 1+ dup rot swap do
      dup cells + @ over min-idx @ cells + @ < if
        i min-idx !
      then
    loop drop
    over i min-idx @ swap-elements
  loop drop ;
