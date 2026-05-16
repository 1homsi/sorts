xquery version "3.1";

declare function local:compare-and-swap($arr as xs:integer*, $i as xs:integer, $j as xs:integer, $dir as xs:boolean) as xs:integer* {
  let $ai := $arr[$i]
  let $aj := $arr[$j]
  return
    if ($dir eq ($ai gt $aj))
    then (
      for $idx in 1 to count($arr)
      return if ($idx eq $i) then $aj
             else if ($idx eq $j) then $ai
             else $arr[$idx]
    )
    else $arr
};

declare function local:bitonic-merge($arr as xs:integer*, $lo as xs:integer, $cnt as xs:integer, $dir as xs:boolean) as xs:integer* {
  if ($cnt le 1) then $arr
  else
    let $k := $cnt idiv 2
    let $arr2 := fold-left($lo to ($lo + $k - 1), $arr, function($a, $i) {
      local:compare-and-swap($a, $i, $i + $k, $dir)
    })
    let $arr3 := local:bitonic-merge($arr2, $lo, $k, $dir)
    return local:bitonic-merge($arr3, $lo + $k, $k, $dir)
};

declare function local:bitonic-sort($arr as xs:integer*, $lo as xs:integer, $cnt as xs:integer, $dir as xs:boolean) as xs:integer* {
  if ($cnt le 1) then $arr
  else
    let $k := $cnt idiv 2
    let $arr2 := local:bitonic-sort($arr, $lo, $k, true())
    let $arr3 := local:bitonic-sort($arr2, $lo + $k, $k, false())
    return local:bitonic-merge($arr3, $lo, $cnt, $dir)
};

let $data := (3, 7, 4, 8, 6, 2, 1, 5)
return local:bitonic-sort($data, 1, count($data), true())
