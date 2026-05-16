declare function local:cocktail-sort($seq as xs:integer*) as xs:integer* {
  let $arr := array:join(for $x in $seq return [$x])
  let $n := array:size($arr)
  return local:sort-loop($arr, true(), 1, $n)
};

declare function local:sort-loop($arr, $swapped, $start, $end) {
  if (not($swapped)) then array:flatten($arr)
  else
    let $fwd := local:forward($arr, $start, $end, false())
    let $arr1 := $fwd[1]
    let $sw1 := $fwd[2]
    return if (not($sw1)) then array:flatten($arr1)
    else
      let $bwd := local:backward($arr1, $start, $end - 1, false())
      let $arr2 := $bwd[1]
      let $sw2 := $bwd[2]
      return local:sort-loop($arr2, $sw2, $start + 1, $end - 1)
};

declare function local:forward($arr, $i, $end, $sw) {
  if ($i >= $end) then ($arr, $sw)
  else
    let $a := array:get($arr, $i)
    let $b := array:get($arr, $i + 1)
    return if ($a > $b)
    then local:forward(array:put(array:put($arr, $i, $b), $i+1, $a), $i+1, $end, true())
    else local:forward($arr, $i+1, $end, $sw)
};

declare function local:backward($arr, $start, $i, $sw) {
  if ($i < $start) then ($arr, $sw)
  else
    let $a := array:get($arr, $i)
    let $b := array:get($arr, $i + 1)
    return if ($a > $b)
    then local:backward(array:put(array:put($arr, $i, $b), $i+1, $a), $start, $i-1, true())
    else local:backward($arr, $start, $i-1, $sw)
};

local:cocktail-sort((5, 3, 8, 1, 9, 2, 7, 4, 6, 0))
