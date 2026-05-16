func cocktailsort(arr) {
    n = numberof(arr);
    i = 0;
    while (i < n) {
        swapped = 0;
        for (k = 1; k < n - i; k++) {
            if (arr(k) > arr(k + 1)) {
                temp = arr(k);
                arr(k) = arr(k + 1);
                arr(k + 1) = temp;
                swapped = 1;
            }
        }
        if (!swapped) break;
        i++;
        swapped = 0;
        for (k = n - i; k >= 1; k--) {
            if (arr(k) > arr(k + 1)) {
                temp = arr(k);
                arr(k) = arr(k + 1);
                arr(k + 1) = temp;
                swapped = 1;
            }
        }
        if (!swapped) break;
        i++;
    }
    return arr;
}

arr = [5, 2, 8, 1, 9, 3];
print, cocktailsort(arr);
