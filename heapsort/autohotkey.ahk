arr := [12, 11, 13, 5, 6, 7]
n := arr.Length

Heapify(arr, n, i) {
    largest := i
    left := 2 * i
    right := 2 * i + 1
    if (left <= n and arr[left] > arr[largest])
        largest := left
    if (right <= n and arr[right] > arr[largest])
        largest := right
    if (largest != i) {
        tmp := arr[i], arr[i] := arr[largest], arr[largest] := tmp
        Heapify(arr, n, largest)
    }
}

Heapsort(arr) {
    n := arr.Length
    Loop Floor(n / 2) {
        Heapify(arr, n, Floor(n / 2) + 1 - A_Index)
    }
    Loop n - 1 {
        i := n + 1 - A_Index
        tmp := arr[1], arr[1] := arr[i], arr[i] := tmp
        Heapify(arr, i - 1, 1)
    }
}

Heapsort(arr)
result := ""
for v in arr
    result .= v " "
MsgBox result
