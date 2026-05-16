shared void insertionSort(Array<Integer> arr) {
    value n = arr.size;
    for (i in 1:n-1) {
        assert (exists key = arr[i]);
        variable value j = i - 1;
        while (j >= 0) {
            assert (exists aj = arr[j]);
            if (aj <= key) { break; }
            arr[j+1] = aj;
            j--;
        }
        arr[j+1] = key;
    }
}
