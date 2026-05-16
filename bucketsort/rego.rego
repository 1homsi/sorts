package bucketsort

import future.keywords.in

arr := [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]

min_val := min({x | x := arr[_]})
max_val := max({x | x := arr[_]})
n := count(arr)

bucket_idx(num) := idx {
    raw := floor((num - min_val) / (max_val - min_val + 1) * n)
    idx := min([n - 1, raw])
}

buckets[b] := vals {
    b := numbers.range(0, n - 1)[_]
    vals := [x | x := arr[_]; bucket_idx(x) == b]
}

insertion_sort(lst) := sorted {
    sorted := sort(lst)
}

sorted := result {
    result := [v |
        b := numbers.range(0, n - 1)[_]
        bucket := buckets[b]
        v := insertion_sort(bucket)[_]
    ]
}
