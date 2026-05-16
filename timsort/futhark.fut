let insert (x: i64) (arr: []i64) : []i64 =
  let n = length arr
  let idx = loop i = 0 while i < n && arr[i] <= x do i + 1
  in (arr[:idx]) ++ [x] ++ (arr[idx:])

let insertion_sort (arr: []i64) : []i64 =
  reduce (flip insert) [] arr

let merge_runs (xs: []i64) (ys: []i64) : []i64 =
  let n = length xs + length ys
  in loop (acc, i, j) = ([], 0, 0) for _ < n do
    if i >= length xs then (acc ++ [ys[j]], i, j+1)
    else if j >= length ys then (acc ++ [xs[i]], i+1, j)
    else if xs[i] <= ys[j] then (acc ++ [xs[i]], i+1, j)
    else (acc ++ [ys[j]], i, j+1)
    |> (.0)

let chunks_of (n: i64) (arr: []i64) : [][]i64 =
  let m = (length arr + n - 1) / n
  in tabulate m (\i ->
    let start = i * n
    let end = i64.min (start + n) (length arr)
    in arr[start:end])

let merge_pairs (runs: [][]i64) : [][]i64 =
  let n = length runs
  let pairs = n / 2
  let merged = tabulate pairs (\i -> merge_runs runs[2*i] runs[2*i+1])
  in if n % 2 == 1 then merged ++ [runs[n-1]] else merged

let merge_all (runs: [][]i64) : []i64 =
  loop r = runs while length r > 1 do merge_pairs r
  |> head

let timsort (arr: []i64) : []i64 =
  if length arr == 0 then arr
  else merge_all (map insertion_sort (chunks_of 32 arr))

let main : []i64 = timsort [5i64, 2, 8, 1, 9, 3, 7, 4, 6]
