heapsort(arr[], n) {
    for (new i = n / 2 - 1; i >= 0; i--) {
        siftdown(arr, i, n);
    }
    for (new i = n - 1; i > 0; i--) {
        new temp = arr[0];
        arr[0] = arr[i];
        arr[i] = temp;
        siftdown(arr, 0, i);
    }
}

siftdown(arr[], idx, n) {
    new largest = idx;
    new left = 2 * idx + 1;
    new right = 2 * idx + 2;
    
    if (left < n && arr[left] > arr[largest]) {
        largest = left;
    }
    if (right < n && arr[right] > arr[largest]) {
        largest = right;
    }
    if (largest != idx) {
        new temp = arr[idx];
        arr[idx] = arr[largest];
        arr[largest] = temp;
        siftdown(arr, largest, n);
    }
}

public main() {
    new arr[6] = {5, 2, 8, 1, 9, 3};
    heapsort(arr, 6);
    for (new i = 0; i < 6; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}
