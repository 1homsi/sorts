__kernel void gnomeSort(__global int* arr, int n) {
    int i = 0;
    while (i < n) {
        if (i == 0 || arr[i] >= arr[i - 1]) {
            i++;
        } else {
            int tmp = arr[i];
            arr[i] = arr[i - 1];
            arr[i - 1] = tmp;
            i--;
        }
    }
}
