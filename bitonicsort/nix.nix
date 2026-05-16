let
  compareAndSwap = arr: i: j: direction:
    let ai = builtins.elemAt arr i;
        aj = builtins.elemAt arr j;
        swap = ai > aj == direction;
    in if swap
       then builtins.genList (idx:
              if idx == i then aj
              else if idx == j then ai
              else builtins.elemAt arr idx
            ) (builtins.length arr)
       else arr;

  bitonicMerge = arr: lo: cnt: direction:
    if cnt <= 1 then arr
    else
      let k = cnt / 2;
          indices = builtins.genList (n: lo + n) k;
          arr2 = builtins.foldl' (a: i: compareAndSwap a i (i + k) direction) arr indices;
          arr3 = bitonicMerge arr2 lo k direction;
      in bitonicMerge arr3 (lo + k) k direction;

  bitonicSort = arr: lo: cnt: direction:
    if cnt <= 1 then arr
    else
      let k = cnt / 2;
          arr2 = bitonicSort arr lo k true;
          arr3 = bitonicSort arr2 (lo + k) k false;
      in bitonicMerge arr3 lo cnt direction;

  data = [3 7 4 8 6 2 1 5];
in
  bitonicSort data 0 (builtins.length data) true
