#include <stdio.h>
#include <process.h>

void cocktailsort(int arr[], int len) {
    int i = 0, k, temp;
    bool swapped;
    
    while (i < len) {
        swapped = false;
        for (k = 0; k < len - i - 1; k++) {
            if (arr[k] > arr[k + 1]) {
                temp = arr[k];
                arr[k] = arr[k + 1];
                arr[k + 1] = temp;
                swapped = true;
            }
        }
        if (!swapped) break;
        i++;
        swapped = false;
        for (k = len - i - 2; k >= 0; k--) {
            if (arr[k] > arr[k + 1]) {
                temp = arr[k];
                arr[k] = arr[k + 1];
                arr[k + 1] = temp;
                swapped = true;
            }
        }
        if (!swapped) break;
        i++;
    }
}

main() {
    int arr[] = {5, 2, 8, 1, 9, 3};
    cocktailsort(arr, 6);
    for (int i = 0; i < 6; i++) printf("%d ", arr[i]);
}
