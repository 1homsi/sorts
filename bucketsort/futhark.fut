let insertion_sort (bucket: []f64) : []f64 =
    let n = length bucket
    let arr = copy bucket
    let arr = loop arr for i < n do
        let key = arr[i]
        let (arr, _) = loop (arr, j) = (arr, i-1) while j >= 0 && arr[j] > key do
            (arr with [j+1] = arr[j], j-1)
        in arr with [j+1+1] = key
    in arr
    in arr

let get_idx (num: f64) (mn: f64) (mx: f64) (n: i64) : i64 =
    i64.min (n - 1) (i64.f64 ((num - mn) / (mx - mn + 1f64) * f64.i64 n))

let bucket_sort (arr: []f64) : []f64 =
    let n = length arr
    if n == 0 then arr
    else
        let mn = reduce f64.min f64.highest arr
        let mx = reduce f64.max f64.lowest arr
        let idxs = map (\x -> get_idx x mn mx (i64.i32 n)) arr
        let buckets = map (\i -> filter (\x -> get_idx x mn mx (i64.i32 n) == i) arr) (iota (i64.i32 n))
        let sorted_buckets = map insertion_sort buckets
        in flatten sorted_buckets

let main : []f64 =
    bucket_sort [0.78f64, 0.17f64, 0.39f64, 0.26f64, 0.72f64, 0.94f64, 0.21f64, 0.12f64, 0.23f64, 0.68f64]
