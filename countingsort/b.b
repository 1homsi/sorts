main() {
    auto arr[7], count[256], output[7];
    auto n, i, mn, mx, range, idx;

    arr[0] = 4; arr[1] = 2; arr[2] = 2; arr[3] = 8;
    arr[4] = 3; arr[5] = 3; arr[6] = 1;
    n = 7;

    mn = arr[0]; mx = arr[0];
    i = 1;
    while (i < n) {
        if (arr[i] < mn) mn = arr[i];
        if (arr[i] > mx) mx = arr[i];
        i++;
    }

    range = mx - mn + 1;
    i = 0;
    while (i < range) { count[i] = 0; i++; }

    i = 0;
    while (i < n) { count[arr[i] - mn]++; i++; }

    i = 1;
    while (i < range) { count[i] =+ count[i-1]; i++; }

    i = n - 1;
    while (i >= 0) {
        idx = arr[i] - mn;
        count[idx]--;
        output[count[idx]] = arr[i];
        i--;
    }

    i = 0;
    while (i < n) { printf("%d ", output[i]); i++; }
    printf("
");
}
