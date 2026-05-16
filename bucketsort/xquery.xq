declare function local:insert-sorted($x as xs:double, $lst as xs:double*) as xs:double* {
    if (empty($lst)) then ($x)
    else if ($x <= $lst[1]) then ($x, $lst)
    else ($lst[1], local:insert-sorted($x, subsequence($lst, 2)))
};

declare function local:insertion-sort($lst as xs:double*) as xs:double* {
    if (empty($lst)) then ()
    else local:insert-sorted($lst[1], local:insertion-sort(subsequence($lst, 2)))
};

declare function local:get-idx($num as xs:double, $mn as xs:double, $mx as xs:double, $n as xs:integer) as xs:integer {
    min(($n - 1, xs:integer(floor(($num - $mn) div ($mx - $mn + 1) * $n))))
};

declare function local:bucket-sort($arr as xs:double*) as xs:double* {
    let $n := count($arr)
    return if ($n eq 0) then $arr
    else
        let $mn := min($arr)
        let $mx := max($arr)
        let $buckets := for $i in 0 to ($n - 1)
                        return <bucket idx="{$i}">{
                            for $x in $arr
                            where local:get-idx($x, $mn, $mx, $n) eq $i
                            return <v>{$x}</v>
                        }</bucket>
        return for $b in $buckets
               return local:insertion-sort($b/v/xs:double(.))
};

let $data := (0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68)
return local:bucket-sort($data)
