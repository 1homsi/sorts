USING: arrays kernel math math.order sequences io ;
IN: bitonic-sort

: compare-and-swap ( arr i j dir -- arr )
    [ 2dup [ swap nth ] [ nth ] 2bi ] dip
    swap [ > ] dip =
    [ swap [ set-nth ] 2keep set-nth ]
    [ 2drop ] if ;

: bitonic-merge ( arr lo cnt dir -- arr )
    dup 1 > [
        [ 2 /i ] keep
        4dup drop >r 2dup r>
        [ dup ] [ + ] bi*
        range [ compare-and-swap ] each
        2dup [ + ] [ /i ] bi*
        bitonic-merge bitonic-merge
    ] [ 3drop ] if ;

: bitonic-sort ( arr lo cnt dir -- arr )
    dup 1 > [
        [ 2 /i ] keep
        4dup drop >r 2dup r>
        2dup drop [ + ] [ /i ] bi* t bitonic-sort
        4dup drop [ + ] [ /i ] bi* f bitonic-sort
        bitonic-merge
    ] [ 3drop ] if ;

{ 3 7 4 8 6 2 1 5 } >array 0 8 t bitonic-sort .
