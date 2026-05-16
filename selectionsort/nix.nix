let
  removeFirst = x: lst:
    if lst == [] then []
    else if builtins.head lst == x then builtins.tail lst
    else [(builtins.head lst)] ++ removeFirst x (builtins.tail lst);
  
  listMin = lst:
    builtins.foldl' (a: b: if b < a then b else a) (builtins.head lst) lst;

  selectionSort = lst:
    if lst == [] then []
    else
      let m = listMin lst;
      in [m] ++ selectionSort (removeFirst m lst);
in
  selectionSort [5 3 1 4 2]
