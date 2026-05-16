variable swapped
variable lo
variable hi

: swap-elements ( addr i -- )
    dup cells + swap
    over 1+ cells +
    over @ over @ swap
    rot ! swap ! ;

: forward-pass ( arr -- )
    lo @ hi @ 1- swap
    do
        dup i swap-elements
    loop drop ;

: backward-pass ( arr -- )
    hi @ 1- lo @ do
        dup i swap-elements
    -1 +loop drop ;

: cocktail-sort ( arr n -- )
    hi !
    0 lo !
    begin
        0 swapped !
        dup forward-pass
        swapped @ 0= if drop exit then
        0 swapped !
        hi @ 1- hi !
        dup backward-pass
        lo @ 1+ lo !
        swapped @ 0=
    until drop ;
