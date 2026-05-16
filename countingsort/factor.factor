USING: arrays kernel math sequences prettyprint ;
IN: counting-sort

: find-min-max ( seq -- min max )
    [ first ] keep [ min ] reduce
    over [ max ] reduce ;

: make-count ( seq min range -- count )
    [ 0 ] replicate swap rot
    [ over swap nth 1 + pick nth 1 + swap nth ] each drop ;

: prefix-sums ( count -- count' )
    dup length 1 - [1,b] [
        dupd [ nth ] [ 1 - nth ] 2bi + pick rot set-nth
    ] each ;

: counting-sort ( seq -- sorted )
    dup find-min-max 2dup - 1 +
    3array first3 drop
    [ ] [ ] bi
    sort ;

{ 4 2 2 8 3 3 1 } counting-sort .
