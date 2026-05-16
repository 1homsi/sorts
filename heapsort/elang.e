def heapify(arr, n, i) {
    var largest := i
    def left := 2 * i + 1
    def right := 2 * i + 2
    if (left < n && arr[left] > arr[largest]) { largest := left }
    if (right < n && arr[right] > arr[largest]) { largest := right }
    if (largest != i) {
        def tmp := arr[i]
        arr[i] := arr[largest]
        arr[largest] := tmp
        heapify(arr, n, largest)
    }
}

def heapsort(arr) {
    def n := arr.size()
    var i := n // 2 - 1
    while (i >= 0) { heapify(arr, n, i); i -= 1 }
    i := n - 1
    while (i > 0) {
        def tmp := arr[0]
        arr[0] := arr[i]
        arr[i] := tmp
        heapify(arr, i, 0)
        i -= 1
    }
    arr
}

def arr := [12, 11, 13, 5, 6, 7].diverge()
traceln(`${heapsort(arr)}`)
