import std.stdio;
import std.algorithm : min;

enum MIN_RUN = 32;

void insertionSort(int[] arr, int left, int right) {
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
    int[] lp = arr[left .. mid + 1].dup;
    int[] rp = arr[mid + 1 .. right + 1].dup;
    int i = 0, j = 0, k = left;
    while (i < lp.length && j < rp.length) {
        if (lp[i] <= rp[j]) arr[k++] = lp[i++];
        else arr[k++] = rp[j++];
    }
    while (i < lp.length) arr[k++] = lp[i++];
    while (j < rp.length) arr[k++] = rp[j++];
}

void timsort(int[] arr) {
    int n = cast(int)arr.length;
    for (int i = 0; i < n; i += MIN_RUN) {
        insertionSort(arr, i, min(i + MIN_RUN - 1, n - 1));
    }
    for (int size = MIN_RUN; size < n; size *= 2) {
        for (int left = 0; left < n; left += 2 * size) {
            int mid = min(left + size - 1, n - 1);
            int right = min(left + 2 * size - 1, n - 1);
            if (mid < right) merge(arr, left, mid, right);
        }
    }
}

void main() {
    int[] arr = [5, 2, 8, 1, 9, 3, 7, 4, 6];
    timsort(arr);
    writeln(arr);
}
