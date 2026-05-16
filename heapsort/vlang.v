fn heapify(mut arr []int, n int, i int) {
    mut largest := i
    left := 2 * i + 1
    right := 2 * i + 2
    if left < n && arr[left] > arr[largest] { largest = left }
    if right < n && arr[right] > arr[largest] { largest = right }
    if largest != i {
        arr[i], arr[largest] = arr[largest], arr[i]
        heapify(mut arr, n, largest)
    }
}

fn heapsort(mut arr []int) {
    n := arr.len
    for i := n / 2 - 1; i >= 0; i-- { heapify(mut arr, n, i) }
    for i := n - 1; i > 0; i-- {
        arr[0], arr[i] = arr[i], arr[0]
        heapify(mut arr, i, 0)
    }
}

fn main() {
    mut arr := [12, 11, 13, 5, 6, 7]
    heapsort(mut arr)
    println(arr)
}
