cocktailsort: func(arr: Int[]) {
    n := arr length
    i := 0
    while (i < n) {
        swapped := false
        for (k in 0..n - i - 2) {
            if (arr[k] > arr[k + 1]) {
                temp := arr[k]
                arr[k] = arr[k + 1]
                arr[k + 1] = temp
                swapped = true
            }
        }
        if (!swapped) break
        i += 1
        swapped = false
        for (k in (n - i - 2)..0) {
            if (arr[k] > arr[k + 1]) {
                temp := arr[k]
                arr[k] = arr[k + 1]
                arr[k + 1] = temp
                swapped = true
            }
        }
        if (!swapped) break
        i += 1
    }
}

arr := [5, 2, 8, 1, 9, 3] as Int[]
cocktailsort(arr)
"Sorted: " println(arr toString())
