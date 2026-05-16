stock selectionSort(arr[]) {
    new n = sizeof(arr);
    for (new i = 0; i < n - 1; i++) {
        new minIdx = i;
        for (new j = i + 1; j < n; j++) {
            if (arr[j] < arr[minIdx]) {
                minIdx = j;
            }
        }
        new tmp = arr[i];
        arr[i] = arr[minIdx];
        arr[minIdx] = tmp;
    }
    return 1;
}

main() {
    new arr[] = {5, 2, 8, 1, 9, 3};
    selectionSort(arr);
    for (new i = 0; i < sizeof(arr); i++) {
        printf("%d ", arr[i]);
    }
}