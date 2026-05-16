let merge [m] [n] (left: [m]i32) (right: [n]i32) : []i32 =
    let total = m + n
    in loop (result, i, j) = (replicate total 0i32, 0, 0)
       while i < m || j < n do
         if i >= m then (result with [i+j] = right[j], i, j+1)
         else if j >= n then (result with [i+j] = left[i], i+1, j)
         else if left[i] <= right[j] then (result with [i+j] = left[i], i+1, j)
         else (result with [i+j] = right[j], i, j+1)
    |> (.0)

let merge_sort [n] (arr: [n]i32) : []i32 =
    if n <= 1 then arr
    else
        let mid = n / 2
        let left = merge_sort arr[0:mid]
        let right = merge_sort arr[mid:n]
        in merge left right

let main : []i32 =
    merge_sort [38i32, 27, 43, 3, 9, 82, 10]
