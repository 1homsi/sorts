__kernel void bucketSort(__global float* arr,
                         __global float* result,
                         const int n,
                         const float minV,
                         const float maxV) {
    __local float buckets[10][10];
    __local int counts[10];
    if (get_local_id(0) == 0) {
        for (int i = 0; i < n; i++) counts[i] = 0;
        for (int i = 0; i < n; i++) {
            int idx = (int)((arr[i] - minV) / (maxV - minV + 1.0f) * n);
            if (idx >= n) idx = n - 1;
            buckets[idx][counts[idx]++] = arr[i];
        }
        for (int b = 0; b < n; b++) {
            int m = counts[b];
            for (int i = 1; i < m; i++) {
                float key = buckets[b][i];
                int j = i - 1;
                while (j >= 0 && buckets[b][j] > key) {
                    buckets[b][j + 1] = buckets[b][j];
                    j--;
                }
                buckets[b][j + 1] = key;
            }
        }
        int pos = 0;
        for (int b = 0; b < n; b++) {
            for (int i = 0; i < counts[b]; i++) result[pos++] = buckets[b][i];
        }
    }
}
