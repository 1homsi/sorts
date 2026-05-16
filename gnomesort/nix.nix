let
  gnomeSort = arr:
    let
      n = builtins.length arr;
      loop = a: i:
        if i >= n then a
        else if i == 0 || builtins.elemAt a i >= builtins.elemAt a (i - 1)
        then loop a (i + 1)
        else
          let
            x = builtins.elemAt a i;
            y = builtins.elemAt a (i - 1);
            a' = builtins.genList (j:
              if j == i then y
              else if j == i - 1 then x
              else builtins.elemAt a j) n;
          in loop a' (i - 1);
    in loop arr 0;
in gnomeSort [5 3 8 1 9 2 7 4 6 0]
