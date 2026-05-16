USING: arrays kernel math sequences io ;
IN: timsort

: insert-val ( x seq -- seq )
    dup empty? [
        drop 1array
    ] [
        2dup first >= [
            [ prepend ] keep drop
        ] [
            unclip [ insert-val ] dip prefix
        ] if
    ] if ;

: insertion-sort ( seq -- sorted )
    dup empty? [ ] [
        unclip [ insertion-sort ] dip insert-val
    ] if ;

: merge-runs ( xs ys -- merged )
    2dup [ empty? ] bi@ or [
        drop
    ] [
        2dup [ first ] bi@ <= [
            [ unclip ] dip [ merge-runs ] dip prefix
        ] [
            swap [ unclip ] dip [ swap merge-runs ] dip prefix
        ] if
    ] if ;

: chunks-of ( n seq -- chunks )
    dup empty? [
        2drop { }
    ] [
        2dup length min cut-slice
        [ chunks-of ] dip prefix
    ] if ;

: merge-pairs ( chunks -- merged )
    dup length 1 <= [
    ] [
        2 cut-slice first2 merge-runs
        [ merge-pairs ] dip prefix
    ] if ;

: merge-all ( chunks -- sorted )
    dup length 1 = [
        first
    ] [
        merge-pairs merge-all
    ] if ;

: timsort ( seq -- sorted )
    dup empty? [
    ] [
        32 swap chunks-of
        [ insertion-sort ] map
        merge-all
    ] if ;

{ 5 2 8 1 9 3 7 4 6 } timsort .
