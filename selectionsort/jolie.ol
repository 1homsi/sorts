define SelectionSort {
    n = #arr;
    for i = 0 to n - 1 {
        minIdx = i;
        for j = i + 1 to n - 1 {
            if (arr[j] < arr[minIdx]) {
                minIdx = j
            }
        };
        tmp = arr[i];
        arr[i] = arr[minIdx];
        arr[minIdx] = tmp
    }
}
