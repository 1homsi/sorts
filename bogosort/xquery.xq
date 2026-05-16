declare function local:is-sorted($arr as xs:integer*) as xs:boolean {
  every $i in 1 to count($arr) - 1 satisfies $arr[$i] le $arr[$i + 1]
};

declare function local:shuffle($arr as xs:integer*) as xs:integer* {
  for $x in $arr
  order by random()
  return $x
};

declare function local:bogosort($arr as xs:integer*) as xs:integer* {
  if (local:is-sorted($arr)) then $arr
  else local:bogosort(local:shuffle($arr))
};

let $arr := (3, 1, 4, 1, 5, 9, 2, 6)
return local:bogosort($arr)
