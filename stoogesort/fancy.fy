def stooge_sort: arr from: first to: last {
    arr[first] > arr[last] if_true: {
        tmp = arr[first]
        arr[first]: arr[last]
        arr[last]: tmp
    }
    n = last - first + 1
    n > 2 if_true: {
        t = n * 2 / 3
        stooge_sort: arr from: first to: (first + t - 1)
        stooge_sort: arr from: (last - t + 1) to: last
        stooge_sort: arr from: first to: (first + t - 1)
    }
}

arr = [3, 1, 4, 1, 5, 9, 2, 6]
stooge_sort: arr from: 0 to: (arr size - 1)
arr println
