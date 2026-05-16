__kernel void insertion_sort(__global int* arr, int left, int right) {
    for (int i = left + 1; i <= right; i++) {
        int key = arr[i];
        int j = i - 1;
        while (j >= left && arr[j] > key) {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[j + 1] = key;
    }
}

__kernel void merge_runs(__global int* arr, int left, int mid, int right,
                         __local int* lp, __local int* rp) {
    int ln = mid - left + 1;
    int rn = right - mid;
    for (int i = 0; i < ln; i++) lp[i] = arr[left + i];
    for (int i = 0; i < rn; i++) rp[i] = arr[mid + 1 + i];
    int i = 0, j = 0, k = left;
    while (i < ln && j < rn) {
        if (lp[i] <= rp[j]) arr[k++] = lp[i++];
        else arr[k++] = rp[j++];
    }
    while (i < ln) arr[k++] = lp[i++];
    while (j < rn) arr[k++] = rp[j++];
}

__kernel void timsort_runs(__global int* arr, int n, int min_run) {
    int gid = get_global_id(0);
    int i = gid * min_run;
    if (i < n) {
        int right = min(i + min_run - 1, n - 1);
        for (int x = i + 1; x <= right; x++) {
            int key = arr[x];
            int j = x - 1;
            while (j >= i && arr[j] > key) {
                arr[j + 1] = arr[j];
                j--;
            }
            arr[j + 1] = key;
        }
    }
}
