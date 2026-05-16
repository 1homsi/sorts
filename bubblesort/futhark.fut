def bubble_pass [n] (arr: [n]i32) : ([n]i32, bool) =
  let (arr', swapped) =
    loop (a, sw) = (arr, false) for i < n-1 do
      if a[i] > a[i+1]
      then (a with [i] = a[i+1] with [i+1] = a[i], true)
      else (a, sw)
  in (arr', swapped)

def bubble_sort [n] (arr: [n]i32) : [n]i32 =
  let (sorted, _) =
    loop (a, go) = (arr, true) while go do
      let (a', sw) = bubble_pass a
      in (a', sw)
  in sorted

def main = bubble_sort [64i32, 34, 25, 12, 22, 11, 90]
