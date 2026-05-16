class Heapsort {
    static Void heapify(Int[] arr, Int n, Int i) {
        largest := i
        left := 2 * i + 1
        right := 2 * i + 2
        if (left < n && arr[left] > arr[largest]) largest = left
        if (right < n && arr[right] > arr[largest]) largest = right
        if (largest != i) {
            tmp := arr[i]; arr[i] = arr[largest]; arr[largest] = tmp
            heapify(arr, n, largest)
        }
    }

    static Int[] heapsort(Int[] arr) {
        n := arr.size
        for (i := n / 2 - 1; i >= 0; --i) heapify(arr, n, i)
        for (i := n - 1; i > 0; --i) {
            tmp := arr[0]; arr[0] = arr[i]; arr[i] = tmp
            heapify(arr, i, 0)
        }
        return arr
    }

    static Void main() {
        arr := [12, 11, 13, 5, 6, 7]
        echo(heapsort(arr))
    }
}
