shared void selectionSort(Array<Integer> arr) {
    value n = arr.size;
    for (i in 0:n) {
        variable value minIdx = i;
        for (j in (i+1):n) {
            if (exists aj = arr[j], exists am = arr[minIdx], aj < am) {
                minIdx = j;
            }
        }
        value tmp = arr[i];
        arr[i] = arr[minIdx];
        arr[minIdx] = tmp;
    }
}
