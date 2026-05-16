implement Sort;

include "sys.m";
include "draw.m";

cocktailsort(arr: array of int): array of int {
    n := len arr;
    i := 0;
    while (i < n) {
        swapped := 0;
        for (k := 0; k < n - i - 1; k++) {
            if (arr[k] > arr[k + 1]) {
                temp := arr[k];
                arr[k] = arr[k + 1];
                arr[k + 1] = temp;
                swapped = 1;
            }
        }
        if (!swapped) break;
        i++;
        swapped = 0;
        for (k = n - i - 2; k >= 0; k--) {
            if (arr[k] > arr[k + 1]) {
                temp := arr[k];
                arr[k] = arr[k + 1];
                arr[k + 1] = temp;
                swapped = 1;
            }
        }
        if (!swapped) break;
        i++;
    }
    return arr;
}
