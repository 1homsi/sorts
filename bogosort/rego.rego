package bogosort

import future.keywords

arr := [3, 1, 4, 1, 5, 9, 2, 6]

is_sorted(a) if {
    every i in numbers.range(0, count(a) - 2) {
        a[i] <= a[i + 1]
    }
}

bogosort(a) := sorted if {
    is_sorted(a)
    sorted := a
}

bogosort(a) := bogosort(shuffled) if {
    not is_sorted(a)
    shuffled := [a[j] | j := numbers.range(0, count(a) - 1)[_]]
}

result := bogosort(arr)
