let
  lib = import <nixpkgs/lib>;

  flip = arr: k:
    let
      n = builtins.length arr;
      front = builtins.reverseList (lib.sublist 0 (k + 1) arr);
      back = lib.sublist (k + 1) (n - k - 1) arr;
    in front ++ back;

  findMaxIdx = arr: size:
    let
      sub = lib.sublist 0 size arr;
      indexed = lib.imap0 (i: v: { inherit i v; }) sub;
      maxEntry = builtins.foldl'
        (acc: x: if x.v > acc.v then x else acc)
        { i = 0; v = builtins.elemAt sub 0; }
        indexed;
    in maxEntry.i;

  go = arr: size:
    if size <= 1 then arr
    else
      let
        mi = findMaxIdx arr size;
        arr1 = if mi != 0 then flip arr mi else arr;
        arr2 = flip arr1 (size - 1);
      in go arr2 (size - 1);

  pancakeSort = arr: go arr (builtins.length arr);

in
  pancakeSort [ 3 6 2 7 4 1 5 ]
