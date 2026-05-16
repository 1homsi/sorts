def selection_sort (arr: []i32): []i32 =
  let n = length arr
  in loop arr for i < n do
    let min_idx = loop min_idx = i for j in (i+1)..<n do
      if arr[j] < arr[min_idx] then j else min_idx
    let tmp = arr[i]
    let arr = arr with [i] = arr[min_idx]
    let arr = arr with [min_idx] = tmp
    in arr
