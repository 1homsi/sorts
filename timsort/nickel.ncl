let min_run = 32 in

let rec insert_val = fun x lst =>
  if lst == [] then [x]
  else
    let h = std.array.first lst in
    let t = std.array.drop_first lst in
    if x <= h then x & [h] @ t
    else h & (insert_val x t)
in

let rec insertion_sort = fun lst =>
  if lst == [] then []
  else
    let h = std.array.first lst in
    let t = std.array.drop_first lst in
    insert_val h (insertion_sort t)
in

let rec merge_runs = fun xs ys =>
  if xs == [] then ys
  else if ys == [] then xs
  else
    let x = std.array.first xs in
    let y = std.array.first ys in
    if x <= y then x & (merge_runs (std.array.drop_first xs) ys)
    else y & (merge_runs xs (std.array.drop_first ys))
in

let rec chunks_of = fun n lst =>
  if lst == [] then []
  else (std.array.slice 0 n lst) & (chunks_of n (std.array.slice n (std.array.length lst) lst))
in

let rec merge_pairs = fun runs =>
  if std.array.length runs == 0 then []
  else if std.array.length runs == 1 then runs
  else
    let x = runs | std.array.at 0 in
    let y = runs | std.array.at 1 in
    let rest = std.array.slice 2 (std.array.length runs) runs in
    (merge_runs x y) & (merge_pairs rest)
in

let rec merge_all = fun runs =>
  if std.array.length runs == 1 then runs | std.array.at 0
  else merge_all (merge_pairs runs)
in

let timsort = fun lst =>
  if lst == [] then lst
  else
    let chunks = chunks_of min_run lst in
    let sorted_chunks = std.array.map insertion_sort chunks in
    merge_all sorted_chunks
in

timsort [5, 2, 8, 1, 9, 3, 7, 4, 6]
