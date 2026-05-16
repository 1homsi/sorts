USING: arrays io kernel math prettyprint sequences ;
IN: stooge-sort

: swap-if-needed ( arr first last -- arr )
    [ 2dup [ swap nth ] bi@ > ]
    [ [ swap ] 2dip exchange ]
    if ;

: stooge-sort ( arr first last -- arr )
    2dup - 1 + :> n
    swap-if-needed
    n 2 > [
        n 2 * 3 / truncate :> t
        over :> first
        dup :> last
        2dup drop first + t + 1 - stooge-sort
        first last t - 1 + last stooge-sort
        first last t + 1 - stooge-sort
    ] when ;

{ 3 1 4 1 5 9 2 6 } >array
dup 0 over length 1 - stooge-sort
. nl
