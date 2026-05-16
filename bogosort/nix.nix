let
  isSorted = arr:
    let n = builtins.length arr;
    in builtins.all (i: builtins.elemAt arr i <= builtins.elemAt arr (i + 1))
       (builtins.genList (i: i) (n - 1));

  bogosort = arr:
    if isSorted arr then arr
    else bogosort (builtins.sort (a: b: a <= b) arr);

in bogosort [3 1 4 1 5 9 2 6]
