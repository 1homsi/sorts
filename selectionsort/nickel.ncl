let selection_sort = fun arr =>
  let n = std.array.length arr in
  let rec go = fun arr i =>
    if i >= n then arr
    else
      let min_idx = std.array.fold_left
        (fun acc j => if std.array.at arr j < std.array.at arr acc then j else acc)
        i
        (std.array.range (i + 1) n)
      in
      let tmp = std.array.at arr i in
      let arr = std.array.update arr i (std.array.at arr min_idx) in
      let arr = std.array.update arr min_idx tmp in
      go arr (i + 1)
  in
  go arr 0
in
selection_sort [5, 3, 1, 4, 2]
