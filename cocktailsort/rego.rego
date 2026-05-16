package cocktailsort

default sorted = []

swap(arr, i, j) = result {
    result := [arr[k] |
        k := numbers.range(0, count(arr) - 1)[_]
        not k == i, not k == j
    ] | arr[j] | arr[i]
}

cocktail_sort(arr) = result {
    count(arr) <= 1
    result := arr
} else = result {
    result := arr
}
