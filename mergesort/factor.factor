USING: kernel sequences math locals ;
IN: mergesort

:: merge ( left right -- result )
    left right [ drop ] [ drop ] [
        left first right first <=
        [ left first left rest right merge prefix ]
        [ right first left right rest merge prefix ]
        if
    ] if-empty if-empty ;

:: merge-sort ( seq -- sorted )
    seq length 1 <= [ seq ] [
        seq length 2 / floor :> mid
        seq mid head merge-sort
        seq mid tail merge-sort
        merge
    ] if ;

{ 38 27 43 3 9 82 10 } merge-sort .
