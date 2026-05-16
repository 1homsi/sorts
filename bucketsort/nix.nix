with builtins;

let
  insertSorted = x: lst:
    if lst == [] then [x]
    else
      let h = head lst;
          t = tail lst;
      in if x <= h then [x] ++ [h] ++ t
         else [h] ++ (insertSorted x t);

  insertionSort = lst:
    foldl' (acc: x: insertSorted x acc) [] lst;

  getIdx = num: mn: mx: n:
    let raw = floor ((num - mn) / (mx - mn + 1) * n);
    in if raw >= n then n - 1 else raw;

  bucketSort = arr:
    let
      n = length arr;
      mn = foldl' (a: b: if b < a then b else a) (head arr) arr;
      mx = foldl' (a: b: if b > a then b else a) (head arr) arr;
      getIdx' = num: getIdx num mn mx n;
      buckets = map (i:
        filter (x: getIdx' x == i) arr
      ) (genList (x: x) n);
    in
      concatMap insertionSort buckets;

in
  bucketSort [0.78 0.17 0.39 0.26 0.72 0.94 0.21 0.12 0.23 0.68]
