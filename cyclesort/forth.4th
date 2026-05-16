: arr 5 4 3 2 1 ;

variable n  5 n !
create a 5 , 4 , 3 , 2 , 1 ,

: a@ ( i -- val ) cells a + @ ;
: a! ( val i -- ) cells a + ! ;

: count-smaller ( cycle-start item -- pos )
  over 1+ swap 0 n @ 1- rot
  do
    i a@ over <
    if rot 1+ rot rot
    then
  loop
  drop nip ;

: skip-dups ( pos item -- pos )
  begin
    over a@ over =
  while
    swap 1+ swap
  repeat
  drop ;

: cycle-sort
  n @ 1- 0
  do
    i a@ i
    i 1+ n @ 1-
    do
      j a@ over <
      if swap 1+ swap
      then
    loop
    over i =
    if drop
    else
      begin over a@ over = while swap 1+ swap repeat
      drop
      dup a@ over i
      2dup a@ swap a!
      swap a!
      begin dup i <> while
        drop i
        i 1+ n @ 1-
        do
          j a@ over <
          if 1+
          then
        loop
        begin dup a@ over = while 1+ repeat
        dup a@ over i
        2dup a@ swap a!
        swap a!
      repeat
      2drop
    then
  loop ;

cycle-sort
5 0 do i a@ . loop cr
