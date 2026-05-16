gnomesort(arr, n) {
    auto i, tmp;
    i = 0;
    while (i < n) {
        if (i == 0 | arr[i] >= arr[i-1]) {
            i =+ 1;
        } else {
            tmp = arr[i];
            arr[i] = arr[i-1];
            arr[i-1] = tmp;
            i =- 1;
        }
    }
}
