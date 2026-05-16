__kernel void bubbleSort(__global int* arr, int n) {
    for (int k = 0; k < n; k++) {
        for (int i = 0; i < n - 1 - k; i++) {
            if (arr[i] > arr[i + 1]) {
                int tmp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = tmp;
            }
        }
    }
}
