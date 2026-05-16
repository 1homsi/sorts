USING: arrays kernel math sequences io ;
IN: pancake-sort

: flip ( arr k -- arr )
    [ 1 + ] keep
    [ head reverse ] [ swap tail ] 2bi
    append ;

: find-max-idx ( arr size -- idx )
    head
    dup supremum
    [ index ] curry swap call ;

: pancake-sort ( arr -- sorted )
    dup length :> n
    n [1,b] reverse [
        :> size
        dup size find-max-idx :> max-idx
        max-idx size 1 - = [
            drop
        ] [
            max-idx 0 = [
                dup max-idx flip
            ] unless
            size 1 - flip
        ] if
    ] each ;

{ 3 6 2 7 4 1 5 } pancake-sort .
