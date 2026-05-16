void flip(int[] arr, int k) {
    int left = 0, right = k, tmp;
    while (left < right) {
        tmp = arr[left]; arr[left] = arr[right]; arr[right] = tmp;
        left++; right--;
    }
}

void pancake_sort(int[] arr) {
    int size = arr.length;
    while (size > 1) {
        int max_idx = 0;
        for (int i = 1; i < size; i++) {
            if (arr[i] > arr[max_idx]) max_idx = i;
        }
        if (max_idx != size - 1) {
            if (max_idx != 0) flip(arr, max_idx);
            flip(arr, size - 1);
        }
        size--;
    }
}

void main() {
    int[] arr = {3, 6, 2, 7, 4, 1, 5};
    pancake_sort(arr);
    foreach (int v in arr) stdout.printf("%d ", v);
    stdout.printf("\n");
}
