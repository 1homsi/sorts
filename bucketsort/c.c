#include <stdio.h>
#include <stdlib.h>

void insertion_sort(double *bucket, int n) {
    for (int i = 1; i < n; i++) {
        double key = bucket[i];
        int j = i - 1;
        while (j >= 0 && bucket[j] > key) {
            bucket[j + 1] = bucket[j];
            j--;
        }
        bucket[j + 1] = key;
    }
}

void bucket_sort(double *arr, int n) {
    if (n <= 0) return;
    double min = arr[0], max = arr[0];
    for (int i = 1; i < n; i++) {
        if (arr[i] < min) min = arr[i];
        if (arr[i] > max) max = arr[i];
    }
    double **buckets = calloc(n, sizeof(double *));
    int *sizes = calloc(n, sizeof(int));
    for (int i = 0; i < n; i++) buckets[i] = malloc(n * sizeof(double));
    for (int i = 0; i < n; i++) {
        int idx = (int)((arr[i] - min) / (max - min + 1.0) * n);
        if (idx >= n) idx = n - 1;
        buckets[idx][sizes[idx]++] = arr[i];
    }
    int pos = 0;
    for (int i = 0; i < n; i++) {
        insertion_sort(buckets[i], sizes[i]);
        for (int j = 0; j < sizes[i]; j++) arr[pos++] = buckets[i][j];
        free(buckets[i]);
    }
    free(buckets);
    free(sizes);
}

int main() {
    double data[] = {0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68};
    int n = 10;
    bucket_sort(data, n);
    for (int i = 0; i < n; i++) printf("%.2f ", data[i]);
    printf("\n");
    return 0;
}
