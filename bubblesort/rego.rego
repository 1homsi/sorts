package bubblesort

import future.keywords.every

bubble_sorted(arr) = sorted {
    sorted := array.concat([], [x | x := arr[_]; count([y | y := arr[_]; y < x]) <= _])
}

default sorted_result = []

sorted_result := result {
    input_arr := [64, 34, 25, 12, 22, 11, 90]
    result := sort(input_arr)
}

sort(arr) = sorted {
    sorted := [x | x := arr[_]; count([y | y := arr[_]; y < x]) == 0]
}
