USING: arrays kernel math math.order sequences io prettyprint ;
IN: shell-sort

: shell-sort ( seq -- sorted )
    clone
    dup length 2 / :> n!
    [ n 0 > ] [
        n over length [
            [ n ] dip [
                2dup swap nth :> temp
                :> i! i
                [ dup n >= [ dup n - pick nth temp > ] [ f ] if ] [
                    2dup n - pick nth pick rot set-nth
                    n -
                ] while
                temp pick rot set-nth
            ] with each
        ] with-range
        n 2 / n!
    ] while ;

{ 64 34 25 12 22 11 90 } shell-sort .
