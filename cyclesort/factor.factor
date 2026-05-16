USING: arrays kernel math sequences io ;
IN: cycle-sort

: count-smaller ( arr item start -- n )
    [ length ] [ ] [ ] tri*
    swap [ 2dup nth < [ 1 + ] when ] each-index
    2drop ;

: cycle-sort ( arr -- arr )
    dup length :> n
    dup :> arr
    n 1 - iota [| cycle-start |
        cycle-start arr nth :> item
        cycle-start :> pos!
        n cycle-start 1 + [a,b) [| i |
            i arr nth item < [ pos 1 + pos! ] when
        ] each
        pos cycle-start = [
            [ item pos arr nth = ] [ pos 1 + pos! ] while
            pos arr nth :> tmp
            item pos arr set-nth
            tmp :> item!
            [ pos cycle-start = not ] [
                cycle-start pos!
                n cycle-start 1 + [a,b) [| i |
                    i arr nth item < [ pos 1 + pos! ] when
                ] each
                [ item pos arr nth = ] [ pos 1 + pos! ] while
                pos arr nth :> t
                item pos arr set-nth
                t item!
            ] while
        ] unless
    ] each
    arr ;

{ 5 4 3 2 1 } >array cycle-sort .
