package quicksort

import future.keywords.in

quicksort(arr) = sorted {
    count(arr) <= 1
    sorted := arr
} else = result {
    pivot := arr[count(arr) / 2]
    left := [x | x := arr[_]; x < pivot]
    middle := [x | x := arr[_]; x == pivot]
    right := [x | x := arr[_]; x > pivot]
    result := array.concat(array.concat(quicksort(left), middle), quicksort(right))
}

sorted_result := quicksort([3, 6, 8, 10, 1, 2, 1])
