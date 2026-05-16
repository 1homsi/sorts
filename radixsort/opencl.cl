__kernel void counting_sort_kernel(__global int* arr,
                                    __global int* output,
                                    __global int* count,
                                    int n,
                                    int exp) {
    int i = get_global_id(0);
    if (i == 0) {
        for (int k = 0; k < 10; k++) count[k] = 0;
        for (int k = 0; k < n; k++) count[(arr[k] / exp) % 10]++;
        for (int k = 1; k < 10; k++) count[k] += count[k - 1];
        for (int k = n - 1; k >= 0; k--) {
            int idx = (arr[k] / exp) % 10;
            count[idx]--;
            output[count[idx]] = arr[k];
        }
        for (int k = 0; k < n; k++) arr[k] = output[k];
    }
}
