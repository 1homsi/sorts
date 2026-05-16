USING: arrays kernel math prettyprint sequences ;
IN: heapsort

: heapify ( arr n i -- arr )
    [ drop ] keep
    [ 2 * 1 + ] keep  ! left
    [ 2 * 2 + ] keep  ! right
    [ drop ] keep
    3dup [ swap nth ] [ swap nth ] bi > [ nip ] [ 2drop ] if
    drop ;

: heapsort ( arr -- arr )
    dup length
    [ 2dup 2/ 1 - [ heapify ] each-integer-from ]
    [ 1 - [ 2dup swap [ nth ] [ nth ] 2bi ] each-integer ] bi ;

{ 12 11 13 5 6 7 } heapsort .
