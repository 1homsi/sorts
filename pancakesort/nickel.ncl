let flip = fun arr k =>
  let n = std.array.length arr in
  std.array.generate n (fun i =>
    if i <= k then
      std.array.at arr (k - i)
    else
      std.array.at arr i
  )
in

let find_max_idx = fun arr size =>
  std.array.fold_left
    (fun acc i =>
      if std.array.at arr i > std.array.at arr acc.max_idx then
        { idx = i, max_idx = i }
      else
        acc
    )
    { idx = 0, max_idx = 0 }
    (std.array.generate (size - 1) (fun i => i + 1))
  |> fun x => x.max_idx
in

let rec pancake_sort = fun arr size =>
  if size <= 1 then arr
  else
    let mi = find_max_idx arr size in
    let arr1 = if mi != 0 then flip arr mi else arr in
    let arr2 = flip arr1 (size - 1) in
    pancake_sort arr2 (size - 1)
in

pancake_sort [3, 6, 2, 7, 4, 1, 5] 7
