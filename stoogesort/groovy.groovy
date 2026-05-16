def stoogeSort(arr, first, last) {
    if (arr[first] > arr[last]) {
        def tmp = arr[first]
        arr[first] = arr[last]
        arr[last] = tmp
    }
    if (last - first + 1 > 2) {
        def t = (last - first + 1) * 2 / 3 as int
        stoogeSort(arr, first, first + t - 1)
        stoogeSort(arr, last - t + 1, last)
        stoogeSort(arr, first, first + t - 1)
    }
}

def arr = [3, 1, 4, 1, 5, 9, 2, 6]
stoogeSort(arr, 0, arr.size() - 1)
println arr
