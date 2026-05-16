main() {
    auto arr[8], output[8], count[10];
    auto n, i, maxVal, exp, idx;
    n = 8;
    arr[0] = 170; arr[1] = 45; arr[2] = 75; arr[3] = 90;
    arr[4] = 802; arr[5] = 24; arr[6] = 2;  arr[7] = 66;
    maxVal = arr[0];
    i = 1;
    while (i < n) {
        if (arr[i] > maxVal) maxVal = arr[i];
        i++;
    }
    exp = 1;
    while (maxVal / exp > 0) {
        i = 0;
        while (i < 10) { count[i] = 0; i++; }
        i = 0;
        while (i < n) {
            idx = (arr[i] / exp) % 10;
            count[idx]++;
            i++;
        }
        i = 1;
        while (i < 10) { count[i] =+ count[i-1]; i++; }
        i = n - 1;
        while (i >= 0) {
            idx = (arr[i] / exp) % 10;
            count[idx]--;
            output[count[idx]] = arr[i];
            i--;
        }
        i = 0;
        while (i < n) { arr[i] = output[i]; i++; }
        exp =* 10;
    }
    i = 0;
    while (i < n) { printf("%d ", arr[i]); i++; }
    printf("*n");
}
