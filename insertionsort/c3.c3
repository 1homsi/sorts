module insertionsort;

fn void insertion_sort(int[] arr) {
    usz n = arr.len;
    for (usz i = 1; i < n; i++) {
        int key = arr[i];
        isz j = (isz)i - 1;
        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[j + 1] = key;
    }
}
