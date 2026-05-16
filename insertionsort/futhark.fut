def insertion_sort (arr: []i32): []i32 =
    let n = length arr
    let arr = copy arr
    in loop arr for i < n do
        let key = arr[i]
        let (arr, j) = loop (arr, j) = (arr, i - 1) while j >= 0 && arr[j] > key do
            (arr with [j+1] = arr[j], j - 1)
        in arr with [j+1] = key
