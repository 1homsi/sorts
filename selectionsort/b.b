selectionSort(arr, n) {
    auto i, j, minIdx, tmp;
    i = 0;
    while (i < n) {
        minIdx = i;
        j = i + 1;
        while (j < n) {
            if (arr[j] < arr[minIdx]) minIdx = j;
            j++;
        }
        tmp = arr[i]; arr[i] = arr[minIdx]; arr[minIdx] = tmp;
        i++;
    }
}
