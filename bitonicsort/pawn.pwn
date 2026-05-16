public BitonicSort(arr[], lo, cnt, dir) {
    if (cnt > 1) {
        new k = cnt / 2;
        BitonicSort(arr, lo, k, 1);
        BitonicSort(arr, lo + k, k, 0);
        BitonicMerge(arr, lo, cnt, dir);
    }
}

public BitonicMerge(arr[], lo, cnt, dir) {
    if (cnt > 1) {
        new k = cnt / 2;
        for (new i = lo; i < lo + cnt - k; i++) {
            if ((arr[i] > arr[i + k]) == (dir == 1)) {
                new tmp = arr[i];
                arr[i] = arr[i + k];
                arr[i + k] = tmp;
            }
        }
        BitonicMerge(arr, lo, k, dir);
        BitonicMerge(arr, lo + k, k, dir);
    }
}

main() {
    new arr[8] = {5, 2, 8, 1, 9, 3, 7, 4};
    BitonicSort(arr, 0, 8, 1);
    for (new i = 0; i < 8; i++) {
        printf("%d ", arr[i]);
    }
}
