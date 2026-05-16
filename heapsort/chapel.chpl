proc heapify(arr: [] int, n: int, i: int) {
    var largest = i;
    var left = 2 * i + 1;
    var right = 2 * i + 2;
    if left < n && arr[left] > arr[largest] then largest = left;
    if right < n && arr[right] > arr[largest] then largest = right;
    if largest != i {
        arr[i] <=> arr[largest];
        heapify(arr, n, largest);
    }
}

proc heapsort(arr: [] int) {
    var n = arr.size;
    for i in (n/2 - 1)..0 by -1 do heapify(arr, n, i);
    for i in (n-1)..1 by -1 {
        arr[0] <=> arr[i];
        heapify(arr, i, 0);
    }
}

var arr = [12, 11, 13, 5, 6, 7];
heapsort(arr);
writeln(arr);
