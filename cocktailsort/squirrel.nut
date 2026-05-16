function cocktailsort(arr) {
    local n = arr.len();
    local i = 0;
    while (i < n) {
        local swapped = false;
        for (local k = 0; k < n - i - 1; k++) {
            if (arr[k] > arr[k + 1]) {
                local temp = arr[k];
                arr[k] = arr[k + 1];
                arr[k + 1] = temp;
                swapped = true;
            }
        }
        if (!swapped) break;
        i++;
        swapped = false;
        for (local k = n - i - 2; k >= 0; k--) {
            if (arr[k] > arr[k + 1]) {
                local temp = arr[k];
                arr[k] = arr[k + 1];
                arr[k + 1] = temp;
                swapped = true;
            }
        }
        if (!swapped) break;
        i++;
    }
}

local arr = [5, 2, 8, 1, 9, 3];
cocktailsort(arr);
print("Sorted: " + arr + "\n");
