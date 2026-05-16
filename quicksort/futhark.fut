let quicksort [n] (arr: [n]i32): []i32 =
  if n <= 1 then arr
  else
    let pivot = arr[n / 2]
    let left = filter (<pivot) arr
    let middle = filter (==pivot) arr
    let right = filter (>pivot) arr
    in (quicksort left) ++ middle ++ (quicksort right)

let main : []i32 = quicksort [3i32, 6, 8, 10, 1, 2, 1]
