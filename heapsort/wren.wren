class Heapsort {
    static heapify(arr, n, i) {
        var largest = i
        var left = 2 * i + 1
        var right = 2 * i + 2
        if (left < n && arr[left] > arr[largest]) largest = left
        if (right < n && arr[right] > arr[largest]) largest = right
        if (largest != i) {
            var tmp = arr[i]
            arr[i] = arr[largest]
            arr[largest] = tmp
            heapify(arr, n, largest)
        }
    }

    static sort(arr) {
        var n = arr.count
        var i = n / 2 - 1
        while (i >= 0) { heapify(arr, n, i); i = i - 1 }
        i = n - 1
        while (i > 0) {
            var tmp = arr[0]
            arr[0] = arr[i]
            arr[i] = tmp
            heapify(arr, i, 0)
            i = i - 1
        }
        return arr
    }
}

var arr = [12, 11, 13, 5, 6, 7]
System.print(Heapsort.sort(arr))
