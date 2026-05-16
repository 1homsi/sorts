public cocktailsort(arr[], len) {
    new i = 0, k, temp, swapped;
    while (i < len) {
        swapped = 0;
        for (k = 0; k < len - i - 1; k++) {
            if (arr[k] > arr[k + 1]) {
                temp = arr[k];
                arr[k] = arr[k + 1];
                arr[k + 1] = temp;
                swapped = 1;
            }
        }
        if (!swapped) break;
        i++;
        swapped = 0;
        for (k = len - i - 2; k >= 0; k--) {
            if (arr[k] > arr[k + 1]) {
                temp = arr[k];
                arr[k] = arr[k + 1];
                arr[k + 1] = temp;
                swapped = 1;
            }
        }
        if (!swapped) break;
        i++;
    }
}

main() {
    new arr[] = {5, 2, 8, 1, 9, 3};
    cocktailsort(arr, 6);
    print("Sorted");
}
