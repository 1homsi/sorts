USING: kernel sequences math arrays io ;
IN: radix-sort

: get-digit ( x exp -- d ) swap / floor 10 mod ;

: counting-sort ( seq exp -- seq' )
    [ swap get-digit ] curry
    10 iota [
        [ pick swap [ = ] curry filter ] dip drop
    ] with map concat ;

: radix-sort ( seq -- seq' )
    dup empty? [ ] [
        dup [ max ] reduce
        1 [ 2dup swap / floor 0 > ] [
            [ counting-sort ] [ 10 * ] bi*
        ] while drop
    ] if ;

{ 170 45 75 90 802 24 2 66 } radix-sort .
