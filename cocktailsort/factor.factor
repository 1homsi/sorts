USING: arrays kernel math sequences ;
IN: cocktail-sort

: swap-at ( seq i j -- seq )
    [ [ nth ] [ nth ] 3bi ]
    [ [ set-nth ] [ set-nth ] 3bi ] 3bi ;

: forward-pass ( seq start end -- seq swapped )
    [ drop f ] 2dip
    [ 2dup < ]
    [ [ over ] dip
      [ nth ] [ 1 + nth ] 3bi
      2dup >
      [ 4 npick swap 4 npick 1 + swap-at drop t ] [ 2drop ] if
      [ 1 + ] dip
    ] while
    2drop ;

: cocktail-sort ( seq -- seq )
    dup length 1 - :> end!
    0 :> start!
    t :> swapped!
    [ swapped ] [
        f swapped!
        dup start end forward-pass swapped!
        swapped [
            f swapped!
            end 1 - end!
        ] when
    ] while ;
