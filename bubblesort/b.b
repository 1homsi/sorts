main() {
    auto arr[7], n, i, tmp, swapped;
    arr[0] = 64; arr[1] = 34; arr[2] = 25; arr[3] = 12;
    arr[4] = 22; arr[5] = 11; arr[6] = 90;
    n = 7;
    swapped = 1;
    while (swapped) {
        swapped = 0;
        i = 0;
        while (i < n-1) {
            if (arr[i] > arr[i+1]) {
                tmp = arr[i];
                arr[i] = arr[i+1];
                arr[i+1] = tmp;
                swapped = 1;
            }
            i++;
        }
        n--;
    }
    i = 0;
    while (i < 7) {
        putchar(arr[i] + '0');
        putchar(' ');
        i++;
    }
    putchar('*n');
}
