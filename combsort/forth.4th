variable gap
variable sorted
variable n-val

: comb-sort ( addr n -- )
  dup n-val !
  gap !
  drop
  false sorted !
  begin
    sorted @ not
  while
    gap @ 13 10 */ gap !
    gap @ 1 < if 1 gap ! then
    gap @ 1 = if true sorted ! then
    0
    begin
      dup gap @ + n-val @ <
    while
      dup cells over gap @ + cells
      2dup @ swap @
      over over >
      if
        rot rot
        2dup @ rot rot @ swap !
        rot rot @ swap !
        false sorted !
      else
        2drop 2drop
      then
      1+
    repeat
    drop
  repeat ;
