xquery version "3.1";

declare function local:insert-val($x as xs:integer, $lst as xs:integer*) as xs:integer* {
  if (empty($lst)) then ($x)
  else if ($x le $lst[1]) then ($x, $lst)
  else ($lst[1], local:insert-val($x, tail($lst)))
};

declare function local:insertion-sort($lst as xs:integer*) as xs:integer* {
  if (empty($lst)) then ()
  else local:insert-val(head($lst), local:insertion-sort(tail($lst)))
};

declare function local:merge-runs($xs as xs:integer*, $ys as xs:integer*) as xs:integer* {
  if (empty($xs)) then $ys
  else if (empty($ys)) then $xs
  else if ($xs[1] le $ys[1])
    then ($xs[1], local:merge-runs(tail($xs), $ys))
  else ($ys[1], local:merge-runs($xs, tail($ys)))
};

declare function local:chunks-of($n as xs:integer, $lst as xs:integer*) as xs:integer** {
  if (empty($lst)) then ()
  else (subsequence($lst, 1, $n), local:chunks-of($n, subsequence($lst, $n + 1)))
};

declare function local:merge-pairs($runs as xs:integer**) as xs:integer** {
  let $cnt := count($runs) return
  if ($cnt = 0) then ()
  else if ($cnt = 1) then $runs
  else (local:merge-runs($runs[1], $runs[2]), local:merge-pairs(subsequence($runs, 3)))
};

declare function local:merge-all($runs as xs:integer**) as xs:integer* {
  if (count($runs) = 1) then $runs[1]
  else local:merge-all(local:merge-pairs($runs))
};

declare function local:timsort($lst as xs:integer*) as xs:integer* {
  if (empty($lst)) then ()
  else
    let $chunks := local:chunks-of(32, $lst)
    let $sorted := for $c in $chunks return local:insertion-sort($c)
    return local:merge-all($sorted)
};

local:timsort((5,2,8,1,9,3,7,4,6))
