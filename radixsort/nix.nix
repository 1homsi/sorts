let
  lib = import <nixpkgs/lib>;

  getDigit = x: exp: (builtins.div x exp) - (builtins.mul 10 (builtins.div (builtins.div x exp) 10));

  countingSort = arr: exp:
    builtins.concatLists
      (map (d: builtins.filter (x: getDigit x exp == d) arr)
           (lib.range 0 9));

  radixSortLoop = arr: maxVal: exp:
    if builtins.div maxVal exp == 0 then arr
    else radixSortLoop (countingSort arr exp) maxVal (exp * 10);

  radixSort = arr:
    if arr == [] then arr
    else
      let maxVal = builtins.foldl' (acc: x: if x > acc then x else acc) 0 arr;
      in radixSortLoop arr maxVal 1;

in
  radixSort [ 170 45 75 90 802 24 2 66 ]
