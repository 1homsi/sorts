let shell_sort = fun arr =>
  let n = std.array.length arr in
  let arr_ref = std.array.fold_right (fun x acc => acc @ [x]) [] arr in
  std.array.sort (fun a b => a <= b) arr_ref
in

shell_sort [64, 34, 25, 12, 22, 11, 90]
