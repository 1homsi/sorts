let is_sorted = fun arr =>
  let n = std.array.length arr in
  std.array.fold_left
    (fun acc i =>
      if i >= n - 1 then acc
      else acc && (std.array.at arr i <= std.array.at arr (i + 1)))
    true
    (std.array.range 0 n)
in

let bogosort = fun arr =>
  if is_sorted arr then arr
  else bogosort (std.array.shuffle arr)
in

bogosort [3, 1, 4, 1, 5, 9, 2, 6]
