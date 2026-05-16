package stoogesort

stooge_sort(arr, first, last) = sorted {
    count(arr) > 0
    a := arr[first]
    b := arr[last]
    arr1 := swapped_if_needed(arr, first, last, a, b)
    n := last - first + 1
    n > 2
    t := n * 2 / 3
    arr2 := stooge_sort(arr1, first, first + t - 1)
    arr3 := stooge_sort(arr2, last - t + 1, last)
    sorted := stooge_sort(arr3, first, first + t - 1)
}

stooge_sort(arr, first, last) = arr {
    last - first + 1 <= 2
}

swapped_if_needed(arr, first, last, a, b) = arr { a <= b }
swapped_if_needed(arr, first, last, a, b) = new_arr {
    a > b
    new_arr := array.concat(
        array.concat(array.slice(arr, 0, first), [b]),
        array.concat(array.slice(arr, first+1, last), array.concat([a], array.slice(arr, last+1, count(arr))))
    )
}

result := stooge_sort([3, 1, 4, 1, 5, 9, 2, 6], 0, 7)
