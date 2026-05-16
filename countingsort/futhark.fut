def counting_sort (arr: []i32) : []i32 =
  if length arr == 0 then arr
  else
    let min_val = reduce i32.min i32.highest arr
    let max_val = reduce i32.max i32.lowest arr
    let range = i64.i32 (max_val - min_val + 1)
    let idxs = map ( -> i64.i32 (v - min_val)) arr
    let count = reduce_by_index (replicate range 0i64) (+) 0i64 idxs (replicate (length arr) 1i64)
    let offsets = scan (+) 0i64 count
    let starts = map2 (-) offsets count
    in scatter (replicate (length arr) 0i32)
               (flatten (map2 (\start cnt -> map (+start) (iota cnt)) starts count))
               (flatten (map2 ( cnt -> replicate cnt v) (map (+min_val) (map i32.i64 (iota range))) count))

let main = counting_sort [4i32, 2, 2, 8, 3, 3, 1]
