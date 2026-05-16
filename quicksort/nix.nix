let
  quicksort = lst:
    if builtins.length lst <= 1
    then lst
    else
      let
        pivot = builtins.elemAt lst (builtins.div (builtins.length lst) 2);
        left = builtins.filter (x: x < pivot) lst;
        middle = builtins.filter (x: x == pivot) lst;
        right = builtins.filter (x: x > pivot) lst;
      in
        (quicksort left) ++ middle ++ (quicksort right);
in
  quicksort [3 6 8 10 1 2 1]
