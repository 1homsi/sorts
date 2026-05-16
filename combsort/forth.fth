variable gap
variable sorted-flag

: new-gap ( gap -- new-gap )
    10 * 13 / dup 1 < if drop 1 then ;

: swap-cells ( addr1 addr2 -- )
    2dup @ swap @ rot ! swap ! ;

: comb-pass ( addr n gap -- changed )
    0 >r
    0 rot rot rot ( changed addr n gap )
    2dup + swap ( changed addr gap n+gap n )
    drop
    0 ( changed addr n gap i )
    begin
        dup 2 pick 2 pick - <
    while
        dup 3 pick + cells 4 pick +
        dup @ ( changed addr n gap i addr[i+gap] val[i+gap] )
        3 pick cells 5 pick + @
        over >
        if
            3 pick cells 6 pick + ( addr[i] )
            2dup !
            swap !
            r> drop 1 >r
        else
            2drop
        then
        1+
    repeat
    drop drop drop drop
    r> ;

: comb-sort ( addr n -- )
    dup gap !
    begin
        gap @ new-gap gap !
        gap @ 1 = if 1 else 0 then sorted-flag !
        2dup gap @ comb-pass
        0= sorted-flag @ and
    until
    2drop ;
