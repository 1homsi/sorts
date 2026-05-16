let
  pkgs = import <nixpkgs> {};
  lib = pkgs.lib;

  shellSort = arr:
    let
      n = builtins.length arr;
      doSort = arr: gap:
        if gap <= 0 then arr
        else
          let
            afterPass = builtins.foldl' (a: i:
              let
                temp = builtins.elemAt a i;
                shift = j: a:
                  if j >= gap && builtins.elemAt a (j - gap) > temp
                  then shift (j - gap) (lib.imap0 (idx: v: if idx == j then builtins.elemAt a (j - gap) else v) a)
                  else lib.imap0 (idx: v: if idx == j then temp else v) a;
              in shift i a
            ) arr (lib.range gap (n - 1));
          in doSort afterPass (gap / 2);
    in doSort arr (n / 2);

in shellSort [64 34 25 12 22 11 90]
