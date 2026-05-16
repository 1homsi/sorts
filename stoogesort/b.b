main() {
    auto arr[8], i, n;
    n = 8;
    arr[0] = 3; arr[1] = 1; arr[2] = 4; arr[3] = 1;
    arr[4] = 5; arr[5] = 9; arr[6] = 2; arr[7] = 6;
    stoogesort(arr, 0, n - 1);
    i = 0;
    while (i < n) {
        printf("%d ", arr[i]);
        i++;
    }
    printf("\n");
}

stoogesort(arr, first, last) {
    auto tmp, t, na;
    if (arr[first] > arr[last]) {
        tmp = arr[first];
        arr[first] = arr[last];
        arr[last] = tmp;
    }
    na = last - first + 1;
    if (na > 2) {
        t = na * 2 / 3;
        stoogesort(arr, first, first + t - 1);
        stoogesort(arr, last - t + 1, last);
        stoogesort(arr, first, first + t - 1);
    }
}
