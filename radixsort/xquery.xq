xquery version "3.1";

declare function local:get-digit($x as xs:integer, $exp as xs:integer) as xs:integer {
    ($x idiv $exp) mod 10
};

declare function local:counting-sort($arr as xs:integer*, $exp as xs:integer) as xs:integer* {
    for $d in (0 to 9)
    for $x in $arr
    where local:get-digit($x, $exp) = $d
    return $x
};

declare function local:radix-sort($arr as xs:integer*) as xs:integer* {
    if (empty($arr)) then $arr
    else
        let $max-val := max($arr)
        let $result := local:radix-loop($arr, $max-val, 1)
        return $result
};

declare function local:radix-loop($arr as xs:integer*, $max-val as xs:integer, $exp as xs:integer) as xs:integer* {
    if ($max-val idiv $exp = 0) then $arr
    else local:radix-loop(local:counting-sort($arr, $exp), $max-val, $exp * 10)
};

local:radix-sort((170, 45, 75, 90, 802, 24, 2, 66))
