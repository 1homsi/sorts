xquery version "3.1";

declare function local:shell-sort($arr as xs:integer*) as xs:integer* {
  let $n := count($arr)
  let $a := array { $arr }
  return local:sort-with-gap($a, $n, $n idiv 2)
};

declare function local:sort-with-gap($a, $n, $gap) {
  if ($gap le 0) then array:flatten($a)
  else
    let $a2 := local:insertion-pass($a, $gap, $gap, $n)
    return local:sort-with-gap($a2, $n, $gap idiv 2)
};

declare function local:insertion-pass($a, $gap, $i, $n) {
  if ($i ge $n) then $a
  else
    let $temp := $a($i + 1)
    let $a2 := local:shift-back($a, $gap, $i, $temp)
    return local:insertion-pass($a2, $gap, $i + 1, $n)
};

declare function local:shift-back($a, $gap, $j, $temp) {
  if ($j lt $gap or $a($j - $gap + 1) le $temp) then array:put($a, $j + 1, $temp)
  else
    let $a2 := array:put($a, $j + 1, $a($j - $gap + 1))
    return local:shift-back($a2, $gap, $j - $gap, $temp)
};

local:shell-sort((64, 34, 25, 12, 22, 11, 90))
