let
  minRun = 32;

  insertVal = x: lst:
    if lst == [] then [x]
    else let h = builtins.head lst; t = builtins.tail lst;
    in if x <= h then [x h] ++ t
       else [h] ++ insertVal x t;

  insertionSort = lst:
    if lst == [] then []
    else insertVal (builtins.head lst) (insertionSort (builtins.tail lst));

  mergeRuns = xs: ys:
    if xs == [] then ys
    else if ys == [] then xs
    else let
      x = builtins.head xs; y = builtins.head ys;
    in if x <= y
       then [x] ++ mergeRuns (builtins.tail xs) ys
       else [y] ++ mergeRuns xs (builtins.tail ys);

  chunksOf = n: lst:
    if lst == [] then []
    else [(builtins.genList (i: builtins.elemAt lst i)
            (builtins.min n (builtins.length lst)))]
         ++ chunksOf n (builtins.genList
              (i: builtins.elemAt lst (n + i))
              (builtins.max 0 (builtins.length lst - n)));

  mergePairs = runs:
    let len = builtins.length runs;
    in if len == 0 then []
       else if len == 1 then runs
       else [mergeRuns (builtins.elemAt runs 0) (builtins.elemAt runs 1)]
            ++ mergePairs (builtins.genList
                 (i: builtins.elemAt runs (2 + i))
                 (builtins.max 0 (len - 2)));

  mergeAll = runs:
    if builtins.length runs == 1 then builtins.head runs
    else mergeAll (mergePairs runs);

  timsort = lst:
    if lst == [] then lst
    else
      let chunks = chunksOf minRun lst;
          sorted = map insertionSort chunks;
      in mergeAll sorted;

in timsort [5 2 8 1 9 3 7 4 6]
