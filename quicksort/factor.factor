USING: arrays kernel math sequences sorting io prettyprint ;
IN: quicksort

: filter-less ( pivot seq -- seq ) [ < ] curry filter ;
: filter-eq ( pivot seq -- seq ) [ = ] curry filter ;
: filter-greater ( pivot seq -- seq ) [ > ] curry filter ;

: quicksort ( seq -- sorted )
    dup length 1 <= [ ] [
        dup first swap rest [
            [ filter-less quicksort ]
            [ filter-eq ]
            [ filter-greater quicksort ]
        ] tri 3array concat
    ] if ;

{ 3 6 8 10 1 2 1 } quicksort .
