USING: arrays kernel math sequences ;
IN: selection-sort

: find-min-idx ( seq i -- j )
    [ length ] [ 1 + ] bi* swap
    [ 2dup swap nth swap nth < ] keep swap
    [ nip ] [ drop ] if ;

: selection-sort ( seq -- sorted )
    clone dup length 1 - iota [
        over [ over nth < ] find-index drop
        over [ swap-elements ] [ 2drop ] if*
    ] each ;
