package radixsort

import future.keywords

input_arr := [170, 45, 75, 90, 802, 24, 2, 66]

get_digit(x, exp) := (x / exp) % 10

counting_sort(arr, exp) := result {
    buckets := [bucket |
        d := numbers.range(0, 9)[_]
        bucket := [x | x := arr[_]; get_digit(x, exp) == d]
    ]
    result := array.concat(buckets[_], [])
}

radix_sort(arr) := sorted {
    max_val := max(arr)
    sorted := _radix_loop(arr, max_val, 1)
}

_radix_loop(arr, max_val, exp) := arr {
    max_val / exp < 1
}

_radix_loop(arr, max_val, exp) := result {
    max_val / exp >= 1
    next := counting_sort(arr, exp)
    result := _radix_loop(next, max_val, exp * 10)
}

result := radix_sort(input_arr)
