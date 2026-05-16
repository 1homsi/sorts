__kernel void quicksort_init(__global int* arr, __global int* stack_low, __global int* stack_high, __global int* sp, int n) {
    if (get_global_id(0) == 0) {
        *sp = 0;
        stack_low[0] = 0;
        stack_high[0] = n - 1;
        while (*sp >= 0) {
            int low = stack_low[*sp];
            int high = stack_high[*sp];
            (*sp)--;
            if (low < high) {
                int pivot = arr[high];
                int i = low;
                for (int j = low; j < high; j++) {
                    if (arr[j] <= pivot) {
                        int tmp = arr[i]; arr[i] = arr[j]; arr[j] = tmp;
                        i++;
                    }
                }
                int tmp = arr[i]; arr[i] = arr[high]; arr[high] = tmp;
                (*sp)++;
                stack_low[*sp] = low;
                stack_high[*sp] = i - 1;
                (*sp)++;
                stack_low[*sp] = i + 1;
                stack_high[*sp] = high;
            }
        }
    }
}
