func heapsort(&arr) {
    n = numberof(arr);
    for (i = (n / 2) - 1; i >= 0; i--) {
        siftdown, arr, i, n;
    }
    for (i = n - 1; i > 0; i--) {
        temp = arr(1);
        arr(1) = arr(i);
        arr(i) = temp;
        siftdown, arr, 0, i;
    }
}

func siftdown(&arr, idx, n) {
    largest = idx;
    left = 2 * idx + 1;
    right = 2 * idx + 2;
    if (left < n && arr(left) > arr(largest)) {
        largest = left;
    }
    if (right < n && arr(right) > arr(largest)) {
        largest = right;
    }
    if (largest != idx) {
        temp = arr(idx);
        arr(idx) = arr(largest);
        arr(largest) = temp;
        siftdown, arr, largest, n;
    }
}

arr = [5, 2, 8, 1, 9, 3];
heapsort, arr;
print, arr;
