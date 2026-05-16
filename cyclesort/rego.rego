package cyclesort

import future.keywords

input_arr := [5, 4, 3, 2, 1]

count_smaller(arr, item) := count([x | x := arr[_]; x < item])

sorted_position(arr, idx) := count_smaller(arr, arr[idx])

sorted[pos] := val {
    val := input_arr[idx]
    pos := sorted_position(input_arr, idx)
}

result := [val | val := sorted[_]]
