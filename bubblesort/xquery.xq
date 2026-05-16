xquery version "3.1";

declare function local:bubble-pass($arr as xs:integer*, $n as xs:integer) as (xs:integer*, xs:boolean) {
  let $result :=
    fold-left(1 to $n - 1, ($arr, false()),
      function($acc, $i) {
        let $a := subsequence($acc, 1, $n)
        let $sw := $acc[$n + 1]
        let $xi := $a[$i]
        let $xi1 := $a[$i + 1]
        return
          if ($xi > $xi1)
          then (
            (for $j in 1 to $n return if ($j = $i) then $xi1 else if ($j = $i+1) then $xi else $a[$j]),
            true()
          )
          else ($a, $sw)
      })
  return $result
};

let $arr := (64, 34, 25, 12, 22, 11, 90)
return string-join(for $x in $arr order by $x return string($x), " ")
