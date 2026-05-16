let bubble_pass = fun arr =>
  let n = std.array.length arr in
  std.array.fold_left
    (fun acc i =>
      let a = acc.arr in
      let xi = std.array.at i a in
      let xi1 = std.array.at (i + 1) a in
      if xi > xi1 then
        let new_arr = std.array.set i xi1 (std.array.set (i + 1) xi a) in
        { arr = new_arr, swapped = true }
      else acc)
    { arr = arr, swapped = false }
    (std.array.range 0 (n - 1))
in

let rec bubble_sort = fun arr =>
  let result = bubble_pass arr in
  if result.swapped then bubble_sort result.arr else result.arr
in

bubble_sort [64, 34, 25, 12, 22, 11, 90]
