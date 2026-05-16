import ceylon.language { Integer }

void compareAndSwap(variable Integer[] arr, Integer i, Integer j, Boolean direction) {
    if (direction == (arr[i] else 0 > (arr[j] else 0))) {
        value tmp = arr[i] else 0;
        arr = arr.patch([arr[j] else 0], i, 1);
        arr = arr.patch([tmp], j, 1);
    }
}

void bitonicMerge(variable Integer[] arr, Integer lo, Integer cnt, Boolean direction) {
    if (cnt > 1) {
        value k = cnt / 2;
        for (i in lo:k) {
            compareAndSwap(arr, i, i + k, direction);
        }
        bitonicMerge(arr, lo, k, direction);
        bitonicMerge(arr, lo + k, k, direction);
    }
}

void bitonicSort(variable Integer[] arr, Integer lo, Integer cnt, Boolean direction) {
    if (cnt > 1) {
        value k = cnt / 2;
        bitonicSort(arr, lo, k, true);
        bitonicSort(arr, lo + k, k, false);
        bitonicMerge(arr, lo, cnt, direction);
    }
}

shared void run() {
    variable Integer[] data = [3, 7, 4, 8, 6, 2, 1, 5];
    bitonicSort(data, 0, data.size, true);
    print(data);
}
