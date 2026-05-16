let rec insert = fun x lst =>
  if lst == [] then [x]
  else
    let h = std.array.first lst in
    let t = std.array.drop_first lst in
    if x <= h then [x] @ [h] @ t
    else [h] @ (insert x t)
in

let rec insertion_sort = fun lst =>
  if lst == [] then []
  else
    let h = std.array.first lst in
    let t = std.array.drop_first lst in
    insert h (insertion_sort t)
in
insertion_sort
