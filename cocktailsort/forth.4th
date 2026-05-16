variable swapped
variable start-idx
variable end-idx

: swap-cells ( addr1 addr2 -- )
    over @ over @ swap rot ! swap ! ;

: forward-pass ( arr -- )
    start-idx @ end-idx @ 1- do
        dup i cells + dup i 1+ cells + rot
        over @ over @ > if
            swap-cells 1 swapped !
        else 2drop then
    loop drop ;

: backward-pass ( arr -- )
    end-idx @ 1- start-idx @ do
        dup i cells + dup i 1+ cells + rot
        over @ over @ > if
            swap-cells 1 swapped !
        else 2drop then
    -1 +loop drop ;

: cocktail-sort ( arr n -- )
    end-idx ! 0 start-idx !
    begin
        0 swapped !
        dup forward-pass
        swapped @ 0= if drop exit then
        0 swapped !
        end-idx @ 1- end-idx !
        dup backward-pass
        start-idx @ 1+ start-idx !
        swapped @ 0=
    until drop ;
