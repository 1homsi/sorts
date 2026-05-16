package combsort

import future.keywords

new_gap(gap) := g {
    g := max([1, floor(gap / 1.3)])
}

comb_sort(arr) := result {
    result := _sort_loop(arr, count(arr))
}

_sort_loop(arr, gap) := arr {
    gap == 1
    not _has_swap(arr, gap)
} else := _sort_loop(arr2, new_g) {
    new_g := new_gap(gap)
    arr2 := _pass(arr, new_g, 0)
}

_pass(arr, gap, i) := arr {
    i + gap >= count(arr)
} else := _pass(arr2, gap, i + 1) {
    arr[i] > arr[i + gap]
    arr2 := _swap(arr, i, i + gap)
} else := _pass(arr, gap, i + 1)

_swap(arr, i, j) := result {
    result := [v | v := _elem(arr, i, j, k) | k := numbers.range(0, count(arr)-1)]
}

_elem(arr, i, j, k) := arr[j] { k == i }
_elem(arr, i, j, k) := arr[i] { k == j }
_elem(arr, i, j, k) := arr[k] { k != i; k != j }

_has_swap(arr, gap) {
    i := numbers.range(0, count(arr)-gap-1)[_]
    arr[i] > arr[i + gap]
}
