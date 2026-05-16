let compare_and_swap = fun arr i j direction =>
  let ai = std.array.at i arr in
  let aj = std.array.at j arr in
  if direction == (ai > aj) then
    std.array.update i aj (std.array.update j ai arr)
  else
    arr
in

let rec bitonic_merge = fun arr lo cnt direction =>
  if cnt <= 1 then arr
  else
    let k = cnt / 2 in
    let arr1 = std.array.range lo (lo + k)
      |> std.array.fold_left (fun a i => compare_and_swap a i (i + k) direction) arr in
    let arr2 = bitonic_merge arr1 lo k direction in
    bitonic_merge arr2 (lo + k) k direction
in

let rec bitonic_sort = fun arr lo cnt direction =>
  if cnt <= 1 then arr
  else
    let k = cnt / 2 in
    let arr1 = bitonic_sort arr lo k true in
    let arr2 = bitonic_sort arr1 (lo + k) k false in
    bitonic_merge arr2 lo cnt direction
in

let data = [3, 7, 4, 8, 6, 2, 1, 5] in
bitonic_sort data 0 (std.array.length data) true
