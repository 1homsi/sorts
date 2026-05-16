declare function local:gnome-sort($arr as xs:integer*) as xs:integer* {
    let $n := count($arr)
    return local:gnome-loop($arr, 1, $n)
};

declare function local:gnome-loop($arr as xs:integer*, $i as xs:integer, $n as xs:integer) as xs:integer* {
    if ($i > $n) then $arr
    else if ($i eq 1 or $arr[$i] ge $arr[$i - 1]) then
        local:gnome-loop($arr, $i + 1, $n)
    else
        let $swapped := (
            subsequence($arr, 1, $i - 2),
            $arr[$i],
            $arr[$i - 1],
            subsequence($arr, $i + 1)
        )
        return local:gnome-loop($swapped, $i - 1, $n)
};

local:gnome-sort((5, 3, 8, 1, 9, 2, 7, 4, 6, 0))
