: insertion-sort ( addr n -- )
  1 do
    i cells over + @
    i 1- begin
      dup 0>=
    while
      2dup cells 2 pick + @ > if
        2dup cells 2 pick + @
        2 pick i 1+ cells + 2 pick + !
        1-
      else
        drop drop drop leave
      then
    repeat
    drop
    1+ cells over + !
  loop
  drop ;
