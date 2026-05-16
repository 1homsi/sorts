main() {
    auto arr[7], tmp[7], i;
    arr[0] = 38; arr[1] = 27; arr[2] = 43; arr[3] = 3;
    arr[4] = 9;  arr[5] = 82; arr[6] = 10;
    msort(arr, tmp, 0, 6);
    i = 0;
    while (i <= 6) {
        putchar(arr[i] + '0');
        putchar(' ');
        i =+ 1;
    }
    putchar('*n');
}

merge(arr, tmp, lo, mid, hi) {
    auto i, j, k;
    i = lo; j = mid + 1; k = lo;
    while (i <= mid & j <= hi) {
        if (arr[i] <= arr[j]) { tmp[k] = arr[i]; i =+ 1; }
        else { tmp[k] = arr[j]; j =+ 1; }
        k =+ 1;
    }
    while (i <= mid) { tmp[k] = arr[i]; i =+ 1; k =+ 1; }
    while (j <= hi)  { tmp[k] = arr[j]; j =+ 1; k =+ 1; }
    i = lo;
    while (i <= hi) { arr[i] = tmp[i]; i =+ 1; }
}

msort(arr, tmp, lo, hi) {
    auto mid;
    if (lo >= hi) return;
    mid = (lo + hi) / 2;
    msort(arr, tmp, lo, mid);
    msort(arr, tmp, mid + 1, hi);
    merge(arr, tmp, lo, mid, hi);
}
