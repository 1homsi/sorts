void stooge_sort(__global int* arr, int first, int last) {
    if (arr[first] > arr[last]) {
        int tmp = arr[first];
        arr[first] = arr[last];
        arr[last] = tmp;
    }
    int n = last - first + 1;
    if (n > 2) {
        int t = n * 2 / 3;
        stooge_sort(arr, first, first + t - 1);
        stooge_sort(arr, last - t + 1, last);
        stooge_sort(arr, first, first + t - 1);
    }
}

__kernel void sort(__global int* arr, int n) {
    if (get_global_id(0) == 0) {
        stooge_sort(arr, 0, n - 1);
    }
}
