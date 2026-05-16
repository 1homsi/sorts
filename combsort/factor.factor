USING: arrays kernel math sequences ;
IN: comb-sort

: new-gap ( gap -- gap' )
    10 * 13 / 1 max ;

: comb-pass ( seq gap -- seq changed? )
    [ dup length ] dip
    [ 2dup + < ] 2array swap
    [ over ] dip
    f swap
    [ 2dup nth swap
      [ over nth ] dip
      > [ 2dup [ nth ] [ swap nth ] bi-curry bi swap
          swap exchange drop t
        ] [ drop ] if
      1 +
    ] loop
    drop ;

: comb-sort ( seq -- seq )
    dup length
    [ dup 1 > ] [
        new-gap over over comb-pass [ drop ] dip
    ] while
    drop ;
