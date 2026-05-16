: bounds ( arr n -- min max )
  2dup 0 do
    over i 4 * + @
    dup 3 pick < if nip else drop then
    over i 4 * + @
    dup 3 pick > if nip else drop then
  loop ;

: counting-sort ( arr n -- )
  2dup bounds ( arr n min max )
  over - 1+ ( arr n min range )
  here over cells allot ( arr n min range count )
  over 0 fill ( arr n min range count -- zero count )
  4 pick 4 pick 0 do
    6 pick i 4 * + @
    5 pick - ( arr n min range count idx )
    cells 2 pick + 1 swap +! ( arr n min range count )
  loop
  2 pick 1 do
    i cells 2 pick + dup @
    i 1- cells 3 pick + @ + swap !
  loop
  here 3 pick cells allot
  3 pick 1- begin dup 0 >= while
    dup 6 pick swap 4 * + @
    dup 5 pick - cells 2 pick + dup @
    1- dup rot ! cells 2 pick + !
  1- repeat drop
  ;

create data 4 , 2 , 2 , 8 , 3 , 3 , 1 ,
data 7 counting-sort
