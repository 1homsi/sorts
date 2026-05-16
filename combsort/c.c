#include <stdio.h>

void comb_sort(int arr[], int n) {
    int gap = n;
    double shrink = 1.3;
    int sorted = 0;
    while (!sorted) {
        gap = (int)(gap / shrink);
        if (gap <= 1) {
            gap = 1;
            sorted = 1;
        }
        for (int i = 0; i + gap < n; i++) {
            if (arr[i] > arr[i + gap]) {
                int tmp = arr[i];
                arr[i] = arr[i + gap];
                arr[i + gap] = tmp;
                sorted = 0;
            }
        }
    }
}
