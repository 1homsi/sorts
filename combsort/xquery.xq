declare function local:new-gap($gap as xs:integer) as xs:integer {
  let $g := xs:integer(xs:double($gap) div 1.3)
  return if ($g lt 1) then 1 else $g
};

declare function local:pass($arr as xs:integer*, $gap as xs:integer, $i as xs:integer, $n as xs:integer, $changed as xs:boolean) as (xs:integer*, xs:boolean) {
  if ($i + $gap ge $n) then ($arr, $changed)
  else
    let $a := $arr[$i + 1]
    let $b := $arr[$i + $gap + 1]
    return
      if ($a gt $b) then
        let $arr2 := (subsequence($arr, 1, $i), $b, subsequence($arr, $i + 2, $gap - 1), $a, subsequence($arr, $i + $gap + 2))
        return local:pass($arr2, $gap, $i + 1, $n, true())
      else
        local:pass($arr, $gap, $i + 1, $n, $changed)
};

declare function local:comb-sort($arr as xs:integer*) as xs:integer* {
  let $n := count($arr)
  let $result := local:sort-loop($arr, $n, $n)
  return $result
};

declare function local:sort-loop($arr as xs:integer*, $n as xs:integer, $gap as xs:integer) as xs:integer* {
  let $g := local:new-gap($gap)
  let $r := local:pass($arr, $g, 0, $n, false())
  let $arr2 := $r[1]
  let $changed := $r[2]
  return
    if ($g eq 1 and not($changed)) then $arr2
    else local:sort-loop($arr2, $n, $g)
};
