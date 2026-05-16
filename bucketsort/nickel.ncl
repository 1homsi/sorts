let insert_sorted = fun x lst =>
  if lst == [] then [x]
  else
    let h = std.array.first lst in
    let t = std.array.drop_first lst in
    if x <= h then [x] @ [h] @ t
    else [h] @ (insert_sorted x t)
in

let insertion_sort = fun lst =>
  std.array.fold_left (fun acc x => insert_sorted x acc) [] lst
in

let get_idx = fun num mn mx n =>
  let raw = std.number.floor ((num - mn) / (mx - mn + 1) * n) in
  std.number.min (n - 1) raw
in

let bucket_sort = fun arr =>
  let n = std.array.length arr in
  if n == 0 then arr
  else
    let mn = std.array.fold_left (fun a b => if b < a then b else a) (std.array.first arr) arr in
    let mx = std.array.fold_left (fun a b => if b > a then b else a) (std.array.first arr) arr in
    let buckets = std.array.generate (fun _ => []) n in
    let filled = std.array.fold_left (fun bs x =>
      let idx = get_idx x mn mx n in
      std.array.map_with_index (fun i b => if i == idx then b @ [x] else b) bs
    ) buckets arr in
    std.array.flatten (std.array.map insertion_sort filled)
in

bucket_sort [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
