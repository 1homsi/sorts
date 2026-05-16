void stooge_sort(int[] arr, int first, int last) {
    if (arr[first] > arr[last]) {
        int tmp = arr[first];
        arr[first] = arr[last];
        arr[last] = tmp;
    }
    if (last - first + 1 > 2) {
        int t = (last - first + 1) * 2 / 3;
        stooge_sort(arr, first, first + t - 1);
        stooge_sort(arr, last - t + 1, last);
        stooge_sort(arr, first, first + t - 1);
    }
}

void main() {
    int[] arr = {3, 1, 4, 1, 5, 9, 2, 6};
    stooge_sort(arr, 0, arr.length - 1);
    foreach (int x in arr) stdout.printf("%d ", x);
    stdout.printf("\n");
}
