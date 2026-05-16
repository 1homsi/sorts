let
  lib = import <nixpkgs/lib>;

  bubblePass = arr:
    let
      n = builtins.length arr;
      step = i: acc:
        let
          a = acc.arr;
          xi = builtins.elemAt a i;
          xi1 = builtins.elemAt a (i + 1);
        in
        if xi > xi1
        then {
          arr = lib.imap0 (j: v: if j == i then xi1 else if j == i + 1 then xi else v) a;
          swapped = true;
        }
        else { arr = a; swapped = acc.swapped; };
    in
    builtins.foldl' step { arr = arr; swapped = false; } (lib.range 0 (n - 2));

  bubbleSort = arr:
    let result = bubblePass arr;
    in if result.swapped then bubbleSort result.arr else result.arr;

in
  bubbleSort [ 64 34 25 12 22 11 90 ]
