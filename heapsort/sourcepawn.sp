public void HeapSort(int arr[], int size) {
    for (int i = size / 2 - 1; i >= 0; i--) {
        SiftDown(arr, i, size);
    }
    for (int i = size - 1; i > 0; i--) {
        int temp = arr[0];
        arr[0] = arr[i];
        arr[i] = temp;
        SiftDown(arr, 0, i);
    }
}

public void SiftDown(int arr[], int idx, int n) {
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
        SiftDown(arr, largest, n);
    }
}

public void main() {
    int arr[6] = {5, 2, 8, 1, 9, 3};
    HeapSort(arr, 6);
    for (int i = 0; i < 6; i++) {
        PrintToChat(null, "%d ", arr[i]);
    }
}
