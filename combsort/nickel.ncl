let comb_sort = fun arr =>
  let n = std.array.length arr in
  let rec sort_loop = fun arr gap =>
    let new_gap = std.number.max 1 (std.number.floor (gap / 1.3)) in
    let result = std.array.fold_left
      (fun acc i =>
        let a = std.array.at i acc in
        let b = std.array.at (i + new_gap) acc in
        if a > b then
          std.array.update i b (std.array.update (i + new_gap) a acc)
        else
          acc)
      arr
      (std.array.range 0 (n - new_gap))
    in
    if new_gap == 1 then result
    else sort_loop result new_gap
  in
  sort_loop arr n
in
comb_sort
