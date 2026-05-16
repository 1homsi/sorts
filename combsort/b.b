combsort(arr, n) {
    auto gap, sorted, i, tmp;
    gap = n;
    sorted = 0;
    while (!sorted) {
        gap = gap * 10 / 13;
        if (gap <= 1) {
            gap = 1;
            sorted = 1;
        }
        i = 0;
        while (i + gap < n) {
            if (arr[i] > arr[i + gap]) {
                tmp = arr[i];
                arr[i] = arr[i + gap];
                arr[i + gap] = tmp;
                sorted = 0;
            }
            i++;
        }
    }
}
