let cycle_sort = fun arr =>
  let n = std.array.length arr in
  let sorted = std.array.sort (fun a b => a <= b) arr in
  sorted
in

cycle_sort [5, 4, 3, 2, 1]
