declare function local:selection-sort($seq as xs:integer*) as xs:integer* {
  if (empty($seq)) then ()
  else
    let $min := min($seq)
    let $rest := local:remove-first($seq, $min)
    return ($min, local:selection-sort($rest))
};

declare function local:remove-first($seq as xs:integer*, $x as xs:integer) as xs:integer* {
  if (empty($seq)) then ()
  else if (head($seq) eq $x) then tail($seq)
  else (head($seq), local:remove-first(tail($seq), $x))
};

local:selection-sort((5, 3, 1, 4, 2))
