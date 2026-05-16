heapsort: func(arr: ArrayList<Int>) {
    n := arr size
    i := n / 2 - 1
    while (i >= 0) {
        siftdown(arr, i, n)
        i -= 1
    }
    i = n - 1
    while (i > 0) {
        temp := arr get(0)
        arr set(0, arr get(i))
        arr set(i, temp)
        siftdown(arr, 0, i)
        i -= 1
    }
}

siftdown: func(arr: ArrayList<Int>, idx: Int, n: Int) {
    largest := idx
    left := 2 * idx + 1
    right := 2 * idx + 2
    if (left < n && arr get(left) > arr get(largest)) {
        largest = left
    }
    if (right < n && arr get(right) > arr get(largest)) {
        largest = right
    }
    if (largest != idx) {
        temp := arr get(idx)
        arr set(idx, arr get(largest))
        arr set(largest, temp)
        siftdown(arr, largest, n)
    }
}

arr := ArrayList<Int> new()
arr add(5) add(2) add(8) add(1) add(9) add(3)
heapsort(arr)
arr toString() println()
