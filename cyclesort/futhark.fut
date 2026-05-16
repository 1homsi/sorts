def cycle_sort [n] (arr: [n]i32): [n]i32 =
  loop a = copy arr for cycle_start < n-1 do
    let item = a[cycle_start]
    let pos = i64.i64 cycle_start + i64.i64 (
      reduce (+) 0 (map (\x -> if x < item then 1 else 0) a[cycle_start+1:n]))
    in if pos == cycle_start then a
       else
         let a' = a with [pos] = a[cycle_start]
         let a'' = a' with [cycle_start] = item
         in a''

def main: []i32 =
  cycle_sort [5i32, 4i32, 3i32, 2i32, 1i32]
