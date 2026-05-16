declare function local:stooge-sort($arr as xs:integer*, $first as xs:integer, $last as xs:integer) as xs:integer* {
    let $a := $arr[$first]
    let $b := $arr[$last]
    let $arr1 := if ($a gt $b) then
        (subsequence($arr, 1, $first - 1), $b, subsequence($arr, $first + 1, $last - $first - 1), $a, subsequence($arr, $last + 1))
    else $arr
    let $n := $last - $first + 1
    return if ($n gt 2) then
        let $t := xs:integer(floor($n * 2 div 3))
        let $arr2 := local:stooge-sort($arr1, $first, $first + $t - 1)
        let $arr3 := local:stooge-sort($arr2, $last - $t + 1, $last)
        return local:stooge-sort($arr3, $first, $first + $t - 1)
    else $arr1
};

let $arr := (3, 1, 4, 1, 5, 9, 2, 6)
return local:stooge-sort($arr, 1, count($arr))
