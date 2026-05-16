function heapify(arr, n, i,    largest, left, right, tmp) {
    largest = i
    left = 2 * i + 1
    right = 2 * i + 2
    if (left < n && arr[left] > arr[largest]) largest = left
    if (right < n && arr[right] > arr[largest]) largest = right
    if (largest != i) {
        tmp = arr[i]; arr[i] = arr[largest]; arr[largest] = tmp
        heapify(arr, n, largest)
    }
}

function heapsort(arr, n,    i, tmp) {
    for (i = int(n/2) - 1; i >= 0; i--) heapify(arr, n, i)
    for (i = n - 1; i > 0; i--) {
        tmp = arr[0]; arr[0] = arr[i]; arr[i] = tmp
        heapify(arr, i, 0)
    }
}

BEGIN {
    arr[0]=12; arr[1]=11; arr[2]=13; arr[3]=5; arr[4]=6; arr[5]=7
    n = 6
    heapsort(arr, n)
    for (i = 0; i < n; i++) printf "%d ", arr[i]
    print ""
}
