create a 5 , 4 , 3 , 2 , 1 ,
variable n  5 n !

: a@ ( i -- val ) cells a + @ ;
: a! ( val i -- ) cells a + ! ;

: cycle-sort ( -- )
  n @ 1- 0 do
    i a@ ( item )
    i    ( item cycleStart )
    i 1+ n @ do
      i a@ ( item cycleStart pos testval )
      2over drop ( item cycleStart pos testval item )
      < if rot 1+ -rot then
    loop
    ( item cycleStart pos )
    2dup = if 2drop drop else
      begin 2dup a@ 2 pick = while rot 1+ -rot repeat
      ( item cycleStart pos )
      dup a@  ( item cycleStart pos oldval )
      >r       ( item cycleStart pos ) ( R: oldval )
      2dup a!  ( item cycleStart pos )
      r>       ( item cycleStart pos newitem )
      -rot rot ( newitem cycleStart pos )
      begin
        2dup = if 2drop drop leave then
        swap ( newitem pos cycleStart )
        dup  ( newitem pos cycleStart cycleStart )
        >r   ( newitem pos cycleStart ) ( R: cycleStart )
        drop ( newitem cycleStart )
        r>   ( newitem cycleStart cycleStart )
        rot  ( cycleStart cycleStart newitem )
        -rot ( newitem cycleStart cycleStart )
        swap ( newitem cycleStart ... ) \ simplified
        2drop 2drop leave
      again
    then
  loop ;

cycle-sort
5 0 do i a@ . loop cr
