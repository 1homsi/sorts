fun void heapsort(int arr[]) {
    int n = arr.cap();
    for (int i = n / 2 - 1; i >= 0; i--) {
        siftdown(arr, i, n);
    }
    for (int i = n - 1; i > 0; i--) {
        int temp = arr[0];
        arr[0] = arr[i];
        arr[i] = temp;
        siftdown(arr, 0, i);
    }
}

fun void siftdown(int arr[], int idx, int n) {
    int largest = idx;
    int left = 2 * idx + 1;
    int right = 2 * idx + 2;
    
    if (left < n && arr[left] > arr[largest]) {
        largest = left;
    }
    if (right < n && arr[right] > arr[largest]) {
        largest = right;
    }
    if (largest != idx) {
        int temp = arr[idx];
        arr[idx] = arr[largest];
        arr[largest] = temp;
        siftdown(arr, largest, n);
    }
}

int arr[6];
arr[0] = 5; arr[1] = 2; arr[2] = 8; arr[3] = 1; arr[4] = 9; arr[5] = 3;
heapsort(arr);
for (int i = 0; i < arr.cap(); i++) {
    <<< arr[i] >>>;
}
