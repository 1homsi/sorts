let
  newGap = gap:
    let g = builtins.floor (gap / 1.3);
    in if g < 1 then 1 else g;

  swap = arr: i: j:
    builtins.genList (k:
      if k == i then builtins.elemAt arr j
      else if k == j then builtins.elemAt arr i
      else builtins.elemAt arr k)
    (builtins.length arr);

  pass = arr: gap: i:
    let n = builtins.length arr; in
    if i + gap >= n then arr
    else
      let a = builtins.elemAt arr i;
          b = builtins.elemAt arr (i + gap);
      in if a > b
         then pass (swap arr i (i + gap)) gap (i + 1)
         else pass arr gap (i + 1);

  sortLoop = arr: gap:
    let n = builtins.length arr;
        g = newGap gap;
        arr' = pass arr g 0;
    in if g == 1 then arr'
       else sortLoop arr' g;

  combSort = arr: sortLoop arr (builtins.length arr);

in combSort
