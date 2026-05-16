package mergesort

import future.keywords.if

merge(left, right) := result if {
    count(left) == 0
    result := right
} else := result if {
    count(right) == 0
    result := left
} else := result if {
    left[0] <= right[0]
    rest := merge(array.slice(left, 1, count(left)), right)
    result := array.concat([left[0]], rest)
} else := result if {
    rest := merge(left, array.slice(right, 1, count(right)))
    result := array.concat([right[0]], rest)
}

merge_sort(arr) := arr if count(arr) <= 1
merge_sort(arr) := result if {
    count(arr) > 1
    mid := round(count(arr) / 2)
    left := merge_sort(array.slice(arr, 0, mid))
    right := merge_sort(array.slice(arr, mid, count(arr)))
    result := merge(left, right)
}

sorted := merge_sort([38, 27, 43, 3, 9, 82, 10])
