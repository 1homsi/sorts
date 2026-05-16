package pancakesort

flip(arr, k) = result {
    result := array.concat(
        array.reverse(array.slice(arr, 0, k + 1)),
        array.slice(arr, k + 1, count(arr))
    )
}

find_max_idx(arr, size) = idx {
    sub := array.slice(arr, 0, size)
    max_val := max(sub)
    idx := [i | sub[i] == max_val][0]
}

sort_step(arr, size) = arr { size <= 1 }
sort_step(arr, size) = result {
    size > 1
    mi := find_max_idx(arr, size)
    arr1 := flip(arr, mi) { mi != 0 }
    arr1 := arr { mi == 0 }
    arr2 := flip(arr1, size - 1)
    result := sort_step(arr2, size - 1)
}

sorted = sort_step([3, 6, 2, 7, 4, 1, 5], 7)
