let
  insert = x: lst:
    if lst == [] then [x]
    else
      let h = builtins.head lst;
          t = builtins.tail lst;
      in if x <= h then [x] ++ [h] ++ t
         else [h] ++ (insert x t);

  insertionSort = lst:
    if lst == [] then []
    else
      let h = builtins.head lst;
          t = builtins.tail lst;
      in insert h (insertionSort t);
in insertionSort
