xquery version "3.1";

declare function local:count-smaller($seq as xs:integer*, $item as xs:integer) as xs:integer {
  count($seq[. < $item])
};

declare function local:cycle-sort($seq as xs:integer*) as xs:integer* {
  let $n := count($seq)
  let $arr := array { $seq }
  return local:cycle-pass($arr, 1, $n)
};

declare function local:cycle-pass($arr as array(*), $start as xs:integer, $n as xs:integer) as xs:integer* {
  if ($start >= $n)
  then array:flatten($arr)
  else
    let $item := $arr($start)
    let $pos := $start + local:count-smaller(
      for $i in ($start + 1 to $n) return $arr($i), $item)
    let $arr2 := if ($pos = $start) then $arr
                 else array:put(array:put($arr, $pos, $item), $start, $arr($pos))
    return local:cycle-pass($arr2, $start + 1, $n)
};

local:cycle-sort((5, 4, 3, 2, 1))
