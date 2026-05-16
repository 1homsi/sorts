function heapsort(arr) {
    local n = arr.len();
    for (local i = (n / 2) - 1; i >= 0; i--) {
        siftdown(arr, i, n);
    }
    for (local i = n - 1; i > 0; i--) {
        local temp = arr[0];
        arr[0] = arr[i];
        arr[i] = temp;
        siftdown(arr, 0, i);
    }
}

function siftdown(arr, i, n) {
    local largest = i;
    local left = 2 * i + 1;
    local right = 2 * i + 2;
    if (left < n && arr[left] > arr[largest]) largest = left;
    if (right < n && arr[right] > arr[largest]) largest = right;
    if (largest != i) {
        local temp = arr[i];
        arr[i] = arr[largest];
        arr[largest] = temp;
        siftdown(arr, largest, n);
    }
}

local arr = [5, 2, 8, 1, 9, 3];
heapsort(arr);
print(arr + "\n");
