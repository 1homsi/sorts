void insertion_sort(int[] arr, int left, int right) {
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

void merge(int[] arr, int left, int mid, int right) {
    int ln = mid - left + 1;
    int rn = right - mid;
    int[] lp = new int[ln];
    int[] rp = new int[rn];
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

void timsort(int[] arr) {
    int n = arr.length;
    int min_run = 32;
    for (int i = 0; i < n; i += min_run) {
        insertion_sort(arr, i, int.min(i + min_run - 1, n - 1));
    }
    for (int size = min_run; size < n; size *= 2) {
        for (int left = 0; left < n; left += 2 * size) {
            int mid = int.min(left + size - 1, n - 1);
            int right = int.min(left + 2 * size - 1, n - 1);
            if (mid < right) merge(arr, left, mid, right);
        }
    }
}

void main() {
    int[] arr = {5, 2, 8, 1, 9, 3, 7, 4, 6};
    timsort(arr);
    foreach (int x in arr) stdout.printf("%d ", x);
    stdout.printf("\n");
}
