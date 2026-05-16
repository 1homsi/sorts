__kernel void cocktailSort(__global int* arr, int n) {
    int swapped = 1;
    int start = 0;
    int end = n - 1;
    int tmp;
    while (swapped) {
        swapped = 0;
        for (int i = start; i < end; i++) {
            if (arr[i] > arr[i + 1]) {
                tmp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = tmp;
                swapped = 1;
            }
        }
        if (!swapped) break;
        swapped = 0;
        end--;
        for (int i = end - 1; i >= start; i--) {
            if (arr[i] > arr[i + 1]) {
                tmp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = tmp;
                swapped = 1;
            }
        }
        start++;
    }
}
