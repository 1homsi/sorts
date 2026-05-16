def flip [n] (arr: [n]i32) (k: i64) : [n]i32 =
  tabulate n (\i ->
    let j = i64.i32 (i32.i64 i)
    in if j <= k
       then arr[k - j]
       else arr[j])

def find_max_idx [n] (arr: [n]i32) (size: i64) : i64 =
  let (_, idx) =
    loop (max_val, max_idx) = (arr[0], 0i64) for i < size do
      if arr[i] > max_val then (arr[i], i) else (max_val, max_idx)
  in idx

def pancake_sort [n] (arr: [n]i32) : [n]i32 =
  loop a = arr for size in (n-1)..(n-2)..1 do
    let max_idx = find_max_idx a (size + 1)
    in if max_idx != size
       then let a1 = if max_idx != 0 then flip a max_idx else a
            in flip a1 size
       else a

let main : []i32 = pancake_sort [3i32, 6i32, 2i32, 7i32, 4i32, 1i32, 5i32]
