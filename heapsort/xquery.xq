xquery version "3.1";

declare function local:heapify($arr as xs:integer*, $n as xs:integer, $i as xs:integer) as xs:integer* {
    let $left := 2 * $i + 1
    let $right := 2 * $i + 2
    let $largest0 := if ($left < $n and $arr[$left + 1] > $arr[$i + 1]) then $left else $i
    let $largest := if ($right < $n and $arr[$right + 1] > $arr[$largest0 + 1]) then $right else $largest0
    return
        if ($largest != $i) then
            let $vi := $arr[$i + 1]
            let $vl := $arr[$largest + 1]
            let $arr2 := for $k in 1 to count($arr)
                         return if ($k = $i + 1) then $vl
                                else if ($k = $largest + 1) then $vi
                                else $arr[$k]
            return local:heapify($arr2, $n, $largest)
        else $arr
};

declare function local:heapsort($arr as xs:integer*) as xs:integer* {
    let $n := count($arr)
    let $heap := fold-left(
        reverse(0 to ($n idiv 2 - 1)),
        $arr,
        function($a, $i) { local:heapify($a, $n, $i) }
    )
    return fold-left(
        reverse(1 to ($n - 1)),
        $heap,
        function($a, $i) {
            let $v0 := $a[1], $vi := $a[$i + 1]
            let $a2 := for $k in 1 to count($a)
                       return if ($k = 1) then $vi else if ($k = $i + 1) then $v0 else $a[$k]
            return local:heapify($a2, $i, 0)
        }
    )
};

local:heapsort((12, 11, 13, 5, 6, 7))
