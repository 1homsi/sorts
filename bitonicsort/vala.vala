void compare_and_swap (int[] arr, int i, int j, bool direction) {
    if (direction == (arr[i] > arr[j])) {
        int tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
    }
}

void bitonic_merge (int[] arr, int lo, int cnt, bool direction) {
    if (cnt > 1) {
        int k = cnt / 2;
        for (int i = lo; i < lo + k; i++) {
            compare_and_swap (arr, i, i + k, direction);
        }
        bitonic_merge (arr, lo, k, direction);
        bitonic_merge (arr, lo + k, k, direction);
    }
}

void bitonic_sort (int[] arr, int lo, int cnt, bool direction) {
    if (cnt > 1) {
        int k = cnt / 2;
        bitonic_sort (arr, lo, k, true);
        bitonic_sort (arr, lo + k, k, false);
        bitonic_merge (arr, lo, cnt, direction);
    }
}

void main () {
    int[] data = {3, 7, 4, 8, 6, 2, 1, 5};
    bitonic_sort (data, 0, data.length, true);
    foreach (int x in data) {
        stdout.printf ("%d ", x);
    }
    stdout.printf ("\n");
}
