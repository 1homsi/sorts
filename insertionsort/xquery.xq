declare function local:insert($x as xs:integer, $lst as xs:integer*) as xs:integer* {
  if (empty($lst)) then $x
  else if ($x le head($lst)) then ($x, $lst)
  else (head($lst), local:insert($x, tail($lst)))
};

declare function local:insertion-sort($lst as xs:integer*) as xs:integer* {
  if (empty($lst)) then ()
  else local:insert(head($lst), local:insertion-sort(tail($lst)))
};
