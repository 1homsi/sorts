main() {
    auto arr[8], n, i, j, tmp, sorted;
    n = 8;
    arr[0] = 3; arr[1] = 1; arr[2] = 4; arr[3] = 1;
    arr[4] = 5; arr[5] = 9; arr[6] = 2; arr[7] = 6;

    while (!issorted(arr, n)) shuffle(arr, n);

    i = 0;
    while (i < n) { putchar(arr[i] + '0'); putchar(' '); i++; }
    putchar('*n');
}

issorted(arr, n) {
    auto i;
    i = 0;
    while (i < n - 1) {
        if (arr[i] > arr[i+1]) return(0);
        i++;
    }
    return(1);
}

shuffle(arr, n) {
    auto i, j, tmp;
    i = n - 1;
    while (i > 0) {
        j = rand() % (i + 1);
        tmp = arr[i]; arr[i] = arr[j]; arr[j] = tmp;
        i--;
    }
}
