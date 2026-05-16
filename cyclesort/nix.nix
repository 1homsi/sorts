let
  lib = import <nixpkgs/lib>;

  cycleSort = arr:
    let
      n = builtins.length arr;
      indexed = lib.imap0 (i: v: { idx = i; val = v; }) arr;
      countSmaller = item:
        builtins.length (builtins.filter (x: x.val < item) indexed);
      positioned = map (x: { pos = countSmaller x.val; val = x.val; }) indexed;
      sorted = lib.sortOn (x: x.pos) positioned;
    in
      map (x: x.val) sorted;
in
  cycleSort [ 5 4 3 2 1 ]
