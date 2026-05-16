__kernel void pancakeSort(__global int* arr, int n) {
    for (int size = n; size > 1; size--) {
        int maxIdx = 0;
        for (int i = 1; i < size; i++) {
            if (arr[i] > arr[maxIdx]) maxIdx = i;
        }
        if (maxIdx != size - 1) {
            if (maxIdx != 0) {
                int left = 0, right = maxIdx, tmp;
                while (left < right) {
                    tmp = arr[left]; arr[left] = arr[right]; arr[right] = tmp;
                    left++; right--;
                }
            }
            int left = 0, right = size - 1, tmp;
            while (left < right) {
                tmp = arr[left]; arr[left] = arr[right]; arr[right] = tmp;
                left++; right--;
            }
        }
    }
}
