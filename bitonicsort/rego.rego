package bitonicsort

import future.keywords

data_arr := [3, 7, 4, 8, 6, 2, 1, 5]

sorted := sorted_arr {
    sorted_arr := sort(data_arr)
}

compare_and_swap(arr, i, j, direction) := new_arr {
    ai := arr[i]
    aj := arr[j]
    direction == (ai > aj)
    new_arr := array.concat(
        array.slice(arr, 0, i),
        array.concat([aj], array.concat(
            array.slice(arr, i+1, j),
            array.concat([ai], array.slice(arr, j+1, count(arr)))
        ))
    )
}

compare_and_swap(arr, i, j, direction) := arr {
    ai := arr[i]
    aj := arr[j]
    not direction == (ai > aj)
}
