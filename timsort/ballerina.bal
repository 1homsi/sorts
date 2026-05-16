import ballerina/io;

const int MIN_RUN = 32;

function insertionSort(int[] arr, int left, int right) {
    int i = left + 1;
    while i <= right {
        int key = arr[i];
        int j = i - 1;
        while j >= left && arr[j] > key {
            arr[j + 1] = arr[j];
            j -= 1;
        }
        arr[j + 1] = key;
        i += 1;
    }
}

function mergeRuns(int[] arr, int left, int mid, int right) {
    int[] lp = arr.slice(left, mid + 1).clone();
    int[] rp = arr.slice(mid + 1, right + 1).clone();
    int i = 0; int j = 0; int k = left;
    while i < lp.length() && j < rp.length() {
        if lp[i] <= rp[j] { arr[k] = lp[i]; i += 1; }
        else { arr[k] = rp[j]; j += 1; }
        k += 1;
    }
    while i < lp.length() { arr[k] = lp[i]; i += 1; k += 1; }
    while j < rp.length() { arr[k] = rp[j]; j += 1; k += 1; }
}

function timsort(int[] arr) {
    int n = arr.length();
    int i = 0;
    while i < n {
        insertionSort(arr, i, int:min(i + MIN_RUN - 1, n - 1));
        i += MIN_RUN;
    }
    int size = MIN_RUN;
    while size < n {
        int left = 0;
        while left < n {
            int mid = int:min(left + size - 1, n - 1);
            int right = int:min(left + 2 * size - 1, n - 1);
            if mid < right { mergeRuns(arr, left, mid, right); }
            left += 2 * size;
        }
        size *= 2;
    }
}

public function main() {
    int[] arr = [5, 2, 8, 1, 9, 3, 7, 4, 6];
    timsort(arr);
    io:println(arr);
}
