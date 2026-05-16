declare function local:merge($left as xs:integer*, $right as xs:integer*) as xs:integer* {
    if (empty($left)) then $right
    else if (empty($right)) then $left
    else if ($left[1] <= $right[1]) then ($left[1], local:merge(subsequence($left, 2), $right))
    else ($right[1], local:merge($left, subsequence($right, 2)))
};

declare function local:merge-sort($seq as xs:integer*) as xs:integer* {
    let $n := count($seq)
    return
        if ($n <= 1) then $seq
        else
            let $mid := $n idiv 2
            let $left := local:merge-sort(subsequence($seq, 1, $mid))
            let $right := local:merge-sort(subsequence($seq, $mid + 1))
            return local:merge($left, $right)
};

let $arr := (38, 27, 43, 3, 9, 82, 10)
return local:merge-sort($arr)
