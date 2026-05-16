#include <stdio.h>
void bucket_sort(int arr[], int maxVal) {
    int buckets[10] = {0};
    for (int i = 0; i < 6; i++) {
        buckets[arr[i]]++;
    }
    int result[6], idx = 0;
    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < buckets[i]; j++) {
            result[idx++] = i;
        }
    }
    for (int i = 0; i < 6; i++) {
        printf("%d ", result[i]);
    }
    printf("\n");
}
process main(void) {
    int arr[] = {5, 2, 8, 1, 9, 3};
    bucket_sort(arr, 10);
}