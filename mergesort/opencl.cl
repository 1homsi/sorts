__kernel void merge_step(__global int* arr, __global int* tmp, int lo, int mid, int hi) {
    int i = lo, j = mid + 1, k = lo;
    while (i <= mid && j <= hi) {
        if (arr[i] <= arr[j]) tmp[k++] = arr[i++];
        else tmp[k++] = arr[j++];
    }
    while (i <= mid) tmp[k++] = arr[i++];
    while (j <= hi) tmp[k++] = arr[j++];
    for (int x = lo; x <= hi; x++) arr[x] = tmp[x];
}

void merge_sort_recursive(__global int* arr, __global int* tmp, int lo, int hi) {
    if (lo >= hi) return;
    int mid = (lo + hi) / 2;
    merge_sort_recursive(arr, tmp, lo, mid);
    merge_sort_recursive(arr, tmp, mid + 1, hi);
    merge_step(arr, tmp, lo, mid, hi);
}

__kernel void merge_sort(__global int* arr, __global int* tmp, int n) {
    merge_sort_recursive(arr, tmp, 0, n - 1);
}
