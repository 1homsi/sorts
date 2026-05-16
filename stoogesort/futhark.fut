def swap [n] (arr: *[n]i32) (i: i64) (j: i64) : *[n]i32 =
    let tmp = arr[i]
    let arr = arr with [i] = arr[j]
    let arr = arr with [j] = tmp
    in arr

def stooge_sort [n] (arr: *[n]i32) (first: i64) (last: i64) : *[n]i32 =
    let arr = if arr[first] > arr[last] then swap arr first last else arr
    in if last - first + 1 > 2 then
        let t = (last - first + 1) * 2 / 3
        let arr = stooge_sort arr first (first + t - 1)
        let arr = stooge_sort arr (last - t + 1) last
        in stooge_sort arr first (first + t - 1)
    else arr

def main : []i32 =
    let arr = [3i32, 1, 4, 1, 5, 9, 2, 6]
    in stooge_sort (copy arr) 0i64 (i64.i32 (length arr) - 1)
