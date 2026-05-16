import std.algorithm : swap;

void selectionSort(int[] arr) {
    size_t n = arr.length;
    for (size_t i = 0; i < n; i++) {
        size_t minIdx = i;
        for (size_t j = i + 1; j < n; j++) {
            if (arr[j] < arr[minIdx]) minIdx = j;
        }
        swap(arr[i], arr[minIdx]);
    }
}
