xquery version "3.1";

declare function local:flip($arr as xs:integer*, $k as xs:integer) as xs:integer* {
  let $front := reverse(subsequence($arr, 1, $k + 1))
  let $back := subsequence($arr, $k + 2)
  return ($front, $back)
};

declare function local:find-max-idx($arr as xs:integer*, $size as xs:integer) as xs:integer {
  let $sub := subsequence($arr, 1, $size)
  let $max := max($sub)
  return index-of($sub, $max)[1] - 1
};

declare function local:sort($arr as xs:integer*, $size as xs:integer) as xs:integer* {
  if ($size le 1) then $arr
  else
    let $mi := local:find-max-idx($arr, $size)
    let $arr1 := if ($mi ne 0) then local:flip($arr, $mi) else $arr
    let $arr2 := local:flip($arr1, $size - 1)
    return local:sort($arr2, $size - 1)
};

let $arr := (3, 6, 2, 7, 4, 1, 5)
return local:sort($arr, count($arr))
