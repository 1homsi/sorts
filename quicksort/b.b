main() {
    auto arr[7];
    arr[0] = 3; arr[1] = 6; arr[2] = 8; arr[3] = 10;
    arr[4] = 1; arr[5] = 2; arr[6] = 1;
    quicksort(arr, 0, 6);
    auto i;
    i = 0;
    while (i <= 6) {
        printf("%d ", arr[i]);
        i++;
    }
    printf("*n");
}

partition(arr, low, high) {
    auto pivot, i, j, tmp;
    pivot = arr[high];
    i = low;
    j = low;
    while (j < high) {
        if (arr[j] <= pivot) {
            tmp = arr[i]; arr[i] = arr[j]; arr[j] = tmp;
            i++;
        }
        j++;
    }
    tmp = arr[i]; arr[i] = arr[high]; arr[high] = tmp;
    return i;
}

quicksort(arr, low, high) {
    auto p;
    if (low < high) {
        p = partition(arr, low, high);
        quicksort(arr, low, p - 1);
        quicksort(arr, p + 1, high);
    }
}
