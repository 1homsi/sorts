declare function local:quicksort($seq as xs:integer*) as xs:integer* {
    if (count($seq) <= 1)
    then $seq
    else
        let $pivot := $seq[ceiling(count($seq) div 2)]
        let $left := $seq[. lt $pivot]
        let $middle := $seq[. eq $pivot]
        let $right := $seq[. gt $pivot]
        return (local:quicksort($left), $middle, local:quicksort($right))
};

local:quicksort((3, 6, 8, 10, 1, 2, 1))
