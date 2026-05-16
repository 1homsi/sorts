main() {
    auto arr[6], n, i, tmp;
    arr[0] = 12; arr[1] = 11; arr[2] = 13;
    arr[3] = 5;  arr[4] = 6;  arr[5] = 7;
    n = 6;

    i = n/2 - 1;
    while (i >= 0) {
        heapify(arr, n, i);
        i--;
    }
    i = n - 1;
    while (i > 0) {
        tmp = arr[0]; arr[0] = arr[i]; arr[i] = tmp;
        heapify(arr, i, 0);
        i--;
    }
    i = 0;
    while (i < n) { putchar(arr[i] + '0'); putchar(' '); i++; }
    putchar('\n');
}

heapify(arr, n, i) {
    auto largest, left, right, tmp;
    largest = i; left = 2*i+1; right = 2*i+2;
    if (left < n & arr[left] > arr[largest]) largest = left;
    if (right < n & arr[right] > arr[largest]) largest = right;
    if (largest != i) {
        tmp = arr[i]; arr[i] = arr[largest]; arr[largest] = tmp;
        heapify(arr, n, largest);
    }
}
