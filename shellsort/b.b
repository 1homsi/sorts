main() {
    auto arr[7], n, gap, i, j, temp;
    arr[0] = 64; arr[1] = 34; arr[2] = 25; arr[3] = 12;
    arr[4] = 22; arr[5] = 11; arr[6] = 90;
    n = 7;
    gap = n / 2;
    while (gap > 0) {
        i = gap;
        while (i < n) {
            temp = arr[i];
            j = i;
            while (j >= gap & arr[j - gap] > temp) {
                arr[j] = arr[j - gap];
                j = j - gap;
            }
            arr[j] = temp;
            i = i + 1;
        }
        gap = gap / 2;
    }
    i = 0;
    while (i < n) {
        printf("%d ", arr[i]);
        i = i + 1;
    }
    printf("*n");
}
