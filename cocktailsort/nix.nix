{ lib }:

let
  cocktailSort = arr:
    let
      n = builtins.length arr;
      swapAt = a: i: j:
        builtins.genList (k:
          if k == i then builtins.elemAt a j
          else if k == j then builtins.elemAt a i
          else builtins.elemAt a k) n;
      forwardPass = a: start: end_:
        builtins.foldl' (acc: i:
          let ai = builtins.elemAt acc.arr i;
              aj = builtins.elemAt acc.arr (i + 1);
          in if ai > aj
             then { arr = swapAt acc.arr i (i + 1); swapped = true; }
             else acc)
          { arr = a; swapped = false; }
          (lib.range start (end_ - 1));
      backwardPass = a: start: end_:
        builtins.foldl' (acc: i:
          let ai = builtins.elemAt acc.arr i;
              aj = builtins.elemAt acc.arr (i + 1);
          in if ai > aj
             then { arr = swapAt acc.arr i (i + 1); swapped = true; }
             else acc)
          { arr = a; swapped = false; }
          (lib.reverseList (lib.range start (end_ - 1)));
      go = arr: start: end_:
        let fwd = forwardPass arr start end_;
        in if !fwd.swapped then fwd.arr
           else
             let bwd = backwardPass fwd.arr start (end_ - 1);
             in if !bwd.swapped then bwd.arr
                else go bwd.arr (start + 1) (end_ - 1);
    in if n <= 1 then arr else go arr 0 (n - 1);
in
cocktailSort [ 5 3 8 1 9 2 7 4 6 0 ]
